#!/bin/bash

# Source the environment variables from the .env file
if [ -f .env ]; then
  source .env
else
  echo ".env file not found! Please create it with the necessary variables."
  exit 1
fi

