#!/bin/sh

ARGS="$@"
NARGS="$#"

SOURCE="${!NARGS}"
FILE=$(dirname -- "$SOURCE")/new-$(basename -- "$SOURCE")

main() {
	mv -- "$SOURCE" "$FILE" || exit
	while [ "$NARGS" -gt 1 ]; do
		set -- "$@" "$1"
		shift
		NARGS=$((NARGS - 1))
	done
	shift

	"$@" "$FILE"
}

main $ARGS
