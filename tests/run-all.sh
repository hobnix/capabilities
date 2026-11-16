#!/usr/bin/env bash
# Runs every tests/*.sh of this repository against a checkout of the core: HS_CORE=<folder of hobnix/server> bash tests/run-all.sh [name...]
# (CI checks the core out into ./core). A test that exits 77 counts as skipped (a tool is missing); inside a test, HS_TEST_CI=1 makes a missing
# Python module or tool a failure. No test yet: the first capability brings its own tests/<name>.sh.
here=$(cd "$(dirname "$0")" && pwd)
bad=0
if [ $# -gt 0 ]; then set -- "${@/%/.sh}"; else set -- $(cd "$here" && ls *.sh 2>/dev/null | grep -v '^run-all.sh$'); fi
[ $# -eq 0 ] && echo "no tests yet"
for t in "$@"; do
  out=$(HS_CORE="${HS_CORE:-}" REQUIRE_ALL=${HS_TEST_CI:+1} bash "$here/$t" 2>&1); rc=$?
  case $rc in
    0) echo "ok    ${t%.sh}" ;;
    77) echo "skip  ${t%.sh}" ;;
    *) echo "FAIL  ${t%.sh}"; printf '%s\n' "$out" | grep -E 'FAIL|no core' | head -20; bad=1 ;;
  esac
done
exit $bad
