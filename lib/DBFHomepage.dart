import 'package:flutter/material.dart';
import 'dart:async';

class DBFHomepage extends StatefulWidget
{
  static const String _path = './assets/images';
  static const int _timer_period = 5;
  static const List<AssetImage> _rotating_images = [
    AssetImage('${_path}/img0.jpg'),
    AssetImage('${_path}/img1.png'),
    AssetImage('${_path}/img2.jpg')
  ];

  @override _DBFHomepage
  createState() => _DBFHomepage();
}

class _DBFHomepage extends State<DBFHomepage>
{
  Timer _timer;
  int _image = 0;

  @override void
  initState()
  {
    super.initState();
    _timer = Timer.periodic(
      Duration(
        seconds: DBFHomepage._timer_period
      ),
      (timer)
      {
        setState(()
        {
          _image = (_image + 1) % DBFHomepage._rotating_images.length;
        });
      }
    );
  }

  @override void
  dispose()
  {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

  @override Widget
  build(BuildContext context)
  {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget> [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 750),
          child: Image(
            image: DBFHomepage._rotating_images[_image],
            fit: BoxFit.fill,
            width: width,
            height: height,
            key: ValueKey<int>(_image)
          )
        ),
        Container(
          color: Color.fromRGBO(0, 0, 0, 0.5)
        ),  // Darkness filter.
        Center(
          child: const Text(
            'Welcome to Design Build Fly @ UCLA!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )
          )
        )
      ]
    );
  }
}
