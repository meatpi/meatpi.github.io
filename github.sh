#!/usr/bin/env bash
set -x

git diff --quiet
if [ $? -eq 1 ]; then
  set -e
  echo "Uncommitted changes found"
  git add downloads/rel-macos.zip downloads/rel-linux.zip downloads/em1900.zip
  git commit -m "New artifacts: ${GO_PIPELINE_COUNTER}"
  git push
else
  echo "No changes"
fi
