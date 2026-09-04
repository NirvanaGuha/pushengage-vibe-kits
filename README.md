# PushEngage MCP Vibe-Coding Kits
Asana 1217011091693333 · built 2026-09-04

Kits that let vibe coders (Replit / Lovable / Bolt / Flutter) wire PushEngage into an AI-built app in minutes, with the **MCP server as the payoff**: build the app in the builder, run the campaigns from Claude.

## Contents

| Path | What it is | Status |
|---|---|---|
| `replit-template/` | Complete demo store (static site + node server): official loader snippet, root service worker, subscribe / segment / trigger buttons, MCP README | Code complete — needs publishing as a Replit template (account required) or a public GitHub repo for "Import from GitHub" |
| `flutter-starter/` | `lib/main.dart` + `pubspec.yaml` verified against pushengage_flutter_sdk 0.0.2 source (setAppId, requestNotificationPermission, addSegment, sendTriggerEvent/TriggerCampaign) | Code complete — README covers Firebase/APNs prereqs |
| `prompts/lovable-prompt.md` | One-prompt demo for Lovable (snippet embedded verbatim so the AI can't improvise) | Ready to publish |
| `prompts/bolt-prompt.md` | Same for Bolt.new (Vite layout, `public/service-worker.js`) | Ready to publish |
| `demo-script-60s.md` | Shot-by-shot script for the 60-second one-prompt demo video | Ready to record |

## Technical ground truth (verified from source, not docs)

- Loader snippet: from `pushengage-wordpress-plugin/app/Core.php:168-180` — `PushEngage.push(['init',{appId}])` + async `clientcdn.pushengage.com/sdks/pushengage-web-sdk.js`.
- Service worker: `importScripts('https://clientcdn.pushengage.com/sdks/service-worker.js')` at site root (plugin `packages/service-worker.js.php`).
- Flutter API: matched against `~/PushEngage/pushengage-flutter-sdk/lib/` (TriggerCampaign requires `campaignName` + `eventName`; `addSegment` takes a List).

## Distribution & tracking

- UTM convention baked into all links: `utm_source=replit|lovable|bolt|flutter-kit`, `utm_medium=vibe-kit`, `utm_campaign=mcp-launch`.
- **Open:** per-platform coupon codes (task spec) — needs a billing-side owner to mint them; swap into the READMEs when they exist.
- **Open:** publish `replit-template/` to Replit (needs the account owner) or push the kit to a public GitHub repo under awesomemotive/ for one-click import.
- Cross-links once public: /developers page SDK section, api/ai-agents docs page, launch-kit LP (separate task), WPVibe co-marketing tutorial (separate task).
