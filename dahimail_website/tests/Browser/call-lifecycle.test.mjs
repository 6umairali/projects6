import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import vm from 'node:vm';
const source = readFileSync(new URL('../../public/js/friend-call.js', import.meta.url), 'utf8')
  .replace('  window.FriendCall =', '  window.testCalls = { S: S, accept: accept, decline: decline, poll: pollCalls };\n  window.FriendCall =');
const flush = () => new Promise(resolve => setImmediate(resolve));
function harness() {
  const requests = [], listeners = new Map(), timers = [];
  const element = () => ({ style: {}, appendChild() {}, setAttribute() {} });
  const document = { title: 'Dahimail', hidden: false, querySelector() { return null; },
    createElement: element, body: element(), addEventListener() {} };
  const window = { addEventListener(name, fn) { listeners.set(name, fn); } };
  vm.runInNewContext(source, { window, document, Set, URL, URLSearchParams,
    location: { search: '', origin: 'https://mail.test' }, history: { replaceState() {} },
    setInterval() {}, clearInterval() {}, setTimeout(fn, ms) { timers.push({fn, ms}); }, clearTimeout() {},
    fetch(url, options) { return new Promise((resolve, reject) => requests.push({ url, options, resolve, reject })); },
  });
  return { api: window.testCalls, listeners, requests, timers };
}
const incoming = { id: 9, peer: { id: 2, name: 'Alice' }, video: true, meeting: 'room' };
const response = data => ({ status: 200, json: async () => ({ data }) });

test('terminal socket event prevents an in-flight poll resurrecting its incoming call', async () => {
  const h = harness();
  h.listeners.get('dahi:sync')({ detail: { type: 'call_cancel', call_id: 9, reason: 'ended' } });
  h.requests[0].resolve(response({ incoming })); await flush();
  assert.equal(h.api.S.incoming, null);
  assert.equal(h.requests.length, 2, 'busy invalidation triggers immediate follow-up');
});

test('accept is single flight and a late answer cannot navigate after cancellation', async () => {
  const h = harness(); h.requests[0].resolve(response({ incoming })); await flush();
  h.api.accept(); h.api.accept();
  assert.equal(h.requests.filter(r => r.url.endsWith('/answer')).length, 1);
  h.listeners.get('dahi:sync')({ detail: { type: 'call_cancel', call_id: 9, reason: 'cancelled' } });
  h.requests.find(r => r.url.endsWith('/answer')).resolve(response({})); await flush();
  assert.equal(h.api.S.call, null); assert.equal(h.api.S.incoming, null);
});

test('decline hides immediately, survives navigation, retries a transient failure', async () => {
  const h = harness(); h.requests[0].resolve(response({ incoming })); await flush();
  h.api.decline(); assert.equal(h.api.S.incoming, null);
  const first = h.requests.find(r => r.url.endsWith('/decline'));
  assert.equal(first.options.keepalive, true);
  first.reject(new Error('offline')); await flush();
  h.timers.find(t => t.ms === 300).fn(); await flush();
  assert.equal(h.requests.filter(r => r.url.endsWith('/decline')).length, 2);
  h.api.poll(); h.requests.at(-1).resolve(response({ incoming })); await flush();
  assert.equal(h.api.S.incoming, null);
});
