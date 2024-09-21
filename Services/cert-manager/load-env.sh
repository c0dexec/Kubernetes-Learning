#!/bin/bash
set -e

# .env keys name cannot contain "-"

Red='\033[0;31m'
Cyan='\033[0;36m'
End='\033[m'

if [ $? -eq 0 ]; then
    # Prints status in stderror to prevent piping issues.
    echo -e "Variables loaded are," >&2

    for var in $(cat "$1")
    do
        key=$(cut -d = -f 1 <<< ${var})
        value=$(cut -d = -f 2 <<< ${var} | sed -e 's/^"//' -e 's/"$//')
        export ${key}=${value}
        # Prints status in stderror to prevent piping issues.
        echo -e "   Key='${Cyan}${key}${End}'" >&2 #, result of 'echo ${Cyan}${key}${End}' is ${Red}$(eval echo '$'{$key})${End}"
    done
    # Any arguments will be executed here, where command injection can be perfromed.
    exec "$2" 
else
    # stderr output
    >&2 echo -e 'This is bad.'
fi