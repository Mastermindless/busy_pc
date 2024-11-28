#!/bin/bash

# Duration of the simulation in seconds
DURATION=300
END=$((SECONDS + DURATION))

# Color codes
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# Array of quotes
quotes=(
    "To be, or not to be, that is the question."
    "All the world's a stage, and all the men and women merely players."
    "The course of true love never did run smooth."
    "Some are born great, some achieve greatness, and some have greatness thrust upon them."
    "If music be the food of love, play on."
    "This above all: to thine own self be true."
    "Though she be but little, she is fierce."
    "What's in a name? That which we call a rose by any other name would smell as sweet."
    "Love looks not with the eyes, but with the mind, and therefore is winged Cupid painted blind."
    "Parting is such sweet sorrow, that I shall say good night till it be morrow."
)

# Function to display a random quote
show_quote() {
    local quote="${quotes[$((RANDOM % ${#quotes[@]}))]}"
    echo -e "\n${CYAN}$quote${RESET}"
}

# Function to display a progress bar
show_progress_bar() {
    local cols=$(tput cols)
    local bar_width=$((cols - 20))
    local progress=0
    local total=100

    while [ $progress -le $total ]; do
        # Calculate the number of "=" to show in the bar
        local num_equals=$((progress * bar_width / total))
        local bar=$(printf "%0.s=" $(seq 1 $num_equals))
        local spaces=$(printf "%0.s " $(seq 1 $((bar_width - num_equals))))
        
        # Print the progress bar
        printf "\r${GREEN}[%-${bar_width}s] %3d%%${RESET}" "$bar$spaces" "$progress"
        
        # Update progress
        progress=$((progress + 5))
        sleep 0.2
    done
    echo
}

# Clear the screen and start the simulation
clear

# Main loop
while [ $SECONDS -lt $END ]; do
    show_quote       # Display a random quote
    show_progress_bar # Display the progress bar
    sleep 1          # Short pause before the next loop
done