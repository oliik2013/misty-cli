#!/bin/sh

HTML=$(curl -s "https://starnumber.vercel.app/misty?web=1")
IMG_URL=$(echo "$HTML" | sed -n 's/.*img src="\([^"]*\)".*/\1/p' | head -1)
if [ -z "$IMG_URL" ]; then
  echo "ERROR: could not fetch image URL" >&2
  exit 1
fi
echo "Downloading: $IMG_URL"
TMPFILE=$(mktemp)
curl -s -f "$IMG_URL" -o "$TMPFILE"
if [ ! -s "$TMPFILE" ]; then
  echo "ERROR: downloaded file is empty" >&2
  rm -f "$TMPFILE"
  exit 1
fi
file "$TMPFILE"
chafa "$TMPFILE"
rm -f "$TMPFILE"
