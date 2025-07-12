# Mobile Application

Development using Flutter Framework
Support build iOS and Android on single codebase.
Using Bloc pattern for state management.
The organization of code follow Clean Architecture.

## Getting Started SDK

- [Flutter version 3.27.2](https://flutter.dev/docs/development/tools/sdk/releases)
- Dart version 3.6.1

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Create `.env` files

Create 3 files `.env.dev`, `.env.staging`, `.env.prod` that have format like this at the `.env/` folder:

```
APP_NAME='quan_ly_tai_chinh'
ENV='development'
BASE_URL=''
BASE_TOKEN=''

ENABLE_DEBUG='true'
```

## Run and build commands:

Before run, check with:

```sh
flutter doctor
```

Run on simulator device:

```sh
flutter run --flavor dev lib/main_dev.dart
```

To build:

```sh
flutter build apk --flavor dev lib/main_dev.dart
flutter build ipa --flavor dev lib/main_dev.dart
```

To create file .g.dart

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

To delete old dependency

```sh
flutter pub cache repair
```

To clean project

```sh
flutter clean
```

To get new packages

```sh
flutter pub get
```

## Generate app icon

##### 1. Update icon files

At kantoku-app/assets/images/icons update files:
background.png
foreground.png
icon.png

##### 2. Generate

In root project run:

```
dart run flutter_launcher_icons:main -f flutter_launcher_icons*
```

# Coding style

follow effective dart: https://dart.dev/guides/language/effective-dart

# Semantic Commit Messages

See how a minor change to your commit message style can make you a better programmer.

Format: `<type>(<scope>): <subject>`

`<scope>` is optional

## Example

```
/‾‾‾‾‾‾‾‾
😼  <  Meow! Please use semantic commit messages
    \________

feat: add hat wobble

<type>(scope): <short summary>
    │    │            │
    │    │            └─> Summary in present tense. Not capitalized. No period at the end.
    │    │
    │    └─> Scope: common|compiler|authentication|core|
    │
    └─> Type: chore, docs, feat, fix, refactor, style, or test.


```

More Examples:

- `feat`: (new feature for the user, not a new feature for build script)
- `fix`: (bug fix for the user, not a fix to a build script)
- `docs`: (changes to the documentation)
- `style`: (formatting, missing semi colons, etc; no production code change)
- `refactor`: (refactoring production code, eg. renaming a variable)
- `test`: (adding missing tests, refactoring tests; no production code change)
- `chore`: (updating grunt tasks etc; no production code change)

References:

- https://www.conventionalcommits.org/
- https://seesparkbox.com/foundry/semantic_commit_messages
- http://karma-runner.github.io/1.0/dev/git-commit-msg.html

# Model naming convention

- api models: Noun + Response + Model
- api params: Noun + Request + Params
- other: Noun + Model

Example:
api models : UserResponseModel
api params: UserRequestParams
other: UserModel

# The color system (app_colors.dart)

- App's colors are created following Material Design color system template at: https://material.io/design/color/the-color-system.html

# Bloc naming convention

- https://bloclibrary.dev/#/blocnamingconventions
