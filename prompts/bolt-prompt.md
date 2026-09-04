# Bolt.new one-prompt demo — paste this into Bolt

> Create a Vite vanilla-JS project: a single-page demo store "Aeron Outfitters" with one product card (Aeron Chair, $1,041) and three buttons: "Enable notifications", "Join VIP segment", "Add to cart".
>
> Integrate PushEngage web push exactly as specified — do not substitute another push library:
>
> 1. In `index.html` `<head>`, add this loader verbatim (keep the `YOUR_APP_ID` placeholder):
> ```html
> <script>
> (function(w,d){w.PushEngage=w.PushEngage||[];w._peq=w._peq||[];
> PushEngage.push(['init',{appId:'YOUR_APP_ID'}]);
> var e=d.createElement('script');e.src='https://clientcdn.pushengage.com/sdks/pushengage-web-sdk.js';
> e.async=true;e.type='text/javascript';d.head.appendChild(e);})(window,document);
> </script>
> ```
> 2. Add `public/service-worker.js` containing exactly:
> `importScripts('https://clientcdn.pushengage.com/sdks/service-worker.js');`
> (Vite serves `public/` from the root, which is what the SDK expects.)
> 3. Button wiring: "Enable notifications" → `window._peq.push(['subscribe'])`; "Join VIP segment" → `window._peq.push(['add-to-segment',['vip']])`; "Add to cart" → `window._peq.push(['send-trigger-event',{campaign:'cart_abandoned',data:{product:'Aeron Chair',value:1041}}])`.
> 4. Add a status line that confirms each action.
>
> The loader must execute at page load, outside any module bundling.

**After it builds:** swap in your App ID (Dashboard → Site Settings → Installation), deploy/preview in a real tab, allow notifications — then drive campaigns from Claude via `npx @pushengage/mcp`.
