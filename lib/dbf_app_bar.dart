import 'package:flutter/material.dart';

const Color textColor = Colors.white;
const Color midnightBlue = Color.fromRGBO(25, 25, 112, 1.0);
const Color highlight = Color.fromRGBO(255, 255, 255, 0.25);
const Color splashColor = Color.fromRGBO(255, 255, 255, 0.5);
const String font = 'Arial';

/// Appbar for the top of the website. Main purpose is to swap out the pages.
/// Will render differently for mobile and non-mobile.
///
class DbfAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final int _currentPage;
  final List<String> _pageNames;
  final Function(int) _changePage;
  final bool _isMobile;

  DbfAppBar(
      {Key key,
      @required int currentPage,
      @required List<String> pageNames,
      @required Function(int) changePage,
      bool isMobile = false})
      : preferredSize = const Size(double.infinity, 75.0),
        _currentPage = currentPage,
        _pageNames = pageNames,
        _changePage = changePage,
        _isMobile = isMobile,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_isMobile) return _buildMobile(context);
    return _buildTablet(context);
  }

  Widget _composeAppbarOptions(int pageIdx) {
    return Container(
      height: preferredSize.height,
      alignment: Alignment.center,
      child: FlatButton(
        splashColor: splashColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        hoverColor: highlight,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _pageNames[pageIdx],
                style:
                    TextStyle(fontSize: 25, fontFamily: font, color: textColor),
              ),
              Container(height: 2.0, width: 18.0, color: textColor),
            ],
          ),
          padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
          decoration: (pageIdx == _currentPage)
              ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2, color: textColor),
                  ),
                )
              : null,
        ),
        onPressed: () => _changePage(pageIdx),
      ),
    );
  }

  Widget _buildTablet(BuildContext context) {
    List<Widget> appbarRow = [];
    if (_pageNames.length > 0) {
      appbarRow.add(
        Container(
          child: FlatButton(
            textColor: textColor,
            hoverColor: highlight,
            splashColor: splashColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            onPressed: () => _changePage(0),
            child: Row(
              children: <Widget>[
                Container(
                  child: const Image(
                    image: AssetImage('./assets/images/logo.png'),
                    fit: BoxFit.fill,
                  ),
                  padding: EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                ),
                Text(
                  _pageNames[0],
                  style: TextStyle(
                    fontFamily: font,
                    fontSize: 35,
                  ),
                )
              ],
            ),
          ),
          height: preferredSize.height,
        ),
      );

      for (int idx = 1; idx < _pageNames.length; idx++)
        appbarRow.add(_composeAppbarOptions(idx));
    }

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: midnightBlue,
      toolbarHeight: preferredSize.height,
      title: Container(
        child: Row(
          children: appbarRow,
        ),
        height: preferredSize.height,
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    List<Widget> appbarRow = [];
    if (_pageNames.length > 0) {
      appbarRow.add(
        Container(
          child: FlatButton(
            textColor: textColor,
            hoverColor: highlight,
            splashColor: splashColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            onPressed: () {
              _changePage(0);
            },
            child: Text(
              _pageNames[0],
              style: TextStyle(
                fontFamily: font,
                fontSize: 35,
              ),
            ),
          ),
          height: preferredSize.height,
        ),
      );
    }

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: midnightBlue,
      toolbarHeight: preferredSize.height,
      leading: IconButton(
        icon: Icon(Icons.dehaze),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      title: Container(
        child: Row(
          children: appbarRow,
        ),
        height: preferredSize.height,
      ),
    );
  }
}
