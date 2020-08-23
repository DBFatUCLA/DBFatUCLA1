import 'package:flutter/material.dart';

import 'dart:async';

import 'DBFAppBar.dart';
import 'DBFTeamsPage.dart';

void main() => runApp(DBFWebsite());

class DBFWebsite extends StatelessWidget
{
  final website_title = 'DBF at UCLA';

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
        '/': (context) => DBFHomepage(website_title),
        '/teams': (context) => DBFTeamsPage(website_title)
      }
    );
  }
}

class DBFHomepage extends StatelessWidget
{
  final String title;

  DBFHomepage(this.title, {Key key}) : super(key: key);

  @override
  Widget
  build(BuildContext context)
  {
    return Scaffold(
      appBar: DBFAppBar(appbar_title: title),
      body: DBFHomepageContent(),
    );
  }
}


class DBFHomepageContent extends StatefulWidget
{
  final String path = './assets/images/';
  final List<String> _rotating_images;
  final int _timer_period = 7;

  DBFHomepageContent()
      : _rotating_images = new List<String>()
  {
    _rotating_images.add('./assets/images/rowlet.png');
    _rotating_images.add('./assets/images/wooloo.png');
    _rotating_images.add('./assets/images/sprucecaboose.png');
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
    _timer = Timer.periodic(Duration(seconds: widget._timer_period), (timer) {
      setState(() {
        _image = (_image + 1) % widget._rotating_images.length;
      });
    });
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget> [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Image(
            image: AssetImage(widget._rotating_images[_image]),
            fit: BoxFit.fill,
            width: width,
            height: height,
            key: ValueKey<int>(_image)
          )
        ),
        Container(color: Color.fromRGBO(0, 0, 0, 0.5)),  // Darkness filter.
        Center(
          child: const Text(
            'Come Fly with Design Build Fly @ UCLA!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 50.0,
              fontFamily: 'bold',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )
          )
        )
      ]
    );
  }
}

