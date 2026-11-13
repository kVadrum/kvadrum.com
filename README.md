# kvadrum.com

The [kVadrum](https://kvadrum.com) website.
Static single-page site with hero slideshow, parallax effects, and glass panel UI.

Part of [KeMeK Network](https://kemek.network).

## Stack

Pure HTML/CSS/JS — no build step, no dependencies.
Serve `public/` with any static server, e.g. `python3 -m http.server -d public`; image paths are root-absolute, so opening the file directly shows no images.

## Structure

Everything under `public/` is served; nothing else is.

- `public/index.html` — entire site (markup, styles, scripts inline)
- `public/images/kv-hero-001..004.jpg` — hero sources, 3360×1440; `kv-hero-001.jpg` is also the social-card image
- `public/images/kv-hero-00N-{1680,2520,3360}.webp`, `-sq1440.webp` — what the page shows: three widths for landscape screens and the centre square for portrait ones
- `public/images/kV-32.png`, `kV-180.png` — the kV mark as favicon and as page/home-screen icon
- `public/images/kV.png` — the 512px mark, kept at its URL for links from elsewhere
- `public/fonts/` — Fraunces, Spectral and JetBrains Mono, self-hosted; their license is `public/fonts/OFL.txt`
- `public/robots.txt`, `public/sitemap.xml`, `public/llms.txt` — crawler and agent surface
- `public/_headers` — response headers (security, caching, content types); read by Cloudflare, never served
- `public/LICENSE` — symlink to `LICENSE.md`, so the license is served at `/LICENSE`
- `source/kV-original.png` — lossless 1520px source of the kV mark (never served)
- `source/derive-images.sh` — regenerates every image rendition from its source
- `source/social-preview.html`, `.jpg` — the repository's GitHub social preview card and the page it is rendered from
- `wrangler.jsonc` — Cloudflare deploy config

## Images and fonts

After changing a hero JPG or the kV source, run `source/derive-images.sh` (needs `cwebp` and Python with Pillow) and commit the source and its renditions together.
Images and fonts are cached for a week, so a changed file reaches returning visitors sooner under a new name.

The font files were cut from the Google Fonts `css2` API, requested with a current browser's User-Agent so it answers with WOFF2:

- Fraunces sets only the headline, so it is cut to the headline's letters (`text=abcdefghijklmnopqrstuvwxyzV.` plus the space): `family=Fraunces:opsz,wght,SOFT,WONK@144,320,25,1` and `family=Fraunces:ital,opsz,wght,SOFT,WONK@1,144,380,80,1`.
  The files come back pinned at `opsz` 144 and `WONK` 1, which keeps the curled ascenders the full font draws at this size; `wght` and `SOFT` still vary, so the headline's `font-variation-settings` must stay.
  A headline word using any other character needs both files re-cut.
- Spectral (`family=Spectral:ital,wght@0,400;1,400`) and JetBrains Mono (`family=JetBrains+Mono:wght@400`) use the `latin` subset as served, with its `unicode-range` copied into the page.

## Deploy

Served by Cloudflare Workers static assets — no Worker script, no build.
Cloudflare Workers Builds deploys every push to `main`; it uploads `public/` and nothing else.
By hand, `npx wrangler deploy` from the repo root does the same, from whatever the working tree holds.

A new public file goes in `public/`.
`public/.assetsignore` only keeps dotfiles out.

## Performance

Lighthouse 12.8 against production, 2026-11-13 (v1.3.6):

| | Performance | Accessibility | Best practices | SEO |
|---|---|---|---|---|
| Mobile | 94 | 100 | 100 | 92 |
| Desktop | 94 | 100 | 100 | 92 |

SEO loses its points to one line in `robots.txt`, `Content-Signal`, which Lighthouse doesn't recognise; it states the site's crawler and AI-use preferences and stays.
Performance is Lighthouse's simulated slow-4G estimate; the load it observed finished in under a second.

## License

- **Written content and photography** — the page copy, this README, `public/llms.txt` and the hero photography — are licensed [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
- **Code** — markup, styles, scripts, configuration and tooling — is licensed [MIT](./LICENSE.md#code-mit).
- **Names and logos** — the "kVadrum" name and the kV monogram are not licensed; KeMeK Network reserves all rights in them.
- **Fonts** in `public/fonts/` keep their own license, the SIL Open Font License 1.1.

[`LICENSE.md`](./LICENSE.md) has the full terms and says which license applies where a file holds both code and content.

KeMeK Network © 2026.
