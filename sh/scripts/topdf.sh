#!/bin/sh
# relies on pandoc, libreoffice
# TODO: allow specifying conversion strategy, eating additional args

ARGS="$@"

usage(){
	echo "Usage: $(basename $0) [file]" >&2
	exit 1
}

loToPDF(){
	libreoffice --headless --convert-to pdf "$1"
	# expect strange errors if no JVM installed
}

pdToPDF(){
	pandoc -s -o "${1%.*}.pdf" "$1"
}

toPdf(){
	# libreoffice never exits non-zero
	# we have to do this manually
	FILE="$1"
	LO="doc docx ppt pptx"
	EXT="${FILE#*.}"

	CONVERTER='pdToPDF'

	for TYPE in $LO; do
		[ $TYPE = $EXT ] && CONVERTER='loToPDF'
	done

	$CONVERTER "$FILE"
}

main(){
	if [ $# -ne 1 ] || ! [ -f "$1" ]; then
		usage
	else
		toPdf "$1"
	fi
}

main $ARGS
