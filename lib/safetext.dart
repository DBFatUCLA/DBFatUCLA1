import 'package:flutter/material.dart';

class SafeText extends StatelessWidget
{
  static const String cambria = 'Cambria';
  static const double _min_font_size = 18.0;
  static const Color _default_color = Colors.black;

  final String _text;
  final String _font;
  final double _font_size;
  final FontWeight _font_weight;
  final Color _color;

  SafeText(text, {Key key, String fontFamily: SafeText.cambria,
      double fontSize: SafeText._min_font_size,
      FontWeight fontWeight: FontWeight.normal,
      Color color: SafeText._default_color})
      : _text = text,
        _font = fontFamily,
        _font_size = fontSize,
        _font_weight = fontWeight,
        _color = color,
        super(key: key)
  {
    assert(fontSize >= SafeText._min_font_size);
  }

  @override Widget
  build(BuildContext context)
  {
    return SelectableText(
      _text,
      textWidthBasis: TextWidthBasis.longestLine,
      toolbarOptions: ToolbarOptions(
        copy: true,
        paste: true
      ),
      style: TextStyle(
        fontFamily: _font,
        fontSize: _font_size,
        fontWeight: _font_weight,
        color: _color
      ),
    );
  }
}