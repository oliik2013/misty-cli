#!/bin/sh

curl -s "https://starnumber.vercel.app/misty?web=1" | sleep 1 | grep -oP '(?<=img src=")[^"]+' | xargs curl -s | chafa
