#!/bin/bash

# Define the root directories
BASE_DIR="src"
PUBLIC_DIR="public"

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
    "$BASE_DIR/Infrastructure/Http/Controllers"
    "$BASE_DIR/Infrastructure/Http/Middleware"
    "$BASE_DIR/Infrastructure/Console"
    "$BASE_DIR/Infrastructure/ExternalApi"
    "$BASE_DIR/Shared"
    "$PUBLIC_DIR"
)

echo "Starting Clean Architecture scaffolding..."

# Create directories
for dir in "${DIRECTORIES[@]}"; do
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        echo "CREATED: $dir"
    else
        echo "SKIPPED: $dir (Already exists)"
    fi
done

# Create the empty index.php in public folder
INDEX_FILE="$PUBLIC_DIR/index.php"
if [ ! -f "$INDEX_FILE" ]; then
    touch "$INDEX_FILE"
    echo "CREATED: $INDEX_FILE"
else
    echo "SKIPPED: $INDEX_FILE (Already exists)"
fi

# Create a sample .gitkeep in each folder to ensure empty folders are tracked
find "$BASE_DIR" -type d -exec touch {}/.gitkeep \;

echo "Structure created successfully."