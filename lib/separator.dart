import 'package:flutter/material.dart';

class Separator extends StatelessWidget
{
    final Color _color;
    final double _length;

    Separator({Key key, @required Color color, double length: double.infinity})
        : _color = color,
            _length = length,
            super(key: key);

    @override Widget
    build(BuildContext context)
    {
        return Container(
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: _length,
            color: _color
        );
    }
}