#!/bin/sh

ARGS="$@"

# 10.00 14 May 2017 EST
GRAD=1494687600
NOW=$(date +%s)

HELL=$((GRAD - NOW))

DAYS="$(( HELL / 86400)) days"
HOUR="$(((HELL % 86400)  / 3600)) hours"
MINS="$(((HELL %  3600)  /   60)) minutes"
SECS="$(( HELL %    60)) seconds"

TIMES='$DAYS $HOUR $MINS $SECS'

usage(){
	cat <<-EOF >&2
	usage: $(basename $0) [precision]
	EOF
}

scope(){
	case $1 in
		day|days)           COUNT=1        ;;
		hr|hour|hours)      COUNT=2        ;;
		min|minute|minutes) COUNT=3        ;;
		sec|second|seconds) COUNT=4        ;;
		*)                  COUNT=0; usage ;;
	esac

	for TIME in $TIMES; do
		if [ $COUNT -gt 1 ]; then
			eval echo "${TIME}" | tr -d '\n'
			printf ', '
		elif [ $COUNT -gt 0 ]; then
			eval echo "${TIME}"
		fi

		COUNT=$((COUNT - 1))
	done
}

autoScope(){
	if [ $HELL -lt 86400 ]; then
		printf "${DAYS}, ${HOUR}, ${MINS}, ${SECS}"
	elif [ $HELL -lt 4320000 ]; then
		printf "${DAYS}, ${HOUR}"
	else
		printf "${DAYS}"
	fi
}

main(){
	if [ -z "$1" ]; then
		TIME=$(autoScope)
	else
		TIME=$(scope $1)
	fi

	echo "${TIME}"
}

main $ARGS
