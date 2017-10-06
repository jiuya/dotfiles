#!/bin/bash
if type apt-get 2>/dev/null 1>/dev/null
then
echo "hello"
else
    exit 1
fi
package=(nvim tmux xsh)
apt-get install -y aptitude
aptitude install -y "${package[*]}" 
