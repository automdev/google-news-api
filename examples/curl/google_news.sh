#!/usr/bin/env bash
# Google News API – cURL example
# Usage: AUTOM_API_KEY=your-key bash google_news.sh
set -euo pipefail

curl -sS --fail-with-body -G "https://api.autom.dev/v1/google/news" \
  -H "x-api-key: ${AUTOM_API_KEY}" \
  --data-urlencode query=coffee
