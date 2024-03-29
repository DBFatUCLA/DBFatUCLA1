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

/// 2022 page that consists of ButtonWithDropdowns.
///
class Dbf2022 extends StatelessWidget {
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
          _composeText('2021-22 Plane', PatchworkInfo),
          _composeText('AIAA DBF Competition 2022', compInfo),
        ],
      ),
    );
  }
}

const String PatchworkInfo =
    """Our 2021-2022 plane is currently in the initial design phase.

    Join to learn more about our plans for designing and testing the plane and mechanisms. """;

const String compInfo =

    """The 2022 Design Build Fly competition is set to be held in Wichita, Kansas from April 21-24. 

    Mission 1: Deployment Flight--Complete 3 laps in under 5 minutes. 

    Mission 2: Staging Flight--Complete 3 laps in under 5 minutes while carrying vaccine syringes.

    Mission 3: Vaccine Delivery Flight--Carry and deploy 1 or more vaccine vial packages, dropping one on the runway after each lap without triggering any of the three 5g sensors attatched to the vaccine vial package.""";
