#!/bin/bash

# Define the root directories
BASE_DIR="src"
PUBLIC_DIR="public"
TESTS_DIR="tests"

# Display ASCII Logo
cat << "EOF"
                _     _     _   
               | |   (_)   | |  
  __ _ _ __ ___| |__  _ ___| |_ 
 / _` | '__/ __| '_ \| / __| __|
| (_| | | | (__| | | | \__ \ |_ 
 \__,_|_|  \___|_| |_|_|___/\__|
                                
EOF

# List of directories to create
DIRECTORIES=(
    "$BASE_DIR/Domain/Entity"
    "$BASE_DIR/Domain/ValueObject"
    "$BASE_DIR/Domain/Repository"
    "$BASE_DIR/Domain/Exception"
    "$BASE_DIR/Application/UseCase"
    "$BASE_DIR/Application/DTO"
    "$BASE_DIR/Application/Service"
    "$BASE_DIR/Infrastructure/Persistence"
    "$BASE_DIR/Infrastructure/Delivery/Http"
    "$BASE_DIR/Infrastructure/Delivery/Console"
    "$BASE_DIR/Infrastructure/ExternalApi"
    "$BASE_DIR/Shared"
    "$TESTS_DIR/Unit"
    "$TESTS_DIR/Integration"
    "$PUBLIC_DIR"
)

echo "Starting Clean Architecture scaffolding..."
echo "------------------------------------------"

# Create directories
for dir in "${DIRECTORIES[@]}"; do
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        echo "CREATED: $dir"
    else
        echo "SKIPPED: $dir (Already exists)"
    fi
done

# Create the index.php with a professional comment
INDEX_FILE="$PUBLIC_DIR/index.php"
if [ ! -f "$INDEX_FILE" ]; then
    cat << "EOF" > "$INDEX_FILE"
<?php

/**
 * Archist - Web Entry Point
 * This file is the front controller for your application.
 */

require_once __DIR__ . '/../vendor/autoload.php';

// Boot your application here...
EOF
    echo "CREATED: $INDEX_FILE"
else
    echo "SKIPPED: $INDEX_FILE (Already exists)"
fi

# Create .gitkeep in each folder
find "$BASE_DIR" -type d -exec touch {}/.gitkeep \;
find "$TESTS_DIR" -type d -exec touch {}/.gitkeep \;

echo "------------------------------------------"
echo "Structure created successfully."