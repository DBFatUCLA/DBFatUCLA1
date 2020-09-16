import 'package:flutter/material.dart';

const Color textColor = Colors.white;
const Color midnightBlue = Color.fromRGBO(25, 25, 112, 1.0);
const Color highlight = Color.fromRGBO(255, 255, 255, 0.25);
const Color splashColor = Color.fromRGBO(255, 255, 255, 0.5);
const String font = 'Arial';

/**
 * Appbar for the top of the website. Main purpose is to swap out the pages.
 * Will render differently for mobile and non-mobile.
 */
class DbfAppBar extends StatelessWidget implements PreferredSizeWidget
{
    @override final Size preferredSize;

    final List<String> _page_names;
    final Function(int) _change_page;
    final bool _is_mobile;

    DbfAppBar({Key key, List<String> page_names, Function(int) change_page, 
            bool is_mobile: false})
        : preferredSize = const Size(double.infinity, 75.0),
          _page_names = page_names,
          _change_page = change_page,
          _is_mobile = is_mobile,
          super(key: key);

    @override Widget
    build(BuildContext context)
    {
        if (_is_mobile)
            return _build_mobile(context);
        return _build_tablet(context);
    }

    Widget
    _compose_appbar_options(int page_idx)
    {
        return Container(
            height: preferredSize.height,
            alignment: Alignment.center,
            child: FlatButton(
                splashColor: splashColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                ),
                hoverColor: highlight,
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                            Text(
                                _page_names[page_idx],
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: font,
                                    color: textColor
                                ),
                            ),
                            Container(
                                height: 2.0,
                                width: 18.0,
                                color: textColor
                            )
                        ]
                    ),
                    padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                ),
                onPressed: () => _change_page(page_idx),
            ),
        );
    }

    Widget
    _build_tablet(BuildContext context)
    {
        List<Widget> appbar_row = [];
        if (_page_names.length > 0)
        {
            appbar_row.add(
                Container(
                    child: FlatButton(
                        textColor: textColor,
                        hoverColor: highlight,
                        splashColor: splashColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero
                        ),
                        onPressed: () => _change_page(0),
                        child: Row(
                            children: <Widget> [
                                Container(
                                    child: const Image(
                                        image: AssetImage(
                                            './assets/images/logo.png'
                                        ),
                                        fit: BoxFit.fill
                                    ),
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 8.0, 8.0, 8.0
                                    )
                                ),
                                Text(
                                    _page_names[0],
                                    style: TextStyle(
                                        fontFamily: font,
                                        fontSize: 35,
                                    ),
                                )
                            ]
                        )
                    ),
                    height: preferredSize.height
                ),
            );

            for (int idx = 1; idx < _page_names.length; idx++)
                appbar_row.add(_compose_appbar_options(idx));
        }

        return AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: midnightBlue,
            toolbarHeight: preferredSize.height,
            title: Container(
                child: Row(
                    children: appbar_row,
                ),
                height: preferredSize.height,
            ),
        );
    }

    Widget
    _build_mobile(BuildContext context)
    {
        List<Widget> appbar_row = [];
        if (_page_names.length > 0)
        {
            appbar_row.add(
                Container(
                    child: FlatButton(
                        textColor: textColor,
                        hoverColor: highlight,
                        splashColor: splashColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero
                        ),
                        onPressed: ()
                        {
                            _change_page(0);
                        },
                        child: Text(
                            _page_names[0],
                            style: TextStyle(
                                fontFamily: font,
                                fontSize: 35,
                            ),
                        )
                    ),
                    height: preferredSize.height
                ),
            );
        }

        return AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: midnightBlue,
            toolbarHeight: preferredSize.height,
            leading: IconButton(
                icon: Icon(Icons.dehaze),
                onPressed: () { Scaffold.of(context).openDrawer(); },
            ),
            title: Container(
                child: Row(
                    children: appbar_row,
                ),
                height: preferredSize.height,
            ),
        );
    }
}