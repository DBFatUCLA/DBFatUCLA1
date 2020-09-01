# dbf_v10

A first attempt a DBF website.

## Building

The first time, you may need to run `pub get` to resolve dependencies.
    
Afterwards, building the website is done with `flutter build web`, entering
the `/build/web` directory then lauching a web server with 
`python -m http.server 8888` or `npm start`.
    
**Note:** Flutter will often cache builds within a build cache which can be 
cleaned with `flutter clean`.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
