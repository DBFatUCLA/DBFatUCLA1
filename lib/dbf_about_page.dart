import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'safetext.dart';
import 'button_with_dropdown.dart';

class HyperLink {
  final String _text;
  final String _link;

  HyperLink(this._text, [this._link]);

  String get text => _text;
  bool get isHyperLink => _link != null;
  Future<void> get openHyperLink async {
    if (await canLaunch(_link)) await launch(_link);
  }
}

/// About page that consists of ButtonWithDropdowns.
///
class DbfAboutPage extends StatefulWidget {
  DbfAboutPage({Key key}) : super(key: key);

  @override
  _DbfAboutPageState createState() => _DbfAboutPageState();
}

class _DbfAboutPageState extends State<DbfAboutPage> {
  static const titleStyle = TextStyle(
    color: Colors.black,
    fontFamily: SafeText.serif,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static TextStyle _descriptionStyle(bool link) {
    return TextStyle(
      color: link ? Colors.blue : Colors.black,
      fontFamily: SafeText.serif,
      fontSize: 18,
    );
  }

  List<TapGestureRecognizer> _disposables;

  _DbfAboutPageState() : _disposables = [];

  Widget _composeText(String title, List<HyperLink> description) {
    List<TextSpan> combinedDescription = [];
    for (HyperLink e in description) {
      var linkOpener;
      if (e.isHyperLink) {
        linkOpener = TapGestureRecognizer()
          ..onTap = () async {
            await e.openHyperLink;
          };
        _disposables.add(linkOpener);
      }
      combinedDescription.add(TextSpan(
        text: e._text,
        style: _descriptionStyle(e.isHyperLink),
        recognizer: linkOpener,
      ));
    }
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
      child: ButtonWithDropdown(
        name: Text(title, style: titleStyle),
        description: SelectableText.rich(
          TextSpan(children: combinedDescription),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var d in _disposables) d.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
        children: <Widget>[
          _composeText('About Us', [HyperLink(aboutInfo)]),
          _composeText('Upcoming Events', [
            HyperLink('Come to our kickoff meeting on October 7th at 6pm!'),
          ]),
          _composeText('Get Involved!', [
            HyperLink('Meanwhile, fill out our '),
            HyperLink('interest form', 'https://forms.gle/uuLZALgquZ5SLvZW9'),
            HyperLink(' to receive updates!')
          ])
        ],
      ),
    );
  }
}

const String aboutInfo =
    """Design Build Fly (DBF) at UCLA is an engineering club dedicated to researching, designing, manufacturing, and flying remote-controlled airplanes. Each year, club members bring together their collective knowledge and abilities to construct a plane to fit specifications outlined by the American Institute of Aeronautics and Astronautics (AIAA) for the Design Build Fly competition each spring. In addition to promoting real-world application of engineering knowledge, DBF at UCLA hosts career planning, social, and academic development events throughout the year in an effort to help students navigate the college experience and prepare for the world beyond.

Through the annual design process and other projects, DBF members learn new skills and apply them towards real-world problem-solving. Students can pursue their interests in a variety fields, including aerodynamics, electronics, computer-aided design, and manufacturing. Each competition brings new missions and new design parameters, introducing new engineering challenges to consider throughout the design process. In addition to preparation for the annual trip to Tucson or Wichita, DBF at UCLA provides academic guidance, social events, and opportunities to participate in outreach.""";
