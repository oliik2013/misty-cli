import os
import argparse
from time import sleep

parser = argparse.ArgumentParser(description="Misty loop")

parser.add_argument("--istesting", type=bool, help="Used for testing, by limiting the loop to 25 secounds (3 images).")
parser.add_argument("--size", "-s", type=int, help="Size of Misty images.")

args = parser.parse_args()

if args.size != None:
    commandcli = "misty-cli -s " + str(args.size)
else:
    commandcli = "misty-cli"

if args.istesting == True:
    os.system(commandcli)
    sleep(10)
    os.system(commandcli)
    sleep(10)
    os.system(commandcli)
    sleep(5)
    exit()

while True:
    os.system(commandcli)
    sleep(10)
