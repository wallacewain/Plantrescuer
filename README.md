# The Plant Rescuer — Substack mock-up

A visual mock-up of a Substack publication for [@theplantrescuer](https://instagram.com/theplantrescuer).

`substack-mockup.html` holds three switchable views inside a browser frame:

- **Publication page** — masthead, subscribe box, post feed, paid tiers, about
- **A post** — a full post as it reads on the site, with a members' paywall
- **In the inbox** — how an issue arrives as email

All copy, prices, subscriber counts and the illustrated leaf tiles are
placeholders. The "Before it goes live" section at the bottom of the page
lists what needs deciding for real.

## Files

| File | What it is |
| --- | --- |
| `substack-mockup.html` | The source. A Claude artifact *fragment* — no `<head>` of its own, because the artifact host supplies one at publish time. |
| `index.html` | Generated. The same page wrapped as a standalone document for GitHub Pages — adds the doctype, charset, viewport meta and social tags. |
| `build.sh` | Regenerates `index.html` from the fragment. Run it after every edit to the source. |

Edit `substack-mockup.html`, then:

```sh
./build.sh
```

No dependencies beyond Google Fonts, and no build tooling — `build.sh` is
plain `sh` and `awk`.
