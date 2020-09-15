import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Drawer that shows up if the screen is in mobile mode.
/// Takes over the functionality of the appbar in switching the pages.
/// Drawer is a column consisting of the Logo, and the pages of the app.
class DBFDrawer extends Drawer
{
    static Color _midnight_blue = Color.fromRGBO(25, 25, 112, 1.0);

    final List<String> _page_names;
    final void Function(int) _change_page;

    DBFDrawer({Key key, List<String> page_names, Function(int) change_page})
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

        Widget logo = Container(
            child: AspectRatio(
                aspectRatio: 1.0,
                child: const Image(
                    image: AssetImage('./assets/images/logo.png'),
                    fit: BoxFit.fill
                )
            ),
            padding: EdgeInsets.all(16.0)
        );
        
        return Drawer(
            child: Container(
                child: ListView.separated(
                    padding: EdgeInsets.all(16.0),
                    itemCount: drawer_options.length + 1,
                    itemBuilder: (BuildContext _, int idx) 
                    {
                        if (idx > 0)
                            return drawer_options[idx - 1];
                        return logo;
                    },
                    separatorBuilder: (BuildContext _, int idx) 
                    {
                        if (idx > 0)
                        {
                            return Divider(
                                color: Colors.white,
                                thickness: 1,
                            );
                        }
                        // Empty space divider: no divider between logo and
                        // first item.
                        return SizedBox();
                    }
                ),
                color: DBFDrawer._midnight_blue
            )
        );
    }
}