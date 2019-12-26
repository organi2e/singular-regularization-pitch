#!/usr/bin/env zsh
COMMENT='automated commit'
git commit -a -m "${COMMENT}" && git push github draft
