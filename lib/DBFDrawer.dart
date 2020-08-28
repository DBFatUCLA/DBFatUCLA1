import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DBFDrawer extends Drawer
{
  static Color _midnight_blue = Color.fromRGBO(25, 25, 112, 1.0);

  final List<String> _page_names;
  final void Function(int) _change_page;

  DBFDrawer({Key key, List<String> page_names, void Function(int) change_page})
    : _page_names = page_names,
      _change_page = change_page,
      super(key: key);

  @override Drawer
  build(BuildContext context)
  {
    List<Widget> drawer_options = [];
    for (int idx = 0; idx < _page_names.length; idx++)
    {
      String name = _page_names[idx];
      drawer_options.add(FlatButton(
        child: Text(
          name,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        onPressed: ()
        {
          _change_page(idx);
          Navigator.pop(context);
        },
      ));
    }

    return Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  color: Colors.yellow,
                  child: Text('Imagine a logo here...')
                )
              ),
              padding: EdgeInsets.all(16.0)
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(16.0),
                itemCount: drawer_options.length,
                itemBuilder: (BuildContext context, int idx) => drawer_options[idx],
                separatorBuilder: (BuildContext context, int idx) => Divider(
                  color: Colors.white,
                  thickness: 1,
                )
              ),
            )
          ]
        ),
        color: DBFDrawer._midnight_blue
      )
    );
  }
}