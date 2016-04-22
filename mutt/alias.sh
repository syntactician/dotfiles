#!/bin/sh
# Usage: pipe in an email from mutt to
# automatically create aliases for the sender


# echo $FROM | awk "$PROG"
MESSAGE=$(</dev/stdin)

findSender() {
	grep '^From: '
}

formAlias() {
	awk '{
		$1="";
		if (NF == 3) {print "alias" $0;}
		else if (NF == 2) { print "alias" $0 $0;}
		else if (NF > 3) {print "alias", tolower($(NF-1))"-"tolower($2) $0;}
	}'
}

main() {
	ALIAS=$(echo "$MESSAGE" | findSender | formAlias)
	if ! grep -Fxq "$ALIAS" $HOME/.mutt/aliases; then
		echo "$ALIAS" >> $HOME/.mutt/aliases
	fi

	echo "$MESSAGE"
}

main
