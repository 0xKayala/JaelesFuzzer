#!/bin/bash

# ANSI color codes
RED='\033[91m'
RESET='\033[0m'

# ASCII art
echo -e "${RED}"
cat << "EOF"
       __           __          ______                         
      / /___ ____  / /__  _____/ ____/_  __________  ___  _____
 __  / / __ `/ _ \/ / _ \/ ___/ /_  / / / /_  /_  / / _ \/ ___/
/ /_/ / /_/ /  __/ /  __(__  ) __/ / /_/ / / /_/ /_/  __/ /    
\____/\__,_/\___/_/\___/____/_/    \__,_/ /___/___/\___/_/   v1.0.0

                               Made by Satya Prakash (0xKayala)
EOF
echo -e "${RESET}"

# Help menu
display_help() {
    echo -e "JaelesFuzzer is a Powerful Automation tool for detecting XSS, SQLi, SSRF, Open-Redirect, etc. vulnerabilities in Web Applications\n\n"
    echo -e "Usage: $0 [options]\n\n"
    echo "Options:"
    echo "  -h, --help              Display help information"
    echo "  -d, --domain <domain>   Single domain to scan for XSS, SQLi, SSRF, Open-Redirect, etc. vulnerabilities"
    echo "  -f, --file <filename>   File containing multiple domains/URLs to scan"
    exit 0
}

# Get the current user's home directory
home_dir=$(eval echo ~"$USER")

excluded_extentions="png,jpg,gif,jpeg,swf,woff,svg,pdf,json,css,js,webp,woff,woff2,eot,ttf,otf,mp4,txt"

# Check if ParamSpider is already cloned and installed
if [ ! -d "$home_dir/ParamSpider" ]; then
    echo "Cloning ParamSpider..."
    git clone https://github.com/0xKayala/ParamSpider "$home_dir/ParamSpider"
fi

# Check if jaeles is installed, if not, install it
if ! command -v jaeles &> /dev/null; then
    echo "Installing Jaeles..."
    go install github.com/jaeles-project/jaeles@latest
fi

# Check if jaeles signatures are already cloned.
if [ ! -d "$home_dir/jaeles-signatures" ]; then
    echo "Cloning jaeles-signatures..."
    git clone --depth=1 https://github.com/0xKayala/jaeles-signatures "$home_dir/jaeles-signatures" && jaeles config -a reload --signDir "$home_dir/jaeles-signatures"
fi

# Check if httpx is installed, if not, install it
if ! command -v httpx -up &> /dev/null; then
    echo "Installing httpx..."
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
fi

# Parse command line arguments
while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        -h|--help)
            display_help
            ;;
        -d|--domain)
            domain="$2"
            shift
            shift
            ;;
        -f|--file)
            filename="$2"
            shift
            shift
            ;;
        *)
            echo "Unknown option: $key"
            display_help
            ;;
    esac
done

# Step 2: Ask the user to enter the domain name or specify the file
if [ -z "$domain" ] && [ -z "$filename" ]; then
    echo "Please provide a domain with -d or a file with -f option."
    display_help
fi

# Combined output file for all domains
output_file="output/allurls.yaml"

# Step 3: Get the vulnerable parameters based on user input
if [ -n "$domain" ]; then
    echo "Running ParamSpider on $domain"
    python3 "$home_dir/ParamSpider/paramspider.py" -d "$domain" --exclude "$excluded_extentions" --level high --quiet -o "output/$domain.yaml"
elif [ -n "$filename" ]; then
    echo "Running ParamSpider on URLs from $filename"
    while IFS= read -r line; do
        python3 "$home_dir/ParamSpider/paramspider.py" -d "$line" --exclude "$excluded_extentions" --level high --quiet -o "output/$line.yaml"
        cat "output/$line.yaml" >> "$output_file"  # Append to the combined output file
    done < "$filename"
fi

# Step 4: Check whether URLs were collected or not
if [ ! -s "output/$domain.yaml" ] && [ ! -s "$output_file" ]; then
    echo "No URLs Found. Exiting..."
    exit 1
fi

# Step 5: Run the Jaeles Fuzzing Signatures on the collected URLs
echo "Running Jaeles on collected URLs"
if [ -n "$domain" ]; then
    # Use a temporary file to store the sorted and unique URLs
    temp_file=$(mktemp)
    sort "output/$domain.yaml" | uniq > "$temp_file"
    httpx -silent -mc 200,301,302,403 -l "$temp_file" | jaeles scan -c 50 -s /home/kali/jaeles-signatures/fuzz/common
    rm -r "$temp_file"  # Remove the temporary file
elif [ -n "$filename" ]; then
    sort "$output_file" | uniq > "$temp_file"
    httpx -silent -mc 200,301,302,403 -l "$temp_file" | jaeles scan -c 50 -s /home/kali/jaeles-signatures/fuzz/common
    rm -r "$temp_file"  # Remove the temporary file
fi

# Step 6: End with a general message as the scan is completed
echo "Scan is completed - Happy Fuzzing"
