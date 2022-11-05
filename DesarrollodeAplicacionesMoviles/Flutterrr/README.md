# Flutter

## What is Flutter?

- Es un producto multiplataforma de Google.

- Se programa en Dart.

## How does it work?

- Everything is a widget.

## To run

- Execute the emulator (choose the cold boot).

- In vscode, choose the `run` option and click on `Run without debugging`.

## Create a new app

- `flutter create first_app_class`

## Installation

- Follow the official documentation.
 
    When executing `run doctor`.

        If issue with toolchain.
            Open:
                - Android studio
                - Settings
                - SDK manager
                - SDK tools
            Check:
                - Android command line tools
                - Android sdk platform tools.

        If issue with chrome.
            It's safe to ignore(?)
        If not
            - CHROME_EXECUTABLE=/bin/brave-browser
            - export CHROME_EXECUTABLE

        If flutter not recognized.
            - export PATH="$PATH:~/Downloads/Programs/flutter/bin"

- Install `flutter` extension in vscode.

