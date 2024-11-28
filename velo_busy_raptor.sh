#!/bin/bash

# ASCII art
ascii_art="
                                                     ___._
                                                   .'  <0>'-.._
                                                  /  /.--.____\")
                                                 |   \\   __.-'~
                                                 |  :  -'/
                                                /:.  :.-'
__________                                     | : '. |
'--.____  '--------.______       _.----.-----./      :/
        '--.__            \`'----/       '-.      __ :/
              '-.___           :           \\   .'  )/
                    '---._           _.-'   ] /  _/
                         '-._      _/     _/ / _/
                             \\_ .-'____.-'__< |  \\___
                               <_______.\\    \\_\\_---.7
                              |   /'=r_.-'     _\\\\ =/
                          .--'   /            ._/'>
                        .'   _.-'
                       / .--'
                      /,/
                     (|/>>"

# Duration of the animation in seconds
DURATION=300  # Total animation time (5 minutes)
FRAME_DELAY_MS=100  # Frame delay in milliseconds (100ms = 0.1s)

# Function to animate ASCII art moving each line by +1 space
animate() {
    local cols=$(tput cols)  # Terminal width
    local offset=0  # Initial offset for spaces
    local frames=$((DURATION * 1000 / FRAME_DELAY_MS))  # Total frames based on duration and frame delay

    for ((frame=0; frame<frames; frame++)); do
        clear

        # Print each line of ASCII art with the current offset
        echo "$ascii_art" | while IFS= read -r line; do
            printf "%*s%s\n" $offset "" "$line"
        done

        # Increment offset for the next frame
        offset=$((offset + 1))

        # Reset offset if it exceeds terminal width
        if [ $offset -ge $cols ]; then
            offset=0
        fi

        # Pause for the frame delay
        sleep $(echo "scale=3; $FRAME_DELAY_MS/1000" | bc)  # Convert delay to seconds using `bc`
    done
}

# Run the animation
animate