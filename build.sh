#!/bin/sh
# Wraps the artifact fragment (substack-mockup.html) into a standalone
# document for GitHub Pages. The fragment has no <head> of its own because
# Claude artifacts supply one at publish time; a hosted page needs its own,
# above all the viewport meta. Re-run after editing the fragment.
set -e
SRC=substack-mockup.html
OUT=index.html

{
  printf '%s\n' '<!doctype html>' '<html lang="en">' '<head>'
  printf '%s\n' '<meta charset="utf-8">'
  printf '%s\n' '<meta name="viewport" content="width=device-width, initial-scale=1">'
  printf '%s\n' '<meta name="description" content="A Substack mock-up for The Plant Rescuer: the publication page, a post, and how it lands in a subscriber&#39;s inbox.">'
  printf '%s\n' '<meta name="theme-color" content="#2F6B4F" media="(prefers-color-scheme: light)">'
  printf '%s\n' '<meta name="theme-color" content="#0F1512" media="(prefers-color-scheme: dark)">'
  printf '%s\n' '<meta property="og:type" content="website">'
  printf '%s\n' '<meta property="og:title" content="The Plant Rescuer">'
  printf '%s\n' '<meta property="og:description" content="A Substack mock-up: publication page, a post, and the email.">'
  printf '%s\n' '<link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 64 64%22><circle cx=%2232%22 cy=%2232%22 r=%2232%22 fill=%22%23E6F0E9%22/><path d=%22M32 54V30%22 stroke=%22%232F6B4F%22 stroke-width=%223%22 stroke-linecap=%22round%22/><path d=%22M32 36c-8 0-14-6-14-14 8 0 14 6 14 14Z%22 fill=%22%232F6B4F%22/><path d=%22M32 42c8 0 14-6 14-14-8 0-14 6-14 14Z%22 fill=%22%232F6B4F%22/></svg>">'
  # everything above the first <style> belongs in the head: title + font links
  awk 'BEGIN{h=1} /^<style>/{h=0} h{print}' "$SRC"
  printf '%s\n' '</head>' '<body>'
  # the page itself, from <style> onward
  awk '/^<style>/{b=1} b{print}' "$SRC"
  printf '%s\n' '</body>' '</html>'
} > "$OUT"

echo "built $OUT ($(wc -l < "$OUT") lines)"
