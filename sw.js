const CACHE = 'ticket-wallet-v1';
const ASSETS = [
  '/',
  '/index.html',
  '/manifest.json',
  '/lib/pdf.min.js',
  '/lib/pdf.worker.min.js',
  '/lib/zxing.min.js',
  '/lib/zxing_reader.wasm',
  '/lib/idb-keyval.min.js',
  '/icons/icon-192.png',
  '/icons/icon-512.png',
];

self.addEventListener('install', e => {
  e.waitUntil(caches.open(CACHE).then(c => c.addAll(ASSETS)));
  self.skipWaiting();
});

self.addEventListener('activate', e => {
  e.waitUntil(caches.keys().then(keys =>
    Promise.all(keys.filter(k => k !== CACHE).map(k => caches.delete(k)))
  ));
  self.clients.claim();
});

self.addEventListener('fetch', e => {
  e.respondWith(caches.match(e.request).then(r => r || fetch(e.request)));
});
