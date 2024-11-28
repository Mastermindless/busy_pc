#!/bin/bash

# Duration of the simulation in seconds
DURATION=300
END=$((SECONDS + DURATION))

# Color codes
GREEN='\033[1;32m'
RESET='\033[0m'

# Function to display a progress bar
show_progress_bar() {
    local cols=$(tput cols)
    local bar_width=$((cols - 20))
    local progress=0
    local total=100

    while [ $SECONDS -lt $END ]; do
        # Calculate the number of "=" to show in the bar
        local num_equals=$((progress * bar_width / total))
        local bar=$(printf "%0.s=" $(seq 1 $num_equals))
        local spaces=$(printf "%0.s " $(seq 1 $((bar_width - num_equals))))
        
        # Print the progress bar
        printf "\r${GREEN}[%-${bar_width}s] %3d%%${RESET}" "$bar$spaces" "$progress"
        
        # Update progress
        progress=$((progress + 1))
        if [ $progress -gt $total ]; then
            progress=0
        fi
        
        sleep 0.1
    done
    echo
}

# Function to generate Matrix-style falling green letters
matrix_effect() {
    local cols=$(tput cols)
    local lines=$(tput lines)

    while [ $SECONDS -lt $END ]; do
        # Randomly generate green letters in the Matrix style
        for i in $(seq 1 $lines); do
            for j in $(seq 1 $cols); do
                # Randomly print green characters or spaces
                if [ $((RANDOM % 10)) -lt 7 ]; then
                    printf "${GREEN}%s${RESET}" "$(printf \\$(printf '%03o' $((RANDOM % 256))))"
                else
                    printf " "
                fi
            done
            printf "\n"
        done
        sleep 0.1
    done
}

# Clear the screen and start the simulation
clear

# Run the progress bar and Matrix effect in parallel
show_progress_bar &
matrix_effect &
wait