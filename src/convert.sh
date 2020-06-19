#!/bin/sh
TAGS=$(curl --header "Authorization: Bearer $GITLAB_API_TOKEN" $1 | \
jq -c 'map({name: .release.tag_name, date: .commit.created_at, description:.release.description}) | .[] | @base64')
for row in $TAGS  ; do
  _jq() {
    echo ${row} | base64 -d | jq -r ${1}
  }
  echo "---
title: $(_jq '.name') 
date: $(_jq '.date')
---
$(_jq '.description')
" > "$(_jq '.name').md"
done