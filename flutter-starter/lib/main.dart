import 'package:flutter/material.dart';
import 'package:pushengage_flutter_sdk/model/trigger_campaign.dart';
import 'package:pushengage_flutter_sdk/pushengage_flutter_sdk.dart';

// PushEngage Vibe Kit — Flutter starter.
// Prereqs: Firebase project (Android) / APNs key (iOS) — see README.
void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  String _log = 'Ready. Tap subscribe, then fire a trigger.';

  @override
  void initState() {
    super.initState();
    // Dashboard → Site Settings → Installation → App ID
    PushEngage.setAppId('YOUR_APP_ID');
  }

  void _setLog(String m) => setState(() => _log = m);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PushEngage Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Store')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Aeron Chair', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const Text('\$1,041', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  PushEngage.requestNotificationPermission();
                  _setLog('Permission requested. Accept it, then check Dashboard → Audience.');
                },
                child: const Text('Enable notifications'),
              ),
              OutlinedButton(
                onPressed: () {
                  PushEngage.addSegment(['vip']);
                  _setLog("Added to segment 'vip'. From Claude (PushEngage MCP): \"Send a 10%-off push to the vip segment.\"");
                },
                child: const Text('Join VIP segment'),
              ),
              OutlinedButton(
                onPressed: () {
                  final campaign = TriggerCampaign(
                    campaignName: 'cart_abandoned',
                    eventName: 'add_to_cart',
                    data: {'product': 'Aeron Chair', 'value': '1041'},
                  );
                  PushEngage.sendTriggerEvent(campaign);
                  _setLog("Trigger 'cart_abandoned' fired. Pair with a Cart Abandonment campaign — build it in the dashboard or ask your agent.");
                },
                child: const Text('Add to cart, then leave (fires trigger)'),
              ),
              const SizedBox(height: 20),
              Text(_log, style: const TextStyle(fontSize: 13, color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }
}
