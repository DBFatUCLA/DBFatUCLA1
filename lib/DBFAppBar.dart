import 'package:flutter/material.dart';

class DBFAppBar extends StatefulWidget implements PreferredSizeWidget
{
  final String _title;
  static Color text_color = Colors.white;
  static Color midnight_blue = Color.fromRGBO(25, 25, 112, 1.0);
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
  createState() => _DBFAppBarState();
}

class _DBFAppBarState extends State<DBFAppBar>
{
  Widget
  _compose_appbar_options(BuildContext context, String option, String route)
  {
    return UnconstrainedBox(
      child: FlatButton(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Text(
              option,
              style: TextStyle(
                fontSize: 20,
                fontFamily: DBFAppBar._font,
                color: Colors.white
              ),
            ),
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
      backgroundColor: DBFAppBar.midnight_blue,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          FlatButton(
            textColor: DBFAppBar.text_color,
            hoverColor: Colors.transparent,
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
          _compose_appbar_options(context, 'About', '/about'),
          _compose_appbar_options(context, 'Teams', '/teams'),
        ]
      ),
    );
  }
}
