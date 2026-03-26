#!/bin/bash
# Posts a message to a Discord channel, ensuring only 1 message exists in the channel
# Usage: ./post-discord.sh <channel_id> <message>

CHANNEL_ID="$1"
MESSAGE="$2"
TOKEN="$(python3 -c "import json; c=json.load(open('/home/openclaw/.openclaw/openclaw.json')); print(c.get('channels',{}).get('discord',{}).get('token',''))" 2>/dev/null)"

if [ -z "$TOKEN" ]; then
  echo "Error: Could not load Discord token"
  exit 1
fi

if [ -z "$CHANNEL_ID" ] || [ -z "$MESSAGE" ]; then
  echo "Usage: $0 <channel_id> <message>"
  exit 1
fi

# Delete all existing messages in the channel
EXISTING=$(curl -s -H "Authorization: Bot $TOKEN" \
  "https://discord.com/api/v10/channels/$CHANNEL_ID/messages?limit=100" 2>/dev/null)

COUNT=$(echo "$EXISTING" | python3 -c "import sys,json; print(len(json.load(sys.stdin)))" 2>/dev/null || echo 0)

if [ "$COUNT" -gt 0 ]; then
  echo "Deleting $COUNT existing message(s)..."
  echo "$EXISTING" | python3 -c "
import sys,json
for m in json.load(sys.stdin):
    print(m['id'])
" 2>/dev/null | while read MSG_ID; do
    curl -s -X DELETE -H "Authorization: Bot $TOKEN" \
      "https://discord.com/api/v10/channels/$CHANNEL_ID/messages/$MSG_ID" > /dev/null
  done
fi

# Post the new message
curl -s -X POST -H "Authorization: Bot $TOKEN" \
  -H "Content-Type: application/json" \
  -d "$(jq -n --arg msg "$MESSAGE" '{content: $msg}')" \
  "https://discord.com/api/v10/channels/$CHANNEL_ID/messages" > /dev/null

echo "✅ Done — channel $CHANNEL_ID now has exactly 1 message"
