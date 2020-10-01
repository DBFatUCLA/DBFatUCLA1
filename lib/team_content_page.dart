import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'team_content.dart';
import 'image_placeholder.dart';
import 'safetext.dart';
import 'separator.dart';

const Color DbfLogoBackgroundBlue = Color.fromRGBO(196, 229, 252, 1.0);
const double largePadding = 32;
const double smallPadding = 12;
const double separatorLength = 48;
const String path = './assets/images';

/// Actual Widget that displays the content & images of a Team's info page.
/// Content and tiling are controled by the TeamContent object.
///
class TeamContentPage extends StatelessWidget {
  final Color _altBackground;
  final TeamContent _content;

  const TeamContentPage(TeamContent content,
      {Color altBackground = DbfLogoBackgroundBlue})
      : _altBackground = altBackground,
        _content = content;

  @override
  Widget build(BuildContext context) {
    final bool buildTablet = MediaQuery.of(context).size.width > 600;
    final Widget Function(BuildContext context, int idx) func = (_, idx) {
      Content c = _content.content[idx];
      Format f = _content.format[idx];
      SafeText title = SafeText(
        c.title,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.left,
      );
      SafeText description = SafeText(
        c.description,
        textAlign: TextAlign.left,
      );

      if (c.image == null) {
        return _composeNoImage(title, description, f.useAltColor);
      }

      Widget image = ImagePlaceholder(
        AssetImage('$path/${c.image}'),
        CircularProgressIndicator(),
        fit: BoxFit.fill,
      );
      if (buildTablet) {
        return _composeTwoColumns(title, description, image, f.leftFlex,
            f.rightFlex, f.textOnLeft, f.useAltColor);
      }
      return _composeColumn(title, description, image, f.useAltColor);
    };

    return SafeArea(
      child: CupertinoScrollbar(
        child: ListView.separated(
          itemCount: _content.content.length,
          itemBuilder: func,
          separatorBuilder: (_, __) => Divider(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            height: 0,
            thickness: 1,
          ),
        ),
      ),
    );
  }

  Widget _composeNoImage(
      Widget title, Widget description, bool useAltBackground) {
    return Container(
      color: useAltBackground ? _altBackground : Colors.transparent,
      margin: EdgeInsets.symmetric(
        horizontal: largePadding,
        vertical: smallPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          Separator(
            color: Colors.black,
            length: separatorLength,
          ),
          description,
        ],
      ),
    );
  }

  Widget _composeTwoColumns(Widget title, Widget description, Widget image,
      int flexLeft, int flexRight, bool textOnLeft, bool useAltBackground) {
    Widget text = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title,
        Separator(
          color: Colors.black,
          length: separatorLength,
        ),
        description,
      ],
    );

    return Container(
      color: useAltBackground ? _altBackground : Colors.transparent,
      child: Container(
        child: Row(
          children: [
            Expanded(flex: flexLeft, child: textOnLeft ? text : image),
            Container(
              width: largePadding,
            ),
            Expanded(
              flex: flexRight,
              child: textOnLeft ? image : text,
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(
          horizontal: largePadding,
          vertical: smallPadding,
        ),
      ),
    );
  }

  Widget _composeColumn(
      Widget title, Widget description, Widget image, bool useAltBackground) {
    return Container(
      color: useAltBackground ? _altBackground : Colors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: largePadding,
        vertical: smallPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                Separator(
                  color: Colors.black,
                  length: separatorLength,
                ),
                description,
              ],
            ),
          ),
          Container(
            height: smallPadding,
          ),
          image
        ],
      ),
    );
  }
}
