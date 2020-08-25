import 'package:dbf_v10/DBFAboutPage.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'DBFAppBar.dart';
import 'DBFTeamsPage.dart';

void main() => runApp(DBFWebsite());

class DBFWebsite extends StatelessWidget
{
  final website_title = 'DBF at UCLA';
  static const String home_route = '/';
  static const String teams_route = '/teams';
  static const String about_route = '/about';

  @override
  Widget
  build(BuildContext context)
  {
    return MaterialApp(
      title: website_title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      routes: {
        home_route: (context) => DBFHomepage(
          title: website_title,
          route: home_route
        ),
        teams_route: (context) => DBFTeamsPage(
          title: website_title,
          route: teams_route
        ),
        about_route: (context) => DBFAboutPage(
          title: website_title,
          route: about_route
        )
      }
    );
  }
}

class DBFHomepage extends StatelessWidget
{
  final String _title;
  final String _route;

  DBFHomepage({Key key, String title, String route})
    : _title = title,
      _route = route,
      super(key: key);

  @override
  Widget
  build(BuildContext context)
  {
    return Scaffold(
      appBar: DBFAppBar(title: _title, route: _route),
      body: DBFHomepageContent(),
    );
  }
}


class DBFHomepageContent extends StatefulWidget
{
  static String _path = './assets/images';
  static int _timer_period = 7;
  final List<String> _rotating_images;

  DBFHomepageContent()
      : _rotating_images = new List<String>()
  {
    _rotating_images.add('${_path}/img0.jpg');
    _rotating_images.add('${_path}/img1.png');
    _rotating_images.add('${_path}/img2.jpg');
  }

  @override
  _DBFHomepageContent
  createState() => _DBFHomepageContent();
}

class _DBFHomepageContent extends State<DBFHomepageContent>
{
  Timer _timer;
  int _image = 0;

  @override
  void
  initState()
  {
    super.initState();
    _timer = Timer.periodic(Duration(
      seconds: DBFHomepageContent._timer_period),
      (timer)
      {
        setState(()
        {
          _image = (_image + 1) % widget._rotating_images.length;
        });
      }
    );
  }

  @override
  void
  dispose()
  {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget
  build(BuildContext context)
  {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget> [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 750),
          child: Image(
            image: AssetImage(widget._rotating_images[_image]),
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

