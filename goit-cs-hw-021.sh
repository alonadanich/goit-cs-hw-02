#!/usr/bin/env bash

WEBSITES=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

LOGFILE="website_status.log"

> "$LOGFILE"

echo "Checking website status..."

for SITE in "${WEBSITES[@]}"; do
    STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}" --location "$SITE")
    if [ "$STATUS_CODE" -eq 200 ]; then
        echo "<$SITE> is UP" | tee -a "$LOGFILE"
    else
        echo "<$SITE> is DOWN" | tee -a "$LOGFILE"
    fi
done

echo "The results are saved in <$LOGFILE>"