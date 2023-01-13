#!/bin/sh

case "$1" in
clean|cut|format|grep|join|json|look|py|sort|sql|stack|stat)
	cmd="csv$1" ; shift
	exec $cmd "$@"
	exit 42
	;;
*)
	exec "$@"
	exit 43
	;;
esac
