#!/bin/bash

 set -e
 set -u
#set -x

# 見出しレベル
min=2
max=3

## 見出しレベル入力チェック
if [ $min -le 0 ] || [ $min -gt 6 ]; then
  echo "1 <= min <= 6 (min: ${min})"
  exit
fi
if [ $max -le 0 ] || [ $max -gt 6 ]; then
  echo "1 <= max <= 6 (max: ${max})"
  exit
fi

# 置換パターン
patterns=(
  "/#はじめに/d"
  "/#目次/d"
)

## 見出しレベルによる置換パターンの追加
pattern () {
  indent="\s\s"
  var=$(for ((i=0; i < $1; i++)); do echo -n $indent; done)
  echo "/^${var}\*\s/d"
}
for ((i=0; i < min-1; i++)); do
  # shellcheck disable=SC2207
  # https://github.com/koalaman/shellcheck/issues/1476
  patterns+=($(pattern "$i"))
done
for ((i=max; i < 7; i++)); do
  # shellcheck disable=SC2207
  # https://github.com/koalaman/shellcheck/issues/1476
  patterns+=($(pattern "$i"))
done

# * [アスタリスク]() から - [ハイフン]() への変換
patterns+=("s/\*\s/- /")

# コンソール出力
tmp=$(mktemp)
/gh-md-toc --indent 2 /curriculum-vitae/README.md > "$tmp"
(for f in "${patterns[@]}" ; do sed -ie "$f" "$tmp"; done)
cat "$tmp"
rm "$tmp"
