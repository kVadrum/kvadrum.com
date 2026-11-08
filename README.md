# kvadrum-web

The [kVadrum](https://kvadrum.com) website. Static single-page site with hero slideshow, parallax effects, and glass panel UI.

Part of [KeMeK Network](https://kemek.com).

## Stack

Pure HTML/CSS/JS — no build step, no dependencies. Open `index.html` directly or serve with any static server.

## Structure

- `index.html` — entire site (markup, styles, scripts inline)
- `images/kV.png` — optimized 512px logo
- `images/kV-original.png` — lossless 1520px source logo (not deployed)
- `images/kv-hero-001..004.jpg` — hero slideshow backgrounds
- `robots.txt`, `sitemap.xml`, `llms.txt` — crawler and agent surface
- `_headers` — response headers (security, content types)
- `wrangler.jsonc`, `.assetsignore` — Cloudflare deploy config

## Deploy

Served by Cloudflare Workers static assets — no Worker script, no build.
Deploy from the repo root with `npx wrangler deploy`.

`.assetsignore` is an allowlist: only the files it names are published.
A new public file needs its own `!` line there.

## License

This repository is dual-licensed:

- **Code** (HTML, CSS, JavaScript in `index.html`) — [MIT](./LICENSE).
- **Content** (this README, the visible copy in `index.html`, the
  hero photography in `images/kv-hero-*.jpg`) —
  [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
- **Names and logos** — the "kVadrum" name and the kV monogram
  (`images/kV.png`, `images/kV-original.png`) are not covered by
  these licenses. KeMeK Network reserves all rights in them.
  See [`LICENSE`](./LICENSE).

KeMeK Network © 2026.
