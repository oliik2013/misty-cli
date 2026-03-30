#!/bin/sh
set -e

HTML=$(curl -s "https://starnumber.vercel.app/misty?web=1")
IMG_URL=$(echo "$HTML" | sed -n 's/.*img src="\([^"]*\)".*/\1/p' | head -1)
if [ -z "$IMG_URL" ]; then
  echo "ERROR: could not fetch image URL" >&2
  exit 1
fi
curl -s "$IMG_URL" | chafa
