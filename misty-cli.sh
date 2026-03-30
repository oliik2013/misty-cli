#!/bin/sh
set -e

IMG_URL=$(curl -s "https://starnumber.vercel.app/misty?web=1" | grep -oP '(?<=img src=")[^"]+' | head -1)
curl -s "$IMG_URL" | chafa
