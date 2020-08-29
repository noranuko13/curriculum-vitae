#!/bin/bash


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
  "/#職務経歴書/d"
  "/#はじめに/d"
  "/#目次/d"
)

## 見出しレベルによる置換パターンの追加
pattern () {
  indent="\s\s\s"
  var=`for ((i=0; i < $1; i++)); do echo -n $indent; done`
  echo "/^${var}\*\s/d"
}
for ((i=0; i < $min; i++)); do
  patterns+=(`pattern $i`)
done
for ((i=max+1; i < 7; i++)); do
  patterns+=(`pattern $i`)
done


# コンソール出力
tmp=$(mktemp)
/gh-md-toc /curriculum-vitae/README.md > $tmp
(for f in "${patterns[@]}" ; do sed -ie $f $tmp; done)
cat $tmp
rm "$tmp"
