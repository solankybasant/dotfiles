#!/bin/bash

# Read the JSON file and extract jokeText values
jokes=$(jq -r '.[].jokeText' jokes.json)

# Count the number of jokes
num_jokes=$(echo "$jokes" | wc -l)

# Generate a random number within the range of available jokes
random_index=$((RANDOM % num_jokes))

# Select the joke at the random index
random_joke=$(echo "$jokes" | sed -n "${random_index}p")

# Echo the random joke
echo "$random_joke"

