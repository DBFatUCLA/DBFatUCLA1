import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'separator.dart';
import 'safetext.dart';

class DBFAboutPage extends StatelessWidget
{
  const DBFAboutPage({Key key}) : super(key: key);

  static Widget
  _compose_text(String title, String description, {Color color: Colors.black,
      String fontFamily: SafeText.cambria})
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
            length: 48.0
          ),
          SafeText(
            description,
            fontFamily: fontFamily,
            textAlign: TextAlign.start
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      )
    );
  }

  @override Widget
  build(BuildContext context)
  {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
        children: <Widget> [
          _compose_text('Design Build Fly', 'About blurb goes here...'),
          _compose_text('Get Involved!', 'Join the Slack at ...'),
        ]
      )
    );
  }
}
