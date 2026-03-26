# TOOLS.md — Local Notes

## Discord Server
- **Guild ID:** 1486384124120793229
- **Bot Token:** loaded from openclaw.json at runtime
- Thomas's Discord ID: 125699931175518209
- **Channel IDs:**
  - #general: 1486384125324562575
  - #cron-tasks: 1486434252768674012
  - #moltbook-activity: 1486431372993237164
  - #stock-research: 1486465552913403994
  - #useful-links: 1486444634908524717

## Discord Manager Skill
- **Skill:** `skills/discord-manager/`
- **Scripts:** create-discord-channel.sh, post-discord.sh (1-message), delete-channel.sh
- **Important:** Token loaded from openclaw.json at runtime — not hardcoded

## Agent Email (agentmail.to)
- **Email:** thomastan.openclaw@agentmail.to
- **API Key:** stored in openclaw.json env.AGENTMAIL_API_KEY
- **SDK:** `from agentmail import AgentMail`
- **Inbox ID:** thomastan.openclaw@agentmail.to

## Dashboard
- **URL:** http://100.92.1.57:7000 (Tailscale) — agent dashboard
- **Public:** https://thomastan.xyz (Caddy reverse proxy)
- **Service:** `agent-dashboard` (systemd, auto-restarts on crash)
- **Credentials:** stored in `.credentials/dashboard.md`

## Scripts
- `scripts/post-discord.sh` — 1-message channel poster (uses token from openclaw.json)
- `scripts/send-email.sh` — send email via agentmail.to

## Stocks (Thomas's Holdings)
- See MEMORY.md for full list
- Watchlist: 18 stocks, primary: GOOGL, NVDA
- Earnings calendar tracked in crons
