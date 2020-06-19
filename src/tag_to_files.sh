#!/bin/sh
mkdir "$3"
TAGS=$(curl --header "Authorization: Bearer $1" $2 | \
jq -c 'map({name: .release.tag_name, date: .commit.created_at, description:.release.description}) | .[] | @base64')
for row in $TAGS  ; do
  _jq() {
    echo ${row} | base64 -d | jq -r ${1}
  }
  echo "---
title:$(_jq '.name') 
date:$(_jq '.date')
---
$(_jq '.description')
" > $3/"$(_jq '.date')_$(_jq '.name').md"
done