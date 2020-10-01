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

/// About page that consists of ButtonWithDropdowns.
///
class DbfAboutPage extends StatelessWidget {
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
            padding: EdgeInsets.all(8.0),
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
              Container(height: 16),
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
          _composeText('About Us', aboutInfo),
          _composeText('Upcoming Events',
              'Come to our kickoff meeting on October 7th at 6pm!'),
          _composeText('Get Involved!', getInvolvedInfo, [
            HyperLink('Interest Form', 'https://forms.gle/uuLZALgquZ5SLvZW9'),
            HyperLink('AIAA', 'http://aiaa.seas.ucla.edu'),
          ]),
        ],
      ),
    );
  }
}

const String aboutInfo =
    """Design Build Fly (DBF) at UCLA is an engineering club dedicated to researching, designing, manufacturing, and flying remote-controlled airplanes. Each year, club members bring together their collective knowledge and abilities to construct a plane to fit specifications outlined by the American Institute of Aeronautics and Astronautics (AIAA) for the Design Build Fly competition each spring. In addition to promoting real-world application of engineering knowledge, DBF at UCLA hosts career planning, social, and academic development events throughout the year in an effort to help students navigate the college experience and prepare for the world beyond.

Through the annual design process and other projects, DBF members learn new skills and apply them towards real-world problem-solving. Students can pursue their interests in a variety fields, including aerodynamics, electronics, computer-aided design, and manufacturing. Each competition brings new missions and new design parameters, introducing new engineering challenges to consider throughout the design process. In addition to preparation for the annual trip to Tucson or Wichita, DBF at UCLA provides academic guidance, social events, and opportunities to participate in outreach.""";

const String getInvolvedInfo =
    """Meanwhile, fill out our interest form to receive updates!
    
Design Build Fly exists under UCLA's American Institute of Aeronautics and Astronautics (AIAA) branch. If you would like to get involved with our parent organization or find out about other clubs under AIAA, a link to their website can be found below.""";
