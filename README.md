# Archist

Archist is a lightweight bash utility designed to scaffold **Clean Architecture** directory structures for PHP projects in seconds. It organizes your code into layers, making it decoupled, testable, and easy to maintain.

## Folder Structure

Archist generates a professional layout following the "Screaming Architecture" principle:

* **`src/Domain`**: The heart of your app. Contains Entities, Value Objects, and Repository Interfaces. No external dependencies.
* **`src/Application`**: Orchestration layer. Contains Use Cases, DTOs, and Application Services.
* **`src/Infrastructure`**: Implementation details.
* **`Persistence`**: Database logic (Eloquent, Doctrine, PDO).
* **`Delivery`**: Entry points for the application (**Http** for Web, **Console** for CLI).
* **`ExternalApi`**: Third-party service integrations.
* **`tests/`**: Dedicated space for **Unit** and **Integration** tests.
* **`public/`**: Web server document root. Contains the `index.php` front controller.

## Usage

### Installation

```bash
curl -s [https://raw.githubusercontent.com/AFelipeTrujillo/php-archist/v1.1.0/archist.sh](https://raw.githubusercontent.com/AFelipeTrujillo/php-archist/v1.1.0/archist.sh) | bash

```

### 2. Local Execution

If you have the `archist.sh` file in your machine:

1. **Grant execution permissions:**
```bash
chmod +x archist.sh

```

2. **Run the script:**
```bash
./archist.sh

```
*Note: Windows users should use **Git Bash** or **WSL**.*

## Release History

### [v1.1.0] - 2026-01-06

* **Feature**: Added `tests/` directory (Unit & Integration).
* **Architecture**: Refactored Infrastructure to include `Delivery` (Http/Console) for multiple entry points.
* **Enhancement**: Added ASCII Logo to the CLI output.
* **Enhancement**: Improved `public/index.php` with initial boilerplate.

### [v1.0.0] - 2026-01-01
- **Initial Release**: Core Clean Architecture scaffolding.
- Added `Domain`, `Application`, and `Infrastructure` layers.
- Added `public/index.php` entry point.
- Added `.gitkeep` support for empty directories.