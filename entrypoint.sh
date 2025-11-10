#!/bin/sh
set -e

echo "[INFO] Starting Next.js app with PM2..."
cd /usr/src/app

# Ensure dependencies are up to date
if [ ! -d "node_modules" ]; then
  echo "[INFO] Installing dependencies..."
  npm install
fi

# Build Next.js (if needed)
if [ ! -d ".next" ]; then
  echo "[INFO] Building Next.js project..."
  npm run build
fi

# Start with PM2
pm2-runtime ecosystem.config.js
