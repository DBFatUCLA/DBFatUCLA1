import 'package:flutter/material.dart';
import 'dart:async';

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
      home: DBFHomepage(title: website_title)
    );
  }
}

class DBFHomepage extends StatelessWidget
{
  final String title;

  DBFHomepage({Key key, this.title}) : super(key: key);

  @override
  Widget
  build(BuildContext context)
  {
    return Scaffold(
      appBar: DBFAppBar(appbar_title: title),
      body: DBFHomepageContent(),
      drawer: DBFSidebar()
    );
  }
}

class DBFAppBar extends StatefulWidget implements PreferredSizeWidget
{
  final String appbar_title;
  final Color text_color;

  @override
  final Size preferredSize;

  DBFAppBar({Key key, this.appbar_title})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        text_color = Colors.white,
        super(key: key);

  @override
  _DBFAppBarState
  createState() => _DBFAppBarState();
}

class _DBFAppBarState extends State<DBFAppBar>
{
  @override
  AppBar
  build(BuildContext context)
  {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.airplanemode_active),
        onPressed: () { Scaffold.of(context).openDrawer(); }
      ),
      title: FlatButton(
        textColor: widget.text_color,
        hoverColor: Colors.transparent,
        onPressed:
          () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('TODO: implement home.')));
          },
        child: Text(widget.appbar_title)
      ),
      actions: <Widget> [
        FlatButton(
          textColor: widget.text_color,
          onPressed:
            () { Navigator.popUntil(context, ModalRoute.withName('/')); },
          child: Text('About')
        ),
        FlatButton(
          textColor: widget.text_color,
          onPressed:
            () { Navigator.popUntil(context, ModalRoute.withName('/')); },
          child: Text('Teams')
      ),
        FlatButton(
          textColor: widget.text_color,
          onPressed:
            () { Navigator.popUntil(context, ModalRoute.withName('/')); },
          child: Text('Leads')
        )
      ]
    );
  }
}

class DBFHomepageContent extends StatefulWidget
{
  final List<String> _rotating_images;

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
  final int _timer_period = 7;
  int _image = 0;

  @override
  void
  initState()
  {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: _timer_period), (timer) {
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
          child: const Text('Welcome to Design Build Fly @ UCLA!',
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

class DBFSidebar extends Drawer
{
  final String header = 'Meet the teams';

  @override
  Drawer
  build(BuildContext context)
  {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 1.0),
        children: <Widget> [
          // Used to add a vertical offset.
          SizedBox(
            height: 10.0
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 50.0
            ),
            child: Text(
              header,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center
            )
          ),
          ListTile(
            title: Text(
              'Manufacturing',
              style: Theme.of(context).textTheme.headline6
            ),
            onTap: () { Navigator.pop(context); }
          ),
          ListTile(
            title: Text(
              'Propulsions',
              style: Theme.of(context).textTheme.headline6
            ),
            onTap: () { Navigator.pop(context); }
          )
        ]
      )
    );
  }
}
