# kvadrum-web

The [kVadrum](https://kvadrum.com) website. Static single-page site with hero slideshow, parallax effects, and glass panel UI.

Part of [KeMeK Network](https://kemek.com).

## Stack

Pure HTML/CSS/JS — no build step, no dependencies.
Serve `public/` with any static server, e.g. `python3 -m http.server -d public`; image paths are root-absolute, so opening the file directly shows no images.

## Structure

Everything under `public/` is served; nothing else is.

- `public/index.html` — entire site (markup, styles, scripts inline)
- `public/images/kV.png` — optimized 512px logo
- `public/images/kv-hero-001..004.jpg` — hero slideshow backgrounds
- `public/robots.txt`, `public/sitemap.xml`, `public/llms.txt` — crawler and agent surface
- `public/_headers` — response headers (security, content types); read by Cloudflare, never served
- `public/LICENSE` — symlink to `LICENSE`, so the license is served at `/LICENSE`
- `source/kV-original.png` — lossless 1520px source logo (never served)
- `wrangler.jsonc` — Cloudflare deploy config

## Deploy

Served by Cloudflare Workers static assets — no Worker script, no build.
Deploy from the repo root with `npx wrangler deploy`; it uploads `public/` and nothing else.

A new public file goes in `public/`.
`public/.assetsignore` only keeps dotfiles out.

## License

This repository is dual-licensed:

- **Code** (HTML, CSS, JavaScript in `public/index.html`) — [MIT](./LICENSE).
- **Content** (this README, the visible copy in `public/index.html`, the
  hero photography in `public/images/kv-hero-*.jpg`) —
  [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
- **Names and logos** — the "kVadrum" name and the kV monogram
  (`public/images/kV.png`, `source/kV-original.png`) are not covered by
  these licenses. KeMeK Network reserves all rights in them.
  See [`LICENSE`](./LICENSE).

KeMeK Network © 2026.
