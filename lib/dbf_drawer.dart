import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color midnightBlue = Color.fromRGBO(25, 25, 112, 1);

/// Drawer that shows up if the screen is in mobile mode.
/// Takes over the functionality of the appbar in switching the pages.
/// Drawer is a ListView consisting of the Logo, and the pages of the app.
///
class DbfDrawer extends Drawer {
  final List<String> _pageNames;
  final void Function(int) _changePage;

  DbfDrawer({Key key, List<String> pageNames, Function(int) changePage})
      : _pageNames = pageNames,
        _changePage = changePage,
        super(key: key);

  @override
  Drawer build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (int idx = 0; idx < _pageNames.length; idx++) {
      String name = _pageNames[idx];
      drawerOptions.add(
        FlatButton(
          child: Text(
            name,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            _changePage(idx);
            Navigator.pop(context);
          },
        ),
      );
    }

    Widget logo = Container(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: const Image(
          image: AssetImage('./assets/images/logo.png'),
          fit: BoxFit.fill,
        ),
      ),
      padding: EdgeInsets.all(16.0),
    );

    return Drawer(
      child: Container(
        child: ListView.separated(
          padding: EdgeInsets.all(16.0),
          itemCount: drawerOptions.length + 1,
          itemBuilder: (BuildContext _, int idx) {
            if (idx > 0) return drawerOptions[idx - 1];
            return logo;
          },
          separatorBuilder: (BuildContext _, int idx) {
            if (idx > 0) {
              return Divider(
                color: Colors.white,
                thickness: 1,
              );
            }
            // Empty space divider: no divider between logo and first item.
            return SizedBox();
          },
        ),
        color: midnightBlue,
      ),
    );
  }
}
