import 'package:flutter/material.dart';

/// Selectable text that meets standards for reading.
class SafeText extends SelectableText
{
    static const String serif = 'Cambria';
    static const List<String> font_family_fallback = [
        'Caladea', 
        'Georgia',
        'Arial'
    ];
    static const double _min_font_size = 18.0;
    static const Color _default_color = Colors.black;

    SafeText(text, {Key key, TextAlign textAlign=TextAlign.center,
            String fontFamily=SafeText.serif,
            double fontSize=SafeText._min_font_size,
            FontWeight fontWeight=FontWeight.normal,
            Color color=SafeText._default_color,
            List<String> fontFamilyFallback=SafeText.font_family_fallback})
        : super(text, 
            key: key, 
            textAlign: textAlign, 
            style: TextStyle(
                fontFamily: fontFamily,
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: color,
                fontFamilyFallback: fontFamilyFallback
            ))
    {
        assert(fontSize >= SafeText._min_font_size);
    }
}