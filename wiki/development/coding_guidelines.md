# Yeti Project Coding Guidelines

This document provides a comprehensive guide for developers contributing to the Yeti project. Adhering to these guidelines is crucial for maintaining code quality, consistency, and readability.

## 1. Onboarding: First Steps

Welcome to the team! Before writing any code, please familiarize yourself with the following:

1.  **Read the `README.md`**: This provides a high-level overview of the project's purpose, features, and core technologies (ESP32-S3, ESP-IDF).
2.  **Understand the Architecture**: The project is highly modular. Explore the `components/` directory to understand the different services and drivers that make up the system.
3.  **Review `main/main.c`**: This file is the application's entry point (`app_main`). It shows the initialization sequence and how all the modules are brought together.

## 2. Core Technology and Structure

- **Framework**: The project is built using the **ESP-IDF (v5.5.1)** framework. All code is written in C.
- **Build System**: We use **CMake** as the build system, configured by the `CMakeLists.txt` files in the project root and each component.
- **Modular Architecture**: The project's functionality is broken down into self-contained modules located in `components/`.
    - Each module is prefixed with `yeti-` (e.g., `yeti-wifi`, `yeti-mqtt`).
    - Each module should have a clear, single responsibility.
    - The `main/main.c` file orchestrates the initialization and interaction of these modules.

## 3. Coding Style and Formatting

**This is non-negotiable.** We enforce a strict and consistent coding style across the entire project.

- **Automated Formatting**: All code is formatted using **`.clang-format`**, which is based on the LLVM style.
- **Key Style Rules**:
    - **Indentation**: 4 spaces. **No tabs.**
    - **Brace Style**: Allman ("egyptian brackets") for control statements.
        ```c
        if (condition)
        {
            // ...
        }
        else
        {
            // ...
        }
        ```
    - **Pointers**: The `*` should be adjacent to the variable name: `int *ptr;`
- **Action Required**: Configure your IDE or editor to **automatically format on save** using the project's `.clang-format` file. This prevents formatting inconsistencies.

## 4. Project Conventions

### Custom Abstractions (Very Important)

We use our own custom wrappers and abstractions over standard ESP-IDF functions. **You must use these project-specific APIs.** They provide consistency, enhanced features, and easier maintenance.

- **Logging**: Do **not** use `printf` or `ESP_LOG`. Use the custom logging macros from `yeti-log.h`.
    - `YETI_LOGI(tag, "Information message: %d", value);`
    - `YETI_LOGW(tag, "Warning message");`
    - `YETI_LOGE(tag, "Error message");`
    - These macros are color-coded and will integrate with future remote logging features.

### Naming Conventions

- **Variables & Functions**: `snake_case` (e.g., `my_variable`, `process_data`).
- **Macros & Constants**: `UPPER_SNAKE_CASE` (e.g., `MAX_BUFFER_SIZE`).
- **Structs, Enums, Typedefs**: `PascalCase` or a `_t` suffix (e.g., `WifiConfig`, `system_state_t`). Follow the convention in the module you are working on.

### Error Handling

- Functions that can fail **must** return an `esp_err_t`.
- Check the return value of every function that returns an error code.
- Use the `ESP_OK` value to check for success.

## 5. Configuration and Dependencies

- **Feature Management**: Project features are enabled or disabled using **Kconfig**. You can see this in `main.c` with `#ifdef` blocks (e.g., `#ifdef CONFIG_YETI_USE_BLE`). To change the configuration, run `idf.py menuconfig`.
- **External Libraries**: Third-party dependencies (e.g., `esp-modbus`) are managed by the **ESP-IDF Component Manager**.
    - Dependencies are declared in `idf_component.yml` files.
    - The `dependencies.lock` file tracks the exact versions used. Do not modify this file manually.

## 6. Documentation

- **Doxygen**: Public functions, structs, enums, and file headers must be documented using Doxygen-style comments. This is essential for generating API documentation.
    ```c
    /**
     * @brief Initializes the WiFi module.
     *
     * This function sets up the WiFi station or AP based on Kconfig settings.
     *
     * @return ESP_OK on success, or an error code on failure.
     */
    esp_err_t yeti_wifi_init(void);
    ```

## 7. Version Control (Git)

- **Branching**: Create a new feature branch from `main` for any new development or bug fix (e.g., `feature/new-sensor` or `fix/login-bug`).
- **Commit Messages**: Write clear, descriptive commit messages.
    - **Subject**: A concise summary (<=50 chars).
    - **Body**: Explain the _what_ and _why_ of the change (wrap at 72 chars).
- **Pull Requests**: All changes must be submitted as a Pull Request (PR) and reviewed by at least one other developer before being merged into `main`.
