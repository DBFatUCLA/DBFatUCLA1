import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'safetext.dart';
import 'button_with_dropdown.dart';

/**
 * About page that consists of ButtonWithDropdowns.
 */
class DbfAboutPage extends StatelessWidget
{
    const DbfAboutPage({Key key}) : super(key: key);

    static Widget
    _compose_text(String title, String description, {Color color=Colors.black,
            String fontFamily=SafeText.serif})
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
                    _compose_text('About Us', 'Design Build Fly (DBF) at UCLA is an engineering club dedicated to researching, designing, manufacturing, and flying remote-controlled airplanes. Each year, club members bring together their collective knowledge and abilities to construct a plane to fit specifications outlined by the American Institute of Aeronautics and Astronautics (AIAA) for the Design Build Fly competition each spring. In addition to promoting real-world application of engineering knowledge, DBF at UCLA hosts career planning, social, and academic development events throughout the year in an effort to help students navigate the college experience and prepare for the world beyond.'),
                    _compose_text('Get Involved!', 'Join the Slack at ...'),
                ],
            )
        );
    }
}
