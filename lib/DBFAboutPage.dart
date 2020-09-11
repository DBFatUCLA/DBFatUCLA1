import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'safetext.dart';
import 'ButtonWithDropdown.dart';

/// About page for the website.
/// Is a column of ButtonWithDropdown widgets.
class DBFAboutPage extends StatelessWidget
{
    const DBFAboutPage({Key key}) : super(key: key);

    static Widget
    _compose_text(String title, String description, {Color color: Colors.black,
            String fontFamily: SafeText.cambria})
    {
        TextStyle title_style = TextStyle(
            color: color,
            fontFamily: fontFamily,
            fontSize: 36, 
            fontWeight: FontWeight.bold
        );
        TextStyle description_style = TextStyle(
            color: color,
            fontFamily: fontFamily,
            fontSize: 18, 
        );
        return Container(
            padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
            child: ButtonWithDropdown(
                name: title, 
                description: description,
                name_style: title_style,
                description_style: description_style,             
            )
        );
    }

    @override Widget
    build(BuildContext context)
    {
        return Container(
            color: Colors.white,
            child: ListView(
                padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                children: <Widget> [
                    _compose_text('About Us', 'About blurb goes here...'),
                    _compose_text('Get Involved!', 'Join the Slack at ...'),
                ],
            )
        );
    }
}
