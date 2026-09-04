# Lovable one-prompt demo — paste this into Lovable

> Build a small single-page demo store called "Aeron Outfitters" with one product card (Aeron Chair, $1,041), an "Enable notifications" button, a "Join VIP segment" button, and an "Add to cart" button. Then integrate PushEngage web push exactly as follows, with no modifications:
>
> 1. In the `<head>`, add this loader (keep `YOUR_APP_ID` as a literal placeholder I'll replace):
> ```html
> <script>
> (function(w,d){w.PushEngage=w.PushEngage||[];w._peq=w._peq||[];
> PushEngage.push(['init',{appId:'YOUR_APP_ID'}]);
> var e=d.createElement('script');e.src='https://clientcdn.pushengage.com/sdks/pushengage-web-sdk.js';
> e.async=true;e.type='text/javascript';d.head.appendChild(e);})(window,document);
> </script>
> ```
> 2. Serve a `service-worker.js` at the site root containing exactly:
> `importScripts('https://clientcdn.pushengage.com/sdks/service-worker.js');`
> 3. Wire the buttons: "Enable notifications" → `window._peq.push(['subscribe'])`; "Join VIP segment" → `window._peq.push(['add-to-segment',['vip']])`; "Add to cart" → `window._peq.push(['send-trigger-event',{campaign:'cart_abandoned',data:{product:'Aeron Chair',value:1041}}])`.
> 4. Show a small status line under the buttons confirming each action fired.
>
> Don't add any other notification libraries. Don't wrap the loader in a framework lifecycle — it must run on first paint.

**After it builds:** replace `YOUR_APP_ID` (PushEngage Dashboard → Site Settings → Installation), open the published URL in a real tab, allow notifications — then manage the campaigns from Claude via `npx @pushengage/mcp`.
