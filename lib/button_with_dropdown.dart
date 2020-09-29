import 'package:flutter/material.dart';

import 'separator.dart';

/// Class that exists in 2 states.
/// 1. Button with a expand icon and the title
/// 2. Button with a contract icon and title, underneath is a blurb containing
///    the description of the title.
/// Click the button to swap between states.
///
class ButtonWithDropdown extends StatefulWidget {
  final String name;
  final String description;
  final TextStyle nameStyle;
  final TextStyle descriptionStyle;

  ButtonWithDropdown(
      {@required this.name,
      @required this.description,
      this.nameStyle,
      this.descriptionStyle,
      Key key})
      : super(key: key);

  @override
  _ButtonWithDropdown createState() => _ButtonWithDropdown();
}

class _ButtonWithDropdown extends State<ButtonWithDropdown> {
  bool _retracted;

  _ButtonWithDropdown({bool retracted = true}) : _retracted = retracted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlatButton(
          child: Row(children: <Widget>[
            if (_retracted) Icon(Icons.expand_more),
            if (!_retracted) Icon(Icons.expand_less),
            Text(widget.name, style: widget.nameStyle),
          ]),
          onPressed: () => setState(() {
            _retracted = !_retracted;
          }),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(35.0, 0, 0, 0),
          child: Separator(
            color: widget.nameStyle.color,
            length: 48.0,
          ),
        ),
        if (!_retracted)
          Container(
            padding: EdgeInsets.fromLTRB(35.0, 0, 35.0, 0),
            child: SelectableText(
              widget.description,
              style: widget.descriptionStyle,
            ),
          ),
      ],
    );
  }
}
