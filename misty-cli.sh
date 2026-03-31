#!/bin/sh

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
	echo "misty-cli"
	echo "CLI To display Misty pictures"
	echo "Usage:"
	echo "misty-cli -- Get a random Misty picture"
	echo "Additional arguments:"
	echo "--help, -h -- Shows this page"
	echo "--size, -s -- Set the size of the picture, example -s 40x"
	exit 0
fi

HTML=$(curl -s "https://starnumber.vercel.app/misty?web=1")
IMG_URL=$(echo "$HTML" | sed -n 's/.*img src="\([^"]*\)".*/\1/p' | head -1)
if [ -z "$IMG_URL" ]; then
  echo "ERROR: could not fetch image URL" >&2
  exit 1
fi
TMPFILE=$(mktemp)
curl -s -f "$IMG_URL" -o "$TMPFILE"
if [ ! -s "$TMPFILE" ]; then
  echo "ERROR: downloaded file is empty" >&2
  rm -f "$TMPFILE"
  exit 1
fi

if [ "$1" = "--size" ] || [ "$1" = "-s" ] || [[ $1 == --size=* ]]; then
	chafa "$TMPFILE" $1 $2
else
	chafa "$TMPFILE"
fi

rm -f "$TMPFILE"
