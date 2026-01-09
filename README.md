# Archist

![Version](https://img.shields.io/badge/version-v1.3.1-blue.svg)
![PHP](https://img.shields.io/badge/php-%3E%3D8.0-777bb4.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)
![Architecture](https://img.shields.io/badge/Architecture-Clean-orange.svg)

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

## Directory Tree

This is the resulting structure after running Archist:

```text
.
├── composer.json
├── public/
│   └── index.php
├── src/
│   ├── Application/
│   │   ├── DTO/
│   │   ├── Service/
│   │   └── UseCase/
│   ├── Domain/
│   │   ├── Entity/
│   │   ├── Exception/
│   │   ├── Repository/
│   │   └── ValueObject/
│   ├── Infrastructure/
│   │   ├── Delivery/
│   │   │   ├── Console/
│   │   │   └── Http/
│   │   ├── ExternalApi/
│   │   └── Persistence/
│   └── Shared/
└── tests/
    ├── Integration/
    └── Unit/
```

## Usage

### 1. Installation

```bash
curl -O https://raw.githubusercontent.com/AFelipeTrujillo/php-archist/v1.3.1/archist.sh
chmod +x archist.sh
./archist.sh

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
### [v1.3.0] - 2026-01-09
- **Interactive CLI**: Added prompts to customize project name, description, type, and license.
- **Dynamic Composer**: Automatic generation of `composer.json` with PSR-4 autoloading for `App\` and `Tests\`.
- **Environment Support**: Optional integration of `vlucas/phpdotenv` with automatic `.env` and `.env.example` creation.
- **Infrastructure Refactor**: Implemented a "Delivery" sub-layer to clearly separate `Http` and `Console` entry points.
- **Safety Check**: Added a vendor validation guard in `public/index.php` to guide users who forget to run composer install.

### [v1.2.0] - 2026-01-08
* **Feature**: Added interactive project configuration (Name, Type, License).
* **Feature**: Automatic composer.json generation with PSR-4 mapping.
* **Improvement**: Added autoload validation in index.php. 

### [v1.1.0] - 2026-01-06

* **Feature**: Added `tests/` directory (Unit & Integration).
* **Architecture**: Refactored Infrastructure to include `Delivery` (Http/Console) for multiple entry points.
* **Enhancement**: Added ASCII Logo to the CLI output.
* **Enhancement**: Improved `public/index.php` with initial boilerplate.

### [v1.0.0] - 2026-01-01

* **Initial Release**: Core Clean Architecture scaffolding.
* Added `Domain`, `Application`, and `Infrastructure` layers.
* Added `.gitkeep` support for tracking empty directories.

---

## License

This project is licensed under the MIT License.
