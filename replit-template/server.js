// Minimal static server — Replit runs this via .replit
// Serves index.html and service-worker.js from the repo root (SW must be at the site root for full scope).
const http = require('http');
const fs = require('fs');
const path = require('path');

const TYPES = { '.html': 'text/html', '.js': 'application/javascript', '.css': 'text/css', '.png': 'image/png', '.svg': 'image/svg+xml' };

http.createServer((req, res) => {
  const url = req.url.split('?')[0];
  const file = url === '/' ? 'index.html' : url.slice(1);
  const p = path.join(__dirname, path.normalize(file));
  if (!p.startsWith(__dirname) || !fs.existsSync(p) || fs.statSync(p).isDirectory()) {
    res.writeHead(404); res.end('Not found'); return;
  }
  const headers = { 'Content-Type': TYPES[path.extname(p)] || 'application/octet-stream' };
  if (file === 'service-worker.js') headers['Service-Worker-Allowed'] = '/';
  res.writeHead(200, headers);
  fs.createReadStream(p).pipe(res);
}).listen(process.env.PORT || 3000, () => console.log('Demo store running'));
