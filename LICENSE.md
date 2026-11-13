# License

This repository holds two kinds of work under two licenses:

- **Written content and photography** — [CC BY 4.0](#written-content-and-photography-cc-by-40)
- **Code** — [MIT](#code-mit)

Two things are covered by neither license: the kVadrum [name and logo](#names-and-logos), and the [third-party fonts](#third-party-fonts), which keep their own license.
[Clarification](#clarification) says which license applies where a file mixes the two kinds.

## Written content and photography (CC BY 4.0)

Copyright (c) 2026 KeMeK Network.
The written content and photography in this repository are licensed under the Creative Commons Attribution 4.0 International License (CC BY 4.0).
Full legal text: <https://creativecommons.org/licenses/by/4.0/legalcode>

This covers:

- the text of `public/index.html`: its visible copy, plus the titles and descriptions in its metadata
- `README.md` and `public/llms.txt`
- the hero photography: `public/images/kv-hero-*`, the JPEG sources and their WebP renditions

### Summary of CC BY 4.0

This summary is a reminder of the license's main terms, not a substitute for it.

You are free to:

- **Share** — copy and redistribute the material in any medium or format, for any purpose, even commercially.
- **Adapt** — remix, transform, and build upon the material for any purpose, even commercially.

Under the following terms:

- **Attribution** — You must give appropriate credit, provide a link to the license, and indicate if changes were made.
  You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
- **No additional restrictions** — You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.

Suggested credit: *"kvadrum.com by KeMeK Network (https://kvadrum.com), licensed under CC BY 4.0."*

## Code (MIT)

The code in this repository is licensed under the MIT License:

```text
MIT License

Copyright (c) 2026 KeMeK Network

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Names and logos

The "kVadrum" name and the kV monogram (`public/images/kV.png`, `public/images/kV-32.png`, `public/images/kV-180.png`, and their source `source/kV-original.png`) are not covered by this repository's licenses.
KeMeK Network reserves all rights in them.
Independent forks must replace the name and logo with their own.

## Third-party fonts

The fonts in `public/fonts/` — Fraunces, Spectral and JetBrains Mono — are licensed by their authors under the SIL Open Font License 1.1, not under either license above.
Their copyright notices and the license text are in [`public/fonts/OFL.txt`](public/fonts/OFL.txt).

## Clarification

- The site's structure, styles, scripts, configuration and tooling are code (MIT): the markup, CSS and JavaScript of `public/index.html`, `public/_headers`, `public/robots.txt`, `public/sitemap.xml`, `wrangler.jsonc`, `source/derive-images.sh`, and the repository's dotfiles (`.gitignore`, `.gitattributes`, `public/.assetsignore`).
- Written copy and photography are content (CC BY 4.0), as listed above.
- `public/index.html` holds both: its markup, styles and scripts are code; its text is content.
- A code snippet inside written content may be used under either license.
