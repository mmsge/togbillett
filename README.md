# Ticket Wallet

A fully local Progressive Web App for storing and displaying PDF tickets on Android. No server, no accounts, no network requests after setup. All PDF rendering and barcode detection (QR, Aztec, PDF417, and more) happens on-device. Data persists in IndexedDB between sessions.

## Quick start

### 1. Download vendor libraries

```bash
bash download-deps.sh
```

This downloads PDF.js, ZXing WASM, and idb-keyval into `lib/`. Run once.

### 2. Replace placeholder icons (optional)

Drop any square PNG into `icons/` to replace the placeholders:

- `icons/icon-192.png` — 192×192 px
- `icons/icon-512.png` — 512×512 px

### 3. Serve locally

```bash
python3 -m http.server 8080
```

Open `http://localhost:8080` in Chrome.

### 4. Install on Android

1. Connect phone to the same WiFi as your laptop
2. Find your laptop's local IP: `ip addr` (Linux/Mac) or `ipconfig` (Windows)
3. On phone: open Chrome → `http://[laptop-ip]:8080`
4. Tap Chrome menu (⋮) → **Add to Home Screen**
5. Stop the Python server — the app now works fully offline

## Using the app

- Tap **📂 Add PDF tickets** to import one or more PDF files
- Pages are rendered on-device; QR codes, Aztec codes, PDF417, and other barcode formats are detected automatically
- Tap **Show Ticket** to view a ticket fullscreen (auto-navigates to the first page with a barcode)
- Use the filter tabs to view by category (Train / Concert / Museum / Other)
- Category is guessed from the filename; change it with the dropdown on each card

## Barcode formats detected

| Format | Used by |
|---|---|
| QR Code | Vy (Norwegian rail), most modern tickets |
| Aztec | SJ (Swedish rail), Eurostar, Deutsche Bahn |
| PDF417 | Many European rail operators |
| DataMatrix | Some museum/attraction tickets |
| Code128 | Some bus/transit operators |

## Tech stack

- **PDF rendering:** PDF.js (bundled locally)
- **Barcode detection:** ZXing WASM — detects all transit ticket formats
- **Storage:** IndexedDB via idb-keyval — survives reboots
- **Offline:** Service Worker caches all assets after first load
- **No npm, no build step, no Android SDK**

## File structure

```
ticket-wallet/
├── index.html              # Entire app
├── sw.js                   # Service worker (offline caching)
├── manifest.json           # PWA metadata
├── download-deps.sh        # One-time vendor library download
├── lib/
│   ├── pdf.min.js
│   ├── pdf.worker.min.js
│   ├── zxing.min.js
│   ├── zxing_reader.wasm
│   └── idb-keyval.min.js
└── icons/
    ├── icon-192.png
    └── icon-512.png
```
