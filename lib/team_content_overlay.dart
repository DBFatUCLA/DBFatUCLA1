import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'team_content.dart';
import 'team_content_page.dart';

const Color midnightBlue = Color.fromRGBO(25, 25, 112, 1.0);

/// Overlays the Team's content page with a back button that returns to the
/// Teams Overview Page.
///
class TeamContentOverlay extends StatelessWidget {
  final TeamContent _content;
  final void Function() _retToParent;

  TeamContentOverlay(TeamContent content, void Function() returnToParent)
      : _content = content,
        _retToParent = returnToParent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            child: TeamContentPage(_content),
          ),
        ),
        Container(
          color: midnightBlue.withOpacity(0.9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                color: Colors.transparent,
                onPressed: _retToParent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    Text(
                      'Teams',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: Text(
                  _content.teamName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
