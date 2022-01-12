#!/bin/sh

TOP_DIR="$(cd "$(dirname "$0")"/../../ && pwd)"
[ -z "$TOP_DIR" -o "$TOP_DIR" = "/" ] && TOP_DIR=$PWD
. "$TOP_DIR"/tools/docker/config >/dev/null
