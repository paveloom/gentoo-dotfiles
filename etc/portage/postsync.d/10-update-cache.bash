#!/usr/bin/env bash

source /lib/gentoo/functions.sh

ebegin "Updating cache"
emerge --regen --jobs=0 >/dev/null
eend $?
