#!/bin/bash

# Duration of the simulation in seconds
DURATION=300
END=$((SECONDS + DURATION))

# Color codes
YELLOW='\033[1;33m'
RESET='\033[0m'

# Pikachu-like creature poses
pose1="
${YELLOW}   (\`o_o\`)
    <(| |)>
     _| |_
${RESET}
"

pose2="
${YELLOW}   (\`^_^)
   <(   )>
     /_\\_
${RESET}
"

pose3="
${YELLOW}   (\`o_o)
    <( | )>
     \\_|_/
${RESET}
"

pose4="
${YELLOW}   (^-^)
    <(   )>
     _|\\_
${RESET}
"

# Function to display dancing Pikachu-like creature
dance() {
    while [ $SECONDS -lt $END ]; do
        clear
        echo -e "$pose1"
        sleep 0.5
        clear
        echo -e "$pose2"
        sleep 0.5
        clear
        echo -e "$pose3"
        sleep 0.5
        clear
        echo -e "$pose4"
        sleep 0.5
    done
}

# Run the animation
dance