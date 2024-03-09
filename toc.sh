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

# コンソール出力
tmp=$(mktemp)
./gh-md-toc --indent=2 --start-depth=1 --depth=3 --no-escape /curriculum-vitae/README.md --token="$GITHUB_TOKEN" > "$tmp"
(for f in "${patterns[@]}" ; do sed -ie "$f" "$tmp"; done)
cat "$tmp"
rm "$tmp"
