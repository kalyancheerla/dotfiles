#!/usr/bin/env python3

import os, sys
import requests

WIRE_ALERT = os.environ.get('WIRE_ALERT')

# If empty env variable
if not WIRE_ALERT:
    sys.exit(1)

# use stdin if it's full
if not sys.stdin.isatty():
    input_stream = sys.stdin

    data = ''
    # collect data
    for line in input_stream:
        data += line

    # set final data
    final_data = data

# otherwise, read the given args as a space separated string
else:
    # collect data
    args_data = ' '.join(sys.argv[1:])

    # set final data
    final_data = args_data

# empty then exit
if not final_data:
    sys.exit(2)

# For debugging purpose
#print(final_data.encode('utf-8'))

# Print the final data that will be sent
# Eliminates the use of 'tee /dev/tty' in b/w in pipe
# Eg: ktime <command with arg's> | tee /dev/tty | wirealert.py
print(final_data)

# Prepare msg
msg = { "content": final_data }

# Send msg
result = requests.post(WIRE_ALERT, json=msg)

# Report status
try:
    result.raise_for_status()
except requests.exceptions.HTTPError as err:
    print(err)
    sys.exit(3)
else:
    print(f"Done({result.status_code})")

