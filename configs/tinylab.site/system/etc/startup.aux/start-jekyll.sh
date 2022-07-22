#!/bin/bash
#
# start-jekyll.sh -- start the jekyll service
#

[ -z "$JEKYLL_SRC" ] && JEKYLL_SRC=~/jekyll-bootstrap/
# For regular users, must bigger than 1024
[ -z "$JEKYLL_PORT" ] && JEKYLL_PORT=8080
[ -z "$JEKYLL_IFACE" ] && JEKYLL_IFACE=eth0
[ -z "$JEKYLL_HOST" ] && JEKYLL_HOST=`ifconfig $JEKYLL_IFACE | grep "inet " | tr -d -c '^[0-9. ]' | awk '{print $1}'`
[ -z "$JEKYLL_HOST" ] && JEKYLL_HOST=`ifconfig br0 | grep "inet " | tr -d -c '^[0-9. ]' | awk '{print $1}'"`

[ -z "$UNIX_USER" ] && UNIX_USER=ubuntu

(cd $JEKYLL_SRC && \
echo "LOG: Waiting for source code being ready" && \
( while [ ! -f $JEKYLL_SRC/.git ]; do sleep 1; done ) && \
echo "LOG: source code is ready." && \
sudo -u $UNIX_USER /usr/local/bin/jekyll s -w --future --limit_posts 10 -s $JEKYLL_SRC -P $JEKYLL_PORT -H $JEKYLL_HOST )&
