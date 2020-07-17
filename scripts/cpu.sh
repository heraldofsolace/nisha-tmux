#!/usr/bin/env bash

main() {
    #TODO: Mac and Windows maybe?

    percent=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
    echo "CPU $percent"
}

main
