import 'package:flutter/material.dart';

/// Appbar for the top of the website. Main purpose is to swap out the pages.
/// Has a mobile version.
/// 
/// Takes in a list of strings of the pages to display, and a function to
///     notify it's parent that the page has changed.
/// First item in the list of strings will the the title item, and if not on
///     mobile, will include the logo as part of the title. The title item is
///     rendered differently from the other items, mainly in font and size.
/// Other items are rendered with a underline under some portion of the name.
/// The mobile version will include a leading `dehaze` icon to open the mobile
///     drawer which takes over role of page switcher.
class DBFAppBar extends StatelessWidget implements PreferredSizeWidget
{
    static const Color _text_color = Colors.white;
    static const Color _midnight_blue = Color.fromRGBO(25, 25, 112, 1.0);
    static const Color _highlight = Color.fromRGBO(255, 255, 255, 0.25);
    static const Color _splash_color = Color.fromRGBO(255, 255, 255, 0.5);
    static const String _font = 'Montserrat';
    static const String _title_font = 'Questrial';

    @override final Size preferredSize;

    final List<String> _page_names;
    final Function(int) _change_page;
    final bool _is_mobile;

    DBFAppBar({Key key, List<String> page_names, Function(int) change_page, 
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
                splashColor: DBFAppBar._splash_color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                ),
                hoverColor: DBFAppBar._highlight,
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                            Text(
                                _page_names[page_idx],
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: DBFAppBar._font,
                                    color: _text_color
                                ),
                            ),
                            Container(
                                height: 2.0,
                                width: 18.0,
                                color: _text_color
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
                        textColor: DBFAppBar._text_color,
                        hoverColor: DBFAppBar._highlight,
                        splashColor: DBFAppBar._splash_color,
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
                                        fontFamily: DBFAppBar._title_font,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold
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
            backgroundColor: DBFAppBar._midnight_blue,
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
                        textColor: DBFAppBar._text_color,
                        hoverColor: DBFAppBar._highlight,
                        splashColor: DBFAppBar._splash_color,
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
                                fontFamily: DBFAppBar._title_font,
                                fontSize: 35,
                                fontWeight: FontWeight.bold
                            ),
                        )
                    ),
                    height: preferredSize.height
                ),
            );
        }

        return AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: DBFAppBar._midnight_blue,
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