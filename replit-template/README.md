# PushEngage Vibe Kit — Web Push Demo Store

A one-file demo store with [PushEngage](https://www.pushengage.com/?utm_source=replit&utm_medium=vibe-kit&utm_campaign=mcp-launch) web push wired in, built to pair with the **PushEngage MCP server** — so you can build the site here and run the campaigns from Claude, Cursor, or any MCP client.

## Run it (3 steps)

1. **Get your App ID** — free account at [pushengage.com](https://www.pushengage.com/?utm_source=replit&utm_medium=vibe-kit&utm_campaign=mcp-launch), then Dashboard → **Site Settings → Installation** and copy the App ID. Add your Repl's URL as the site URL.
2. **Paste it** — replace `YOUR_APP_ID` in `index.html`.
3. **Hit Run** — open the webview in a new tab (notifications need a real tab, not the preview iframe), click **Enable notifications**, and accept the prompt.

You're now a subscriber of your own store. Click **Join VIP segment** and **Add to cart, then leave** to send real events.

## Now the MCP part

Add PushEngage to Claude Code / Claude Desktop / Cursor:

```json
{ "mcpServers": { "pushengage": { "command": "npx", "args": ["@pushengage/mcp"] } } }
```

First run opens a browser sign-in — no API keys to paste. Then just ask:

- *"Send a 10%-off push to the vip segment."*
- *"Create a cart-abandonment campaign for cart_abandoned with a 30-minute delay."*
- *"What's my subscriber count and CTR this week?"*

Docs: [pushengage.com/api/ai-agents](https://www.pushengage.com/api/ai-agents/) · npm: [@pushengage/mcp](https://www.npmjs.com/package/@pushengage/mcp)

## How it's wired

- `index.html` — the official loader snippet (`PushEngage.push(['init', …])`) plus three event calls: `subscribe`, `add-to-segment`, `send-trigger-event`.
- `service-worker.js` — one line, served from the site root: `importScripts('https://clientcdn.pushengage.com/sdks/service-worker.js')`.
- `server.js` — static server that sets `Service-Worker-Allowed: /` so the worker gets full scope.

That's the entire integration. Everything else — segments, campaigns, A/B tests, analytics — lives server-side in PushEngage, drivable from the dashboard or your AI agent.
