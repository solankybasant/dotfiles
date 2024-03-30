#!/bin/bash

# Read the JSON file and extract quote texts
# quotes=$(jq -r '.quotes[].quote' ~/dotfiles/hypr/scripts/quotes.json)
quotes=$(jq -r '.quotes[] | "\(.quote) ~ \(.author)"' ~/dotfiles/hypr/scripts/quotes.json)

# Count the number of quotes
num_quotes=$(echo "$quotes" | wc -l)

# Generate a random number within the range of available quotes
random_index=$((RANDOM % num_quotes))

# Select the quote at the random index
random_quote=$(echo "$quotes" | sed -n "${random_index}p")

# Echo the random quote
echo "$random_quote"

