<p align="center">
  <a href="https://www.autom.dev"><img src="images/banner.png" alt="Google News API by Autom" width="100%"></a>
</p>

# Google News API

[![Discord](https://img.shields.io/badge/Discord-Join%20the%20community-5865F2?logo=discord&logoColor=white)](https://discord.gg/CFj3ph8aHU) [![Get API key](https://img.shields.io/badge/Autom-Get%20an%20API%20key-111827)](https://app.autom.dev/register) [![API docs](https://img.shields.io/badge/Docs-API%20reference-0EA5E9)](https://docs.autom.dev) [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

The **Autom Google News API** returns Google News articles — title, source, date, link — as structured JSON.

- **Google News API** — Search Google News via API and retrieve structured news results with pagination.

Use it for media monitoring, PR tracking, news aggregation or market intelligence.

| Endpoint | Request | Credits |
|---|---|---|
| [Google News API](#google-news-api) | `GET /v1/google/news` | 1 |

## Table of contents

- [How it works](#how-it-works)
- [Google News API](#google-news-api)
- [Code examples in other languages](#code-examples-in-other-languages)
- [Use cases](#use-cases)
- [Why Autom?](#why-autom)
- [FAQ](#faq)
- [Official SDKs](#official-sdks)
- [Related repositories](#related-repositories)
- [Support](#support)

## How it works

1. **Create a Autom account** and copy your API key from the [dashboard](https://app.autom.dev/register).
2. **Call `https://api.autom.dev`** with the header `x-api-key: YOUR_API_KEY`.
3. **Use the result** in your app — no infrastructure to run.

```bash
export AUTOM_API_KEY="your-api-key"
pip install requests        # Python
# TypeScript: Node.js 18+ (native fetch), run with `npx tsx file.ts`
```

## Google News API

Search Google News via API and retrieve structured news results with pagination.

`GET https://api.autom.dev/v1/google/news` · **1 credit per request** · [API reference](https://app.autom.dev/openapi)

### Request parameters

| Parameter | In | Type | Required | Description |
|---|---|---|---|---|
| `query` | query | string | ✅ | Query to search on Google News (keywords, company, topic). |
| `page` | query | number | — | Page number for pagination (1 = first page). |
| `num` | query | number | — | Maximum number of results per page (e.g. 10). |
| `gl` | query | string | — | Country to use (two-letter country code, e.g. `us`, `fr`). |
| `hl` | query | string | — | Language to use (two-letter language code, e.g. `en`, `fr`). |

### Python example

```python
import os

import requests

API_KEY = os.environ["AUTOM_API_KEY"]
HEADERS = {"x-api-key": API_KEY}

response = requests.get(
    "https://api.autom.dev/v1/google/news",
    headers=HEADERS,
    params={
        "query": "coffee",
    },
    timeout=120,
)
response.raise_for_status()

data = response.json()
print(data)
```

### TypeScript example

```typescript
type GoogleNewsApi = {
  pagination?: {
    next?: number;
    current?: number;
    has_next_page?: boolean;
  };
  organic_results?: {
    date?: string;
    link?: string;
    title?: string;
    domain?: string;
    source?: string;
    snippet?: string;
    position?: number;
  }[];
  search_parameters?: {
    q?: string;
    gl?: string;
    hl?: string;
    page?: number;
    engine?: string;
  };
};

const headers = { "x-api-key": process.env.AUTOM_API_KEY!, "Content-Type": "application/json" };

const params = new URLSearchParams({
  "query": "coffee",
});

const response = await fetch(`https://api.autom.dev/v1/google/news?${params}`, { headers });
if (!response.ok) throw new Error(`HTTP ${response.status}: ${await response.text()}`);

const data = (await response.json()) as GoogleNewsApi;
console.log(data);
```

### Output example

Example response from the API reference, abridged.

```json
{
  "pagination": {
    "next": 2,
    "current": 1,
    "has_next_page": true
  },
  "organic_results": [
    {
      "date": "1 day ago",
      "link": "https://www.nytimes.com/wirecutter/reviews/instant-coffee-is-good/",
      "title": "Hear Me Out: Instant Coffee Is, in Fact, Good",
      "domain": "www.nytimes.com",
      "source": "The New York Times",
      "snippet": "Not all instant coffee tastes gross.",
      "position": 1
    }
  ],
  "search_parameters": {
    "q": "coffee",
    "gl": "us",
    "hl": "en",
    "page": 1,
    "engine": "google_news"
  }
}
```

### Response fields

| Field | Type | Description |
|---|---|---|
| `pagination` | object |  |
| `pagination.next` | integer |  |
| `pagination.current` | integer |  |
| `pagination.has_next_page` | boolean |  |
| `organic_results[]` | object[] |  |
| `organic_results[].date` | string |  |
| `organic_results[].link` | string |  |
| `organic_results[].title` | string |  |
| `organic_results[].domain` | string |  |
| `organic_results[].source` | string |  |
| `organic_results[].snippet` | string |  |
| `organic_results[].position` | integer |  |
| `search_parameters` | object |  |
| `search_parameters.q` | string |  |
| `search_parameters.gl` | string |  |
| `search_parameters.hl` | string |  |
| `search_parameters.page` | integer |  |
| `search_parameters.engine` | string |  |

## Code examples in other languages

Ready-to-run examples live in [`examples/`](examples); each reads your key from `AUTOM_API_KEY`.

| Language | `google-news` |
|---|---|
| cURL (Bash) | [google_news.sh](examples/curl/google_news.sh) |
| PHP | [google_news.php](examples/php/google_news.php) |
| C# | [GoogleNews.cs](examples/csharp/GoogleNews.cs) |
| Go | [google_news.go](examples/go/google_news.go) |
| Java | [GoogleNewsExample.java](examples/java/GoogleNewsExample.java) |
| Ruby | [google_news.rb](examples/ruby/google_news.rb) |
| Node.js | [google_news.mjs](examples/nodejs/google_news.mjs) |

## Use cases

- **Media monitoring** — Track mentions of your brand and competitors.
- **News aggregation** — Build topic feeds from Google News.

## Why Autom?

- **Every SERP in one API** — Google Search, AI Mode, Maps, News, Shopping, Images, Videos, Jobs, Autocomplete, plus Bing and Brave.
- **Structured JSON** — documented fields instead of brittle HTML parsing.
- **Geo & language targeting** — search like a user from the country and language you need.
- **One API key, one header** — `x-api-key` on every request.
- **Copy-paste examples** — Python and TypeScript in each README, 7 more languages in `examples/`.

## FAQ

### How do I authenticate?

Create an account on [Autom](https://app.autom.dev/register), copy your API key and send it in the `x-api-key` header of every request to `https://api.autom.dev`.

### How much does a request cost?

Credits per call: `/v1/google/news` **1**. See [Autom pricing](https://www.autom.dev/pricing).

### Which languages are supported?

Any language that can make an HTTP request. This README shows Python and TypeScript; the [`examples/`](examples) folder contains cURL, PHP, C#, Go, Java, Ruby and Node.js.

## Official SDKs

Use Autom from your own language with a typed client:

| SDK | Package | Install |
| --- | --- | --- |
| Node.js | [`@automdev/sdk`](https://www.npmjs.com/package/@automdev/sdk) | `npm install @automdev/sdk` |
| Python | [`automdev`](https://pypi.org/project/automdev/) | `pip install automdev` |
| Go | [`autom-go`](https://pkg.go.dev/github.com/automdev/autom-go) | `go get github.com/automdev/autom-go` |
| .NET | [`Autom`](https://www.nuget.org/packages/Autom) | `dotnet add package Autom` |
| Ruby | [`autom`](https://rubygems.org/gems/autom) | `gem install autom` |
| PHP | [`autom/sdk`](https://packagist.org/packages/autom/sdk) | `composer require autom/sdk` |
| Java | [`autom-java`](https://github.com/automdev/autom-java) | build from source, see its README |
| CLI | [`@automdev/cli`](https://www.npmjs.com/package/@automdev/cli) | `npm install -g @automdev/cli` |
| MCP server | [`@automdev/mcp`](https://www.npmjs.com/package/@automdev/mcp) | `npx -y @automdev/mcp` |

## Related repositories

- [Google Search API](https://github.com/automdev/google-search-api)
- [Google AI Mode API](https://github.com/automdev/google-ai-mode-api)
- [Google Maps API](https://github.com/automdev/google-maps-api)
- [Google Shopping API](https://github.com/automdev/google-shopping-api)
- [Google Images API](https://github.com/automdev/google-images-api)
- [Google Videos API](https://github.com/automdev/google-videos-api)
- [Google Jobs API](https://github.com/automdev/google-jobs-api)
- [Google Autocomplete API](https://github.com/automdev/google-autocomplete-api)
- [All Autom repositories](https://github.com/automdev)

## Support

- 💬 Join the [Discord](https://discord.gg/CFj3ph8aHU) to ask questions and share what you build.
- 📚 Read the [API reference](https://docs.autom.dev).
- 🔑 [Get your API key](https://app.autom.dev/register).

---

<p align="center">
  <a href="https://www.autom.dev">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="images/logo-dark.svg">
      <img src="images/logo.svg" alt="Autom" height="28">
    </picture>
  </a>
  <br>
  <sub>Built by <a href="https://www.autom.dev">Autom</a>. Examples are released under the MIT license.</sub>
</p>
