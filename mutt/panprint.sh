#!/bin/sh
# save a document as a pdf
# usage: declare with print flag in mailcap

ARGS="$@"
NARGS="$#"

PRINTDIR="${HOME}/documents"

mvPDF(){
	mv $1 $2
}

toPDF(){
	pandoc -t latex -o "$2" -s "$1"
}

main() {
	SOURCE="${!NARGS}"
	BASENAME="$(basename $SOURCE)"

	EXT="${BASENAME##*.}"
	FILE="${PRINTDIR}/${BASENAME%.*}.pdf"

	if [ $EXT = 'pdf' ] ; then
		mvPDF $SOURCE $FILE
	else
		toPDF $SOURCE $FILE
	fi
}

main "$ARGS"
