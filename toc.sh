#!/bin/bash

 set -e
 set -u
#set -x

# 置換パターン
patterns=(
  "/#はじめに/d"
  "/#目次/d"
)

# * [アスタリスク]() から - [ハイフン]() への変換
patterns+=("s/\*\s/- /")

# 目次置換
TARGET_FILE="/curriculum-vitae/README.md"
tmp=$(mktemp)
./gh-md-toc --hide-header --hide-footer --indent=2 --start-depth=1 --depth=3 --no-escape "$TARGET_FILE" > "$tmp"
(for f in "${patterns[@]}" ; do sed -ie "$f" "$tmp"; done)
{
  sed -n '1,/\[\/\/\]: # (TOC START)/p' "$TARGET_FILE"
  cat "$tmp"
  sed -n '/\[\/\/\]: # (TOC END)/,$p' "$TARGET_FILE"
} > "${TARGET_FILE}.tmp" && mv "${TARGET_FILE}.tmp" "$TARGET_FILE"
rm "$tmp"
