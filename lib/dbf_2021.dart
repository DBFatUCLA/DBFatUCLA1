import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'safetext.dart';
import 'button_with_dropdown.dart';

class HyperLink {
  final String text;
  final String link;

  HyperLink(this.text, this.link);
}

/// 2021 page that consists of ButtonWithDropdowns.
///
class Dbf2021 extends StatelessWidget {
  static const titleStyle = TextStyle(
    color: Colors.black,
    fontFamily: SafeText.serif,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const _descriptionStyle = TextStyle(
    color: Colors.black,
    fontFamily: SafeText.serif,
    fontSize: 18,
  );

  Widget _composeText(String title, String description,
      [List<HyperLink> links]) {
    if (links == null) {
      return Container(
        padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
        child: ButtonWithDropdown(
          name: Text(title, style: titleStyle),
          description: SelectableText(
            description,
            style: _descriptionStyle,
          ),
        ),
      );
    }
    List<Widget> hyperlinks = [];
    for (var link in links) {
      hyperlinks.add(
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: Colors.blue),
          ),
          color: Colors.white,
          onPressed: () async {
            if (await canLaunch(link.link)) launch(link.link);
          },
          child: Container(
            padding: EdgeInsets.all(4.0),
            child: Text(
              link.text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
                fontFamily: 'Arial',
              ),
            ),
          ),
        ),
      );
    }
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
      child: ButtonWithDropdown(
          name: Text(title, style: titleStyle),
          description: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                description,
                style: _descriptionStyle,
              ),
              Container(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: hyperlinks,
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
        children: <Widget>[
          _composeText('2020-21 Plane: Patchwork', PatchworkInfo),
          _composeText('Competition 2021', compInfo),
        ],
      ),
    );
  }
}

const String PatchworkInfo =
    """Our 2020-21 plane was given the name Patchwork due to the piece-by-piece manner in which the plane was built. The team only built one plane, as manufacturing was limited due to Covid-19 restrictions.""";

const String compInfo =

    """The 2021 DBF compettion was held virtually, with each school submitting videos of their plane. 

    Mission 1: Proof of Concept--Complete 3 laps in under 5 minutes. 

    Mission 2: Sensor as Paylod--Complete 3 laps in under 5 minutes while fully loaded."""

    """The 2021 DBF compettion was held virtually, with each school submitting videos of their plane.

    Mission 1: Proof of Concept--Complete 3 laps in under 5 minutes.

    Mission 2: Sensor as Paylod--Complete 3 laps in under 5 minutes in fully loaded configuration.


    Mission 3: Sensor Deployment--Deploy and tow sensor while completing as many laps as possible in 10 minutes. """;
