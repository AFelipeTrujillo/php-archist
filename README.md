# Archist

Archist is a lightweight bash utility designed to scaffold **Clean Architecture** directory structures for PHP projects in seconds.

## Folder Structure

The script generates the following professional layout:

- **src/Domain**: Core business logic (Entities, Value Objects, Repository Interfaces).
- **src/Application**: Orchestration (Use Cases, DTOs, Services).
- **src/Infrastructure**: Technical implementation (Persistence, HTTP, Console, External APIs).
- **src/Shared**: Cross-cutting concerns.
- **public/**: Web server entry point containing an empty `index.php`.

## Usage

### 1. Remote Execution (One-liner)
You can run Archist without downloading the file:
```bash
curl -s [https://raw.githubusercontent.com/YOUR_USERNAME/archist/main/archist.sh](https://raw.githubusercontent.com/YOUR_USERNAME/archist/main/archist.sh) | bash

```

### 2. Local Execution

If you have the `archist.sh` file locally, follow these steps:

1. **Give execution permissions:**
```bash
chmod +x archist.sh

```

2. **Run the script:**
```bash
./archist.sh

```

*Note: If you are on Windows, please use **Git Bash** or **WSL** to execute the script.*

## Customization

The script creates `.gitkeep` files in every directory to ensure that your Git repository tracks the empty folder structure from the start.