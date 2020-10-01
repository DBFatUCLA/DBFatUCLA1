import 'package:flutter/material.dart';
import 'dart:async';

const String path = './assets/images';
const int timerPeriod = 5;
const List<AssetImage> rotatingImages = [
  AssetImage('$path/img1.jpg'),
  AssetImage('$path/img2.jpg'),
  AssetImage('$path/img3.jpg'),
];

/// Welcome page of the website.
/// Carousels through images in the background while a welcome message is
/// displayed in the center.
///
class DbfHomepage extends StatefulWidget {
  @override
  _DbfHomepage createState() => _DbfHomepage();
}

class _DbfHomepage extends State<DbfHomepage> {
  Timer _timer;
  static int _image = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: timerPeriod), (timer) {
      setState(() {
        _image = (_image + 1) % rotatingImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 750),
          child: Image(
            image: rotatingImages[_image],
            fit: BoxFit.fill,
            key: ValueKey<int>(_image),
            width: double.infinity,
            height: double.infinity,
            gaplessPlayback: true,
          ),
        ),
        Container(
          // Darkness filter.
          color: Color.fromRGBO(0, 0, 0, 0.5),
        ),
        Center(
          child: const Text(
            'Welcome to Design Build Fly @ UCLA!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
