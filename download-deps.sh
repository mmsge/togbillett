#!/usr/bin/env bash
# Run this once to download all vendor libraries before serving the app.
set -e

mkdir -p lib icons

echo "Downloading PDF.js..."
curl -fL -o lib/pdf.min.js \
  https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js
curl -fL -o lib/pdf.worker.min.js \
  https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js

echo "Downloading idb-keyval..."
curl -fL -o lib/idb-keyval.min.js \
  https://cdn.jsdelivr.net/npm/idb-keyval@6/dist/umd.min.js

echo "Downloading ZXing WASM..."
curl -fL -o lib/zxing.min.js \
  https://cdn.jsdelivr.net/npm/@zxing/wasm@1.1.3/dist/iife/zxing_reader.js
curl -fL -o lib/zxing_reader.wasm \
  https://cdn.jsdelivr.net/npm/@zxing/wasm@1.1.3/dist/iife/zxing_reader.wasm

echo ""
echo "All dependencies downloaded."
echo ""
echo "If you don't have icons yet, add any square PNG files as:"
echo "  icons/icon-192.png  (192×192)"
echo "  icons/icon-512.png  (512×512)"
echo ""
echo "To serve: python3 -m http.server 8080"
