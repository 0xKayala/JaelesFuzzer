#!/bin/bash

# Rename and move JaelesFuzzer.sh file to /usr/bin/JaelesFuzzer
sudo mv JaelesFuzzer.sh /usr/bin/jf

# Make the JaelesFuzzer file executable
sudo chmod u+x /usr/bin/jf

# Remove the JaelesFuzzer folder from the home directory
if [ -d "$home_dir/JaelesFuzzer" ]; then
    echo "Removing JaelesFuzzer folder..."
    rm -r "$home_dir/JaelesFuzzer"
fi

echo "JaelesFuzzer has been installed successfully! Now Enter the command 'jf' to run the tool."
