import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'safetext.dart';
import 'button_with_dropdown.dart';

/// About page that consists of ButtonWithDropdowns.
///
class DbfAboutPage extends StatelessWidget {
  const DbfAboutPage({Key key}) : super(key: key);

  static Widget _composeText(String title, String description,
      {Color color = Colors.black, String fontFamily = SafeText.serif}) {
    TextStyle titleStyle = TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: 36,
        fontWeight: FontWeight.bold);
    TextStyle descriptionStyle = TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontSize: 18,
    );
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
      child: ButtonWithDropdown(
        name: title,
        description: description,
        nameStyle: titleStyle,
        descriptionStyle: descriptionStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
        children: <Widget>[
          _composeText('About Us', aboutInfo),
          _composeText('Upcoming Events','Come to our kickoff meeting on October 7th at 6pm!'),
          _composeText('Get Involved!', 'Meanwhile, fill out our interest form to receive updates: https://forms.gle/uuLZALgquZ5SLvZW9.'),
        ],
      ),
    );
  }
}

const String aboutInfo =
    """Design Build Fly (DBF) at UCLA is an engineering club dedicated to researching, designing, manufacturing, and flying remote-controlled airplanes. Each year, club members bring together their collective knowledge and abilities to construct a plane to fit specifications outlined by the American Institute of Aeronautics and Astronautics (AIAA) for the Design Build Fly competition each spring. In addition to promoting real-world application of engineering knowledge, DBF at UCLA hosts career planning, social, and academic development events throughout the year in an effort to help students navigate the college experience and prepare for the world beyond.

Through the annual design process and other projects, DBF members learn new skills and apply them towards real-world problem-solving. Students can pursue their interests in a variety fields, including aerodynamics, electronics, computer-aided design, and manufacturing. Each competition brings new missions and new design parameters, introducing new engineering challenges to consider throughout the design process. In addition to preparation for the annual trip to Tucson or Wichita, DBF at UCLA provides academic guidance, social events, and opportunities to participate in outreach.""";
