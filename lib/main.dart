import 'package:dbf_v10/dbf_about_page.dart';
import 'package:dbf_v10/dbf_drawer.dart';

import 'package:flutter/material.dart';

import 'dbf_app_bar.dart';
import 'dbf_homepage.dart';
import 'dbf_about_page.dart';
import 'dbf_all_teams_page.dart';
import 'team_content_overlay.dart';
import 'propulsions_content.dart';
import 'manufacturing_content.dart';
import 'CAD_content.dart';
import 'aerodynamics_content.dart';
import 'structures_content.dart';



void main() => runApp(DBFWebsite());

class DBFWebsite extends StatelessWidget {
  static const website_title = 'DBF at UCLA';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: DBFWebsite.website_title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DBFWebsiteContent(),
    );
  }
}

class DBFWebsiteContent extends StatefulWidget {
  static const List<String> page_names = ['DBF @ UCLA', 'About', 'Teams'];
  static const List<String> page_names_drawer = ['Home', 'About', 'Teams'];

  @override
  State<StatefulWidget> createState() => _DBFWebsiteContent();
}

class _DBFWebsiteContent extends State<DBFWebsiteContent> {
  List _pages;
  Widget _content;
  int _lastContentIdx;
  int _currentContentIdx;

  _DBFWebsiteContent()
      : _content = DbfHomepage(),
        _lastContentIdx = 0,
        _currentContentIdx = 0 {
    _pages = [
      (() => DbfHomepage()),
      (() => DbfAboutPage()),
      (() => DbfAllTeamsPage((idx) => _changePage(idx + 3))),
      (() => TeamContentOverlay(PropulsionsContent(), () => _changePage(2))),
      (() => TeamContentOverlay(ManufacturingContent(), () => _changePage(2))),
      (() => TeamContentOverlay(CADContent(), () => _changePage(2))),
      (() => TeamContentOverlay(AerodynamicsContent(), () => _changePage(2))),
      (() => TeamContentOverlay(StructuresContent(), () => _changePage(2))),
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var img in rotatingImages) precacheImage(img, context);
    precacheImage(AssetImage('$path/teamsbackground.jpg'), context);
  }

  void _changePage(int idx) {
    if (_currentContentIdx != idx && idx < _pages.length) {
      setState(() {
        _lastContentIdx = _currentContentIdx;
        _currentContentIdx = idx;
        _content = _pages[idx]();
      });
    }
  }

  Widget Function(Widget child, Animation<double> animation)
      get _transitionFunction {
    if (_lastContentIdx < _currentContentIdx) {
      return (Widget child, Animation<double> animation) {
        if (animation.status == AnimationStatus.dismissed) {
          return SlideTransition(
            child: child,
            position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
                .animate(animation),
          );
        } else if (animation.status == AnimationStatus.completed) {
          return SlideTransition(
            child: child,
            position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
                .animate(animation),
          );
        }
        return SlideTransition(
          child: child,
          position: Tween<Offset>(begin: Offset.zero, end: Offset.zero)
              .animate(animation),
        );
      };
    } else {
      return (Widget child, Animation<double> animation) {
        if (animation.status == AnimationStatus.dismissed) {
          return SlideTransition(
            child: child,
            position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
                .animate(animation),
          );
        } else if (animation.status == AnimationStatus.completed) {
          return SlideTransition(
            child: child,
            position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
                .animate(animation),
          );
        }
        return SlideTransition(
          child: child,
          position: Tween<Offset>(begin: Offset.zero, end: Offset.zero)
              .animate(animation),
        );
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 600) return _buildTablet(context);
    return _buildMobile(context);
  }

  Widget _buildTablet(BuildContext context) {
    return Scaffold(
      appBar: DbfAppBar(
        currentPage: _currentContentIdx,
        pageNames: DBFWebsiteContent.page_names,
        changePage: _changePage,
        isMobile: false,
      ),
      body: AnimatedSwitcher(
        child: _content,
        duration: const Duration(milliseconds: 750),
        switchInCurve: Curves.fastOutSlowIn,
        switchOutCurve: Curves.fastOutSlowIn.flipped,
        transitionBuilder: _transitionFunction,
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Scaffold(
      appBar: DbfAppBar(
        currentPage: _currentContentIdx,
        pageNames: DBFWebsiteContent.page_names,
        changePage: _changePage,
        isMobile: true,
      ),
      body: AnimatedSwitcher(
        child: _content,
        duration: const Duration(milliseconds: 750),
        switchInCurve: Curves.fastOutSlowIn,
        switchOutCurve: Curves.fastOutSlowIn.flipped,
        transitionBuilder: _transitionFunction,
      ),
      drawer: DbfDrawer(
        pageNames: DBFWebsiteContent.page_names_drawer,
        changePage: _changePage,
      ),
    );
  }
}
