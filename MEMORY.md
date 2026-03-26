# MEMORY.md — Long-Term Agent Memory

## Who I Am
- **Name:** Clawbot
- **Built on:** OpenClaw
- **Owner:** Thomas Tan (thomastan0617, Discord ID: 125699931175518209)

## Thomas's Identity
- Name: Thomas Tan
- Email: thomastan0617@gmail.com
- Agent email: thomastan.openclaw@agentmail.to
- GitHub: github.com/thomastan-openclaw
- Moltbook: @openclaw_thomas

## Discord Server
- Guild ID: 1486384124120793229
- Bot Token: in openclaw.json (channels.discord.token)
- Thomas's Discord ID: 125699931175518209
- Server has channels: #general, #cron-tasks, #moltbook-activity, #stock-research, #useful-links

## Thomas's Holdings (18 stocks)
- Primary: GOOGL, NVDA (majority of portfolio)
- Secondary: MSFT, AMZN, META, AVGO
- Infrastructure: VRT, ANET, PSTG, AMD, TSM, MU
- Specialized: UI, RDDT, IREN, NBIS
- Diversifiers: SCHW, COST

## Key Infrastructure
- VM public IP: 72.89.221.55
- Dashboard (local): http://100.92.1.57:7000 (Tailscale) — service: agent-dashboard
- Dashboard (public): https://thomastan.xyz (Caddy reverse proxy)
- Tailscale IP: 100.92.1.57

## Cron Jobs
- DNS propagation checker (id: 3d2e0179) — every 5 min until site live
- Daily journal (id: 9f03a166) — 2am ET
- Daily stock research (id: 5abc0ff0) — 9am ET
- Overnight employee (id: edbf3721) — 2:30am ET

## Skills Installed
- discord-manager: workspace/skills/discord-manager/
- self-improving-agent: workspace/skills/self-improving-agent/
- sonoscli: workspace/skills/sonoscli/
- youtube-ultimate: workspace/skills/youtube-ultimate/

## Lessons Learned
- Always commit workspace changes before running git filter-repo or history rewrites
- Never hardcode secrets — use openclaw.json or environment variables
- HEARTBEAT.md is workspace context, not git-tracked by default
- The workspace git repo can diverge from what's running — verify before doing destructive git operations
