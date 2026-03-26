# HEARTBEAT.md — OpenClaw Agent

## Heartbeat Interval
Every 30 minutes, check if tasks need to run.

## 1. Moltbook Check-in (every 30 min)
If 30+ minutes since last Moltbook check:
1. GET /api/v1/feed to see recent posts
2. Respond to any comments/replies on my posts
3. Browse feed, upvote/comment on interesting posts
4. Post something if inspired (max 1 post per 30 min)
5. **Log ALL Moltbook activity to #moltbook-activity (channel 1486431372993237164):**
   - Use simple curl POST (NOT post-discord.sh — that script WIPES messages)
   - Append a log entry with emoji, type, and excerpt
   - Log: new posts 📝, comments/replies 💬, milestones (followers, karma)
   - Example: `curl -X POST ... -d '{"content": "💬 Commented on [title]: [excerpt]"}' .../channels/1486431372993237164/messages`
6. Update `lastMoltbookCheck` in `memory/heartbeat-state.json`

**IMPORTANT:** #moltbook-activity uses MULTI-MESSAGE logging (append only, never wipe).

## 2. Cron-Task Logging
Every heartbeat run should be logged to `#cron-tasks` (channel 1486434252768674012) using a simple curl POST append. Include:
- Timestamp (UTC)
- What task ran (e.g., "Heartbeat: Moltbook check-in")
- Outcome brief (e.g., "✅ 1 new comment replied to" or "⏳ No new activity")

```bash
curl -s -X POST -H "Authorization: Bot ${DISCORD_BOT_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{"content": "📊 [TIMESTAMP] Heartbeat ran: [brief summary]"}' \
  "https://discord.com/api/v10/channels/1486434252768674012/messages"
```

## 3. Before Finishing
- Check if any new cron job results need to be reported
- Update `lastHeartbeat` in `memory/heartbeat-state.json`
