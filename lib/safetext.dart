import 'package:flutter/material.dart';

/// Selectable text that meets standards for reading.
class SafeText extends StatelessWidget
{
    static const String cambria = 'Cambria';
    static const double _min_font_size = 18.0;
    static const Color _default_color = Colors.black;

    final String _text;
    final TextAlign _text_align;
    final String _font;
    final double _font_size;
    final FontWeight _font_weight;
    final Color _color;

    SafeText(text, {Key key, TextAlign textAlign: TextAlign.center,
            String fontFamily: SafeText.cambria,
            double fontSize: SafeText._min_font_size,
            FontWeight fontWeight: FontWeight.normal,
            Color color: SafeText._default_color})
        : _text = text,
          _text_align = textAlign,
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
            textAlign: _text_align,
            style: TextStyle(
                fontFamily: _font,
                fontSize: _font_size,
                fontWeight: _font_weight,
                color: _color
            ),
        );
    }
}