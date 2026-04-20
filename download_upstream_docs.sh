#!/bin/bash

# updates all `upstream_doc.md` files in this repo to the latest

# see CONTRIBUTING.md for where to find these URLs

set -e

curl -sS 'https://ai.google.dev/api/caching.md.txt' -o Sources/Gemini/Caching/upstream_doc.md
curl -sS 'https://ai.google.dev/api/generate-content.md.txt' -o Sources/Gemini/Generate/upstream_doc.md
curl -sS 'https://ai.google.dev/api/live.md.txt' -o Sources/Gemini/Live/upstream_doc.md
curl -sS 'https://ai.google.dev/api/live_music.md.txt' -o Sources/Gemini/LiveMusic/upstream_doc.md
curl -sS 'https://ai.google.dev/api/models.md.txt' -o Sources/Gemini/Models/upstream_doc.md
