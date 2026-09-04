# PushEngage Vibe Kit — Flutter Starter

A minimal Flutter app with [PushEngage](https://www.pushengage.com/?utm_source=flutter-kit&utm_medium=vibe-kit&utm_campaign=mcp-launch) native app push wired in: permission request, segment join, and a trigger event — built to pair with the **PushEngage MCP server** so campaign work happens in Claude/Cursor, not in code.

## Setup

1. `flutter create pushengage_demo_store` (or use your existing app), then copy this kit's `lib/main.dart` in and add the dependency from `pubspec.yaml` (`pushengage_flutter_sdk: ^0.0.2`).
2. Platform prerequisites (one-time):
   - **Android** — a Firebase project; follow the [Flutter setup guide](https://www.pushengage.com/documentation/setting-up-app-push-notification-in-flutter-using-pushengage/) to add `google-services.json` and the FCM key in your PushEngage dashboard.
   - **iOS** — an APNs key uploaded in the dashboard + Push Notifications capability in Xcode (same guide).
3. Replace `YOUR_APP_ID` in `lib/main.dart` (Dashboard → Site Settings → Installation).
4. `flutter run` on a real device (push doesn't work on the iOS simulator).

## The MCP part

```json
{ "mcpServers": { "pushengage": { "command": "npx", "args": ["@pushengage/mcp"] } } }
```

Then, from Claude or Cursor:
- *"Send a price-drop push to the vip segment."*
- *"Create a trigger campaign named cart_abandoned that waits 30 minutes, then reminds the shopper."*
- *"Show me delivery and CTR for the last 7 days."*

API surface used in `main.dart` (verbatim from the SDK):
`PushEngage.setAppId`, `PushEngage.requestNotificationPermission`, `PushEngage.addSegment([...])`, `PushEngage.sendTriggerEvent(TriggerCampaign(campaignName:…, eventName:…, data:…))`.

Docs: [pushengage.com/api/ai-agents](https://www.pushengage.com/api/ai-agents/) · [Flutter public APIs](https://pushengage.com/api/mobile-sdk/flutter-sdk)
