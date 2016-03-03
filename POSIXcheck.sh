#!/bin/sh
POSIX="admin alias ar asa at awk basename batch bc bg break c99 cal cat cd cflow chgrp chmod chown cksum cmp colon comm command compress continue cp crontab csplit ctags cut cxref date dd delta df diff dirname dot du echo ed env eval ex exec exit expand export expr false fc fg file find fold fort77 fuser gencat get getconf getopts grep hash head iconv id ipcm ipcs jobs join kill lex link ln locale localedef logger logname lp ls m4 mailx make man mesg mkdir mkfifo more mv newgrp nice nl nm nohup od paste patch pathchk pax pr printf prs ps pwd qalter qdel qhold qmove qmsg qrerum qrls qselect qsig qstat qsub read readonly renice return rm rmdel rmdir sact sccs sed set sh shift sleep sort split strings strip stty tabs tail talk tee test time times touch tput tr trap true tsort tty type ulimit umask unalias uname uncompress unexpand unget uniq unlink unset uuccp uudecode uuencode uustate uux val vi wait wc what who write xargs yacc zcat"

for UTILITY in $POSIX; do
	command -v $UTILITY >/dev/null 2>&1 && echo "$(type $UTILITY)" || echo "$UTILITY is absent"
done
