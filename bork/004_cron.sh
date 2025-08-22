#!/usr/bin/env bork satisfy
# BORK_CONTEXT: EVERYWHERE

DEV_UTILS_DIR=$HOME/git_src/dev_utils
DEV_UTILS_PRIVATE_DIR=$HOME/git_src/dev_utils_private

#
# Crons
#

# TODO: box-specific cron
# $DEV_UTILS_PRIVATE_DIR/$(hostname)/


temp_cronfile=$(mktemp -d)/crontab
cat $DEV_UTILS_DIR/cron/crontab                     >  ${temp_cronfile}
cat $DEV_UTILS_PRIVATE_DIR/$(hostname)/cron/crontab >> ${temp_cronfile} 2>/dev/null


ok check "diff -q <(crontab -l) ${temp_cronfile}"
if check_failed && satisfying; then
	ok check "crontab ${temp_cronfile}"
fi





