#!/bin/bash

SECRETS="$1"
KEY="$2"
VAL="`grep $KEY $SECRETS | cut -d\  -f 2`"
find manifests-deploy -type f | xargs sed -e "s/$KEY/$VAL/g" -i
