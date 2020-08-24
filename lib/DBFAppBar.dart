import 'package:flutter/material.dart';

class DBFAppBar extends StatefulWidget implements PreferredSizeWidget
{
  final String _title;
  static Color _text_color = Colors.white;
  static Color _midnight_blue = Color.fromRGBO(25, 25, 112, 1.0);
  static Color _splash_color = Color.fromRGBO(255, 255, 255, 0.25);
  static String _font = 'Montserrat';
  final String _route;

  @override
  final Size preferredSize;

  DBFAppBar({Key key, @required String title, @required String route})
      : _title = title,
        _route = route,
        preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override _DBFAppBarState
  createState() => _DBFAppBarState(preferredSize.height);
}

class _DBFAppBarState extends State<DBFAppBar>
{
  double _height;
  _DBFAppBarState(double height) : _height = height;

  Widget
  _compose_appbar_options(BuildContext context, String option, String route)
  {
    return Container(
      height: _height,
      alignment: Alignment.center,
      child: FlatButton(
        splashColor: DBFAppBar._splash_color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              option,
              style: TextStyle(
                fontSize: 20,
                fontFamily: DBFAppBar._font,
                color: Colors.white
              ),
            ),
            Container(
              height: 2.0,
              width: 15.0,
              color: Colors.white
            )
          ]
        ),
        onPressed: ()
        {
          if (widget._route != route)
          {
            Navigator.popUntil(context, ModalRoute.withName('/'));
            Navigator.of(context).pushNamed(route);
          }
        },
      ),
    );
  }

  @override AppBar
  build(BuildContext context)
  {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: DBFAppBar._midnight_blue,
      title: Container(
        child: Row(
          children: <Widget> [
            Container(
              child: FlatButton(
                textColor: DBFAppBar._text_color,
                hoverColor: Colors.transparent,
                splashColor: DBFAppBar._splash_color,
                onPressed: ()
                {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Text(
                  widget._title,
                  style: TextStyle(
                    fontFamily: DBFAppBar._font,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
              height: _height
            ),
            _compose_appbar_options(context, 'About', '/about'),
            _compose_appbar_options(context, 'Teams', '/teams'),
          ]
        ),
        height: _height,
      ),
    );
  }
}
