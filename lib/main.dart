import 'package:dbf_v10/DBFAboutPage.dart';
import 'package:flutter/material.dart';

import 'DBFHomepage.dart';
import 'DBFAboutPage.dart';
import 'DBFTeamsPage.dart';

void main() => runApp(DBFWebsite());

class DBFWebsite extends StatefulWidget
{
  static const website_title = 'DBF at UCLA';
  static Color _text_color = Colors.white;
  static Color _midnight_blue = Color.fromRGBO(25, 25, 112, 1.0);
  static Color _highlight = Color.fromRGBO(255, 255, 255, 0.25);
  static Color _splash_color = Color.fromRGBO(255, 255, 255, 0.5);
  static String _font = 'Montserrat';

  @override State<StatefulWidget>
  createState() => _DBFWebsite();
}

class _DBFWebsite extends State<DBFWebsite>
{
  Widget _content;
  final double _height;

  String _route;

  _DBFWebsite()
    : _content = DBFHomepage(),
      _route = 'home',
      _height = Size.fromHeight(kToolbarHeight).height;


  Widget
  _compose_appbar_options(BuildContext context, String option, String route)
  {
    void Function() set_state;
    if (route == '/about')
    {
      set_state = ()
      {
        setState(()
        {
          _route = route;
          _content = DBFAboutPage();
        });
      };
    }
    else if (route == '/teams')
    {
      set_state = ()
      {
        setState(()
        {
          _route = route;
          _content = DBFTeamsPage();
        });
      };
    }
    else
    {
      set_state = ()
      {
        setState(()
        {
          _route = '/home';
          _content = DBFHomepage();
        });
      };
    }

    return Container(
      height: _height,
      alignment: Alignment.center,
      child: FlatButton(
        splashColor: DBFWebsite._splash_color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
        ),
        hoverColor: DBFWebsite._highlight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              option,
              style: TextStyle(
                fontSize: 20,
                fontFamily: DBFWebsite._font,
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
          if (_route != route) set_state();
        }
      ),
    );
  }

  @override
  Widget
  build(BuildContext context)
  {
    return MaterialApp(
      title: DBFWebsite.website_title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: DBFWebsite._midnight_blue,
            title: Container(
              child: Row(
                children: <Widget> [
                  Container(
                    child: FlatButton(
                      textColor: DBFWebsite._text_color,
                      hoverColor: DBFWebsite._highlight,
                      splashColor: DBFWebsite._splash_color,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero
                      ),
                      onPressed: ()
                      {
                        if (_route != '/home')
                        {
                          setState(()
                          {
                            _route = '/home';
                            _content = DBFHomepage();
                          });
                        }
                      },
                        child: Text(
                          DBFWebsite.website_title,
                          style: TextStyle(
                            fontFamily: DBFWebsite._font,
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
          ),
          body: AnimatedSwitcher(
            child: _content,
            duration: const Duration(milliseconds: 1000),
            switchInCurve: Curves.fastOutSlowIn,
            switchOutCurve: Curves.fastOutSlowIn.flipped,
            transitionBuilder: (Widget child, Animation<double> animation)
            {
              if (animation.status != AnimationStatus.dismissed)
              {
                return SlideTransition(
                  child: child,
                  position: Tween<Offset>(
                    begin: Offset(1, 0),
                    end: Offset.zero
                  ).animate(animation)
                );
              }
              return SlideTransition(
                child: child,
                position: Tween<Offset>(
                  begin: Offset(-1, 0),
                  end: Offset.zero
                ).animate(animation)
              );
            }
          )
        ),
      }
    );
  }
}


