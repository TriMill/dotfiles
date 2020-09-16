#!/usr/bin/python3
import json

while True:
    event = json.loads(input())
    print(event["container"]["name"])

