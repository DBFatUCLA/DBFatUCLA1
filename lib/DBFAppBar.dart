import 'package:flutter/material.dart';

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
        color: Colors.white,
        onPressed: () {},
      ),
      title: FlatButton(
        textColor: widget.text_color,
        hoverColor: Colors.transparent,
        onPressed: ()
        {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        },
        child: Text(widget.appbar_title)
      ),
      actions: <Widget> [
        FlatButton(
          textColor: widget.text_color,
          onPressed: ()
          {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: Text('About')
        ),
        FlatButton(
          textColor: widget.text_color,
          onPressed: ()
          {
            Navigator.popUntil(context, ModalRoute.withName('/'));
            Navigator.of(context).pushNamed('/teams');
          },
            child: Text('Teams')
        ),
        FlatButton(
          textColor: widget.text_color,
          onPressed: ()
          {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: Text('Leads')
        )
      ]
    );
  }
}
