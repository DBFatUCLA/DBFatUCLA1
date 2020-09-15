import 'package:dbf_v10/DBFAboutPage.dart';
import 'package:dbf_v10/DBFDrawer.dart';

import 'package:flutter/material.dart';

import 'DBFAppBar.dart';
import 'DBFHomepage.dart';
import 'DBFAboutPage.dart';
import 'DBFTeamsPage.dart';
import 'TeamsInfo.dart';
import 'Propulsions.dart';

void main() => runApp(DBFWebsite());

class DBFWebsite extends StatelessWidget
{
    static const website_title = 'DBF at UCLA';

    @override Widget
    build(BuildContext context)
    {
        return MaterialApp(
            title: DBFWebsite.website_title,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: DBFWebsiteContent()
        );
    }
}

class DBFWebsiteContent extends StatefulWidget
{
    static const List<String> page_names = ['DBF @ UCLA', 'About', 'Teams'];
    static const List<String> page_names_drawer = ['Home', 'About', 'Teams'];

    @override State<StatefulWidget>
    createState() => _DBFWebsiteContent();
}

class _DBFWebsiteContent extends State<DBFWebsiteContent>
{
    List _pages;
    Widget _content;
    int _last_content_idx;
    int _current_context_idx;

    _DBFWebsiteContent()
        : _content = DBFHomepage(),
          _last_content_idx = 0,
          _current_context_idx = 0
    {
        _pages = [
            (() => DBFHomepage()),
            (() => DBFAboutPage()),
            (() => DBFTeamsPage((idx) => _change_page(idx + 3))),
            (() => TeamsInfo(const Propulsions(), () => _change_page(2)))
        ];
    }

    void
    _change_page(int idx)
    {
        if (_current_context_idx != idx && idx < _pages.length)
        {
            setState(()
            {
                _last_content_idx = _current_context_idx;
                _current_context_idx = idx;
                _content = _pages[idx]();
            });
        }
    }
  
    Widget Function(Widget child, Animation<double> animation) get
    _transition_function
    {
        if (_last_content_idx < _current_context_idx)
        {
            return (Widget child, Animation<double> animation)
            {
                if (animation.status == AnimationStatus.dismissed)
                {
                    return SlideTransition(
                        child: child,
                        position: Tween<Offset>(
                            begin: Offset(1, 0),
                            end: Offset.zero
                        ).animate(animation)
                    );
                }
                else if (animation.status == AnimationStatus.completed)
                {
                    return SlideTransition(
                        child: child,
                        position: Tween<Offset>(
                            begin: Offset(-1, 0),
                            end: Offset.zero
                        ).animate(animation)
                    );
                }
                return SlideTransition( 
                    child: child,
                    position: Tween<Offset>(
                        begin: Offset.zero, 
                        end: Offset.zero
                    ).animate(animation)
                );
            };
        }
        else
        {
            return (Widget child, Animation<double> animation)
            {
                if (animation.status == AnimationStatus.dismissed)
                {
                    return SlideTransition(
                        child: child,
                        position: Tween<Offset>(
                            begin: Offset(-1, 0),
                            end: Offset.zero
                        ).animate(animation)
                    );
                }
                else if (animation.status == AnimationStatus.completed)
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
                        begin: Offset.zero, 
                        end: Offset.zero
                    ).animate(animation)
                );
            };
        }
    }

    @override Widget
    build(BuildContext context)
    {
        if (MediaQuery.of(context).size.width > 600)
            return _build_tablet(context);
        return _build_mobile(context);
    }

    Widget
    _build_tablet(BuildContext context)
    {
        return Scaffold(
            appBar: DBFAppBar(
                page_names: DBFWebsiteContent.page_names,
                change_page: _change_page,
                is_mobile: false,
            ),
            body: AnimatedSwitcher(
                child: _content,
                duration: const Duration(milliseconds: 750),
                switchInCurve: Curves.fastOutSlowIn,
                switchOutCurve: Curves.fastOutSlowIn.flipped,
                transitionBuilder: _transition_function
            )
        );
    }

    Widget
    _build_mobile(BuildContext context)
    {
        return Scaffold(
            appBar: DBFAppBar(
                page_names: DBFWebsiteContent.page_names,
                change_page: _change_page,
                is_mobile: true,
            ),
            body: AnimatedSwitcher(
                child: _content,
                duration: const Duration(milliseconds: 750),
                switchInCurve: Curves.fastOutSlowIn,
                switchOutCurve: Curves.fastOutSlowIn.flipped,
                transitionBuilder: _transition_function
            ),
            drawer: DBFDrawer(
                page_names: DBFWebsiteContent.page_names_drawer,
                change_page: _change_page,
            ),
        );
    }
}


