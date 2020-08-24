import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DBFAppBar.dart';
import 'separator.dart';

class DBFAboutPage extends StatelessWidget
{
  final String _title;
  final String _route;

  DBFAboutPage({Key key, @required String title, @required String route})
    : _title = title,
      _route = route,
      super(key: key);

  static Widget
  _compose_text(String title, String description, {Color color: Colors.white})
  {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
      child: Column(
        children: <Widget> [
          SelectableText(
            title,
            style: TextStyle(
              color: color,
              fontSize: 36,
              fontFamily: 'Cambria',
              fontWeight: FontWeight.bold,
            )
          ),
          Separator(
            color: color,
            length: 18.0
          ),
          SelectableText(
            description,
            style: TextStyle(
              fontSize: 18,
              color: color,
              fontFamily: 'Cambria'
            )
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      )
    );
  }

  @override Widget
  build(BuildContext context)
  {
    return Scaffold(
      appBar: DBFAppBar(title: _title, route: _route),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
          children: <Widget> [
            _compose_text('Design Build Fly', 'About blurb goes here'),
            _compose_text('Get Involved!', 'Join the Slack at ...')
          ]
        )
      )
    );
  }
}
