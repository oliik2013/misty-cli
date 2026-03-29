#!/bin/sh

curl "https://starnumber.vercel.app/misty?web=1" | grep -oP '(?<=img src=")[^"]+' | xargs curl -s | chafa
