#!/usr/bin/env bash
# Derives the image renditions the page serves from their sources.
# Not a build step: run it by hand after changing a source image, then
# commit the sources and the renditions together.
# Needs cwebp (libwebp) and python3 with Pillow.
#
# Sources: public/images/kv-hero-00N.jpg (also served as-is: 001 is the
# og:image) and source/kV-original.png (never served).
#
# The renditions are cached for a week (public/_headers), so a changed
# image needs a new file name to reach returning visitors sooner.
set -euo pipefail
cd "$(dirname "$0")/.."
out=public/images

for src in "$out"/kv-hero-[0-9][0-9][0-9].jpg; do
  name=$(basename "$src" .jpg)
  # The page's rendition names (-sq1440) and its sizes attribute (the 7/3
  # aspect) are written for this shape; another one needs both changed.
  size=$(python3 -c 'import sys; from PIL import Image; print("%dx%d" % Image.open(sys.argv[1]).size)' "$src")
  if [ "$size" != 3360x1440 ]; then
    echo "$src is $size, not 3360x1440: change the page's hero srcset and sizes first" >&2
    exit 1
  fi
  for width in 1680 2520 3360; do
    cwebp -quiet -mt -m 6 -q 70 -metadata none -resize "$width" 0 "$src" -o "$out/$name-$width.webp"
  done
  # A portrait screen shows only the middle of the 21:9 frame at full
  # height (object-fit: cover, centred), so it gets the centre square
  # at native resolution instead of the whole panorama.
  cwebp -quiet -mt -m 6 -q 70 -metadata none -crop 960 0 1440 1440 "$src" -o "$out/$name-sq1440.webp"
done

# The kV mark is resampled only: same pixels at a smaller size, never
# recoloured or filtered. The source is fully opaque, so RGB loses nothing.
python3 - <<'EOF'
from PIL import Image
mark = Image.open("source/kV-original.png").convert("RGB")
for size in (32, 180):
    mark.resize((size, size), Image.LANCZOS).save(f"public/images/kV-{size}.png", optimize=True)
EOF
