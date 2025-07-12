<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This firebase_service package provides some easy ready-to-use functions which are using firebase APIs.

## Features
- Added sending notification to the client app from the server using Firebase Cloud Messaging (FCM) API.
- Added crash reporting using Firebase Crashlytics API.
- Added Google Sign-In methods
- Added Facebook Sign-In methods

## Getting started
1. Setup firebase core to the app follow this link https://firebase.flutter.dev/docs/manual-installation/
2. Setup firebase crashlytics to the app follow this link https://firebase.flutter.dev/docs/crashlytics/overview
3. Setup firebase cloud messaging to the app follow this link https://firebase.flutter.dev/docs/messaging/overview/
4. (optional) if you want to use Google Sign-In function, setup google sign-in follow this link https://pub.dev/packages/google_sign_in
5. (optional) if you want to use Apple Sign-In function, setup Apple sign-in follow this link https://pub.dev/packages/sign_in_with_apple
6. (optional) if you want to use Facebook Sign-In function, setup Facebook sign-in follow this link https://pub.dev/packages/flutter_facebook_auth


## Usage
* apply [firebase crashlytics] and [Firebase cloud Messaging] to the app follow these step:
1. Call the [FireBaseService.init] function as soon as possible (before runApp function) to init firebase instance
2. Assign the [FireBaseService.recordError] method to onError parameter of runZonedGuarded method in main.dart (more detail at https://firebase.flutter.dev/docs/crashlytics/usage) to send app crashes to firebase
3. Call the [FireBaseService.listeners] function after app completely running (after runApp function) to setup firebase notification remote messages listener
4. (optional) sign in with google using [GoogleAuthentication.instance.signIn] or sign out using [GoogleAuthentication.instance.signOut] and more
5. (optional) sign in with Apple using [AppleAuthentication.instance.signIn] or sign out using [AppleAuthentication.instance.signOut] and more
6. (optional) sign in with facebook using [FacebookAuthentication..instance.signIn] or sign out using [FacebookAuthentication.instance.signOut] and more



## Additional information
- more information about Social Authentication: https://firebase.flutter.dev/docs/auth/social
