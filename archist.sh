#!/bin/bash

# Display ASCII Logo
cat << "EOF"
                _     _     _   
               | |   (_)   | |  
  __ _ _ __ ___| |__  _ ___| |_ 
 / _` | '__/ __| '_ \| / __| __|
| (_| | | | (__| | | | \__ \ |_ 
 \__,_|_|  \___|_| |_|_|___/\__|
                                
EOF

echo "--- Project Configuration ---"

# 1. Project Name
read -p "Project Name (e.g., yourname/project): " PROJ_NAME
PROJ_NAME=${PROJ_NAME:-"vendor/project"}

# 2. Description
read -p "Description: " PROJ_DESC
PROJ_DESC=${PROJ_DESC:-"Clean Architecture project created with Archist"}

# 3. Project Type Selector
echo "Select Project Type:"
options_type=("project" "library" "composer-plugin")
select PROJ_TYPE in "${options_type[@]}"
do
    case $PROJ_TYPE in
        "project"|"library"|"composer-plugin")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done

# 4. License Selector
echo "Select License:"
options_license=("MIT" "Apache-2.0" "GPL-3.0" "Proprietary")
select PROJ_LICENSE in "${options_license[@]}"
do
    case $PROJ_LICENSE in
        "MIT"|"Apache-2.0"|"GPL-3.0"|"Proprietary")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done

# 5. Ask for .env file
read -p "Do you want to include .env support (phpdotenv)? (y/n): " INCLUDE_ENV
INCLUDE_ENV=${INCLUDE_ENV:-"n"}

echo "------------------------------------------"
echo "Scaffolding project: $PROJ_NAME"

# Define the root directories
BASE_DIR="src"
PUBLIC_DIR="public"
TESTS_DIR="tests"

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

# Create directories
for dir in "${DIRECTORIES[@]}"; do
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        echo "CREATED: $dir"
    fi
done

# Define dependecies
DEPENDENCIES="\"php\": \">=8.0\""

# If .env support is requested, add phpdotenv to composer.json
DOTENV_REQUIRE=""
if [[ "$INCLUDE_ENV" == "y" || "$INCLUDE_ENV" == "Y" ]]; then
    DEPENDENCIES="$DEPENDENCIES,
        \"vlucas/phpdotenv\": \"^5.5\""
    echo "Including phpdotenv support..."
    # Create .env file
    cat << EOF > ".env"
APP_NAME="$PROJ_NAME"
APP_ENV=development
EOF
    echo "CREATED: .env"
    cp .env .env.example
    echo "CREATED: .env.example"
fi

# Create the index.php
INDEX_FILE="$PUBLIC_DIR/index.php"
if [ ! -f "$INDEX_FILE" ]; then
    cat << "EOF" > "$INDEX_FILE"
<?php
// Validate if the autoload file exists
if (!file_exists(__DIR__ . '/../vendor/autoload.php')) {
    die('Autoload file not found. Please run "composer install".');
}

require_once __DIR__ . '/../vendor/autoload.php';

// Boot your application here...
EOF
    echo "CREATED: $INDEX_FILE"
fi

# Create custom composer.json
COMPOSER_FILE="composer.json"
if [ ! -f "$COMPOSER_FILE" ]; then
cat << EOF > "$COMPOSER_FILE"
{
    "name": "$PROJ_NAME",
    "description": "$PROJ_DESC",
    "type": "$PROJ_TYPE",
    "license": "$PROJ_LICENSE",
    "autoload": {
        "psr-4": {
            "App\\\\": "src/"
        }
    },
    "autoload-dev": {
        "psr-4": {
            "Tests\\\\": "tests/"
        }
    },
    "require": {
        $DEPENDENCIES
    }
}
EOF
    # Remove trailing comma if phpdotenv is not included
    # sed -i.bak '/,\s*$/s/,$//' "$COMPOSER_FILE" && rm "${COMPOSER_FILE}.bak"
    echo "CREATED: $COMPOSER_FILE"
fi

# Create .gitkeep files
find "$BASE_DIR" -type d -exec touch {}/.gitkeep \;
find "$TESTS_DIR" -type d -exec touch {}/.gitkeep \;

echo "------------------------------------------"
echo "Success! Your Clean Architecture project is ready."
echo "Next steps:"
echo "1. Run 'composer install'"
echo "2. Start coding in src/Domain"