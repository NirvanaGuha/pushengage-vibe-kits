# PushEngage Vibe-Coding Kits

Starter kits for adding [PushEngage](https://www.pushengage.com/?utm_source=github&utm_medium=vibe-kit&utm_campaign=mcp-launch) push notifications to apps built with AI coding tools. Each kit wires the integration for you, so an app built in Replit, Lovable, Bolt.new, or Flutter can subscribe users, tag segments, and fire trigger events within minutes.

The kits are designed to pair with the [PushEngage MCP server](https://github.com/awesomemotive/pushengage-mcp). Build the app in the tool of your choice, then create and send campaigns from Claude, Cursor, or any MCP-compatible agent.

## What's inside

| Kit | What you get | Start here |
|---|---|---|
| [`replit-template/`](replit-template/) | A complete demo store: a static page plus a small Node server, with the PushEngage web SDK loader, a root-level service worker, and buttons that subscribe, join a segment, and fire a trigger event. | [Import into Replit](https://replit.com/github/NirvanaGuha/pushengage-vibe-kits), then follow the [template README](replit-template/README.md). |
| [`flutter-starter/`](flutter-starter/) | A minimal Flutter app with native app push: permission request, segment join, and a trigger event, built on the official `pushengage_flutter_sdk` package. | [Flutter starter README](flutter-starter/README.md) |
| [`prompts/lovable-prompt.md`](prompts/lovable-prompt.md) | One prompt that has Lovable build a demo store with PushEngage web push already integrated. | Copy the prompt into Lovable. |
| [`prompts/bolt-prompt.md`](prompts/bolt-prompt.md) | The same demo for Bolt.new, laid out for a Vite project. | Copy the prompt into Bolt.new. |

## How the integration works

Every web kit uses the same three pieces:

1. **The loader snippet** in `<head>`, which initializes the SDK with your App ID and loads `pushengage-web-sdk.js` asynchronously.
2. **A one-line service worker** served from the site root:
   ```js
   importScripts('https://clientcdn.pushengage.com/sdks/service-worker.js');
   ```
3. **Three event calls** from your UI: `subscribe`, `add-to-segment`, and `send-trigger-event`.

The Flutter starter does the same with `PushEngage.setAppId`, `requestNotificationPermission`, `addSegment`, and `sendTriggerEvent`.

Segments, campaigns, A/B tests, and analytics live in PushEngage. You manage them from the dashboard, or from your AI agent through the MCP server.

## Quick start

1. **Get an App ID.** Create a free account at [pushengage.com](https://www.pushengage.com/?utm_source=github&utm_medium=vibe-kit&utm_campaign=mcp-launch), open **Site Settings → Installation**, and copy the App ID. Add your app's URL as the site URL.
2. **Pick a kit.**
   - **Replit:** import this repository, replace `YOUR_APP_ID` in `replit-template/index.html`, and run `node replit-template/server.js` (or open `replit-template/` as its own Repl). Open the webview in a new browser tab, because notification prompts do not appear inside the preview frame.
   - **Lovable or Bolt.new:** paste the prompt from `prompts/`, wait for the build, then replace `YOUR_APP_ID` and open the published URL in a regular browser tab.
   - **Flutter:** copy `lib/main.dart` and the dependency from `pubspec.yaml` into your project, set up Firebase for Android or an APNs key for iOS, replace `YOUR_APP_ID`, and run on a physical device. The [Flutter starter README](flutter-starter/README.md) has the details.
3. **Subscribe yourself.** Click **Enable notifications** and accept the browser or OS prompt. Then try **Join VIP segment** and **Add to cart**, which send a real segment update and a real trigger event to your account.
4. **Connect the MCP server.** Add PushEngage to Claude Desktop, Claude Code, Cursor, or any MCP client:
   ```json
   { "mcpServers": { "pushengage": { "command": "npx", "args": ["-y", "@pushengage/mcp"] } } }
   ```
   The first run opens a browser sign-in, so there is no API key to paste.

## Things to ask your agent

Once the MCP server is connected, try:

- "Send a 10%-off push to the vip segment."
- "Create a cart-abandonment campaign for the cart_abandoned trigger with a 30-minute delay."
- "What's my subscriber count and click-through rate this week?"

## Requirements

- A PushEngage account. The free plan is enough for every kit.
- **Web kits:** an HTTPS URL opened in a regular browser tab. Notification prompts do not show inside builder preview frames.
- **Flutter:** Flutter 3.10 or later (Dart 3), a Firebase project for Android, an APNs key for iOS, and a physical device for iOS testing.
- **MCP server:** Node.js 18 or later for `npx @pushengage/mcp`.

## Links

- [PushEngage MCP server](https://github.com/awesomemotive/pushengage-mcp) on GitHub and [`@pushengage/mcp`](https://www.npmjs.com/package/@pushengage/mcp) on npm
- [PushEngage Agent Skills](https://github.com/awesomemotive/pushengage-skills) for Claude Code, Cursor, and other SKILL.md-compatible agents
- [Using PushEngage with AI agents](https://www.pushengage.com/api/ai-agents/)
- [Web SDK and REST API documentation](https://www.pushengage.com/api/)
- [`pushengage_flutter_sdk`](https://pub.dev/packages/pushengage_flutter_sdk) on pub.dev
- [PushEngage for developers](https://www.pushengage.com/developers/?utm_source=github&utm_medium=vibe-kit&utm_campaign=mcp-launch)

## Contributing

Issues and pull requests are welcome. If a builder changes its project layout or a snippet stops working, open an issue with the tool name and what you saw.

## License

[MIT](LICENSE)
