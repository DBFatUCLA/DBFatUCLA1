# dbf_v10

A first attempt a DBF website.

## Building

The website uses the [Flutter SDK](https://flutter.dev/) to transpile Dart code
into HTML and JS for the actual website.
    
The first time, you may need to run `flutter pub get` to resolve dependencies.
    
When editing the Dart files, you can set up a quick working debug session by
running `flutter run` then choosing from the options flutter provides.
    
For production, building the website is done with `flutter build web --release`, 
which will place the files in the `/build/web` directory.
    
**Note:** Flutter will often cache builds within a build cache which can be 
cleaned with `flutter clean`.
