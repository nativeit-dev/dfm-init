# @describe Directly evaluate the shell script with the user's local shell.
set -eu
# shellcheck shell=bash
# shellcheck disable=SC1090
. "$ATENV_HELPER_LIB"

# @cmd Start the environment
up() {
	: # nothing to do
}

# @cmd Execute a command in the environment
# @arg command! Command to run
run-in-env() {
	exec sh -c "${argc_command:?}"
}

eval "$(argc --argc-eval "$0" "$@")"
