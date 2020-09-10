/** 
 * Widget that exists in 2 states. 
 * 1. Just a button with the name
 * 2. A button, under which is a blurb with name and description.
 * 
 * Pressing the button switches the state.
 */

import 'package:flutter/material.dart';

import 'Separator.dart';

class ButtonWithDropdown extends StatefulWidget
{
    final String name;
    final String description;
    final TextStyle name_style;
    final TextStyle description_style;

    ButtonWithDropdown({@required this.name, @required this.description,
            this.name_style, this.description_style, Key key})
        : super(key: key);

    @override _ButtonWithDropdown
    createState() => _ButtonWithDropdown();
}

class _ButtonWithDropdown extends State<ButtonWithDropdown>
{
    bool _retracted;

    _ButtonWithDropdown({bool retracted=true}) : _retracted = retracted;

    @override Widget 
    build(BuildContext context)
    {
        FlatButton button;
        if (_retracted)
        {
            button = FlatButton(
                child: Row(
                    children: [
                        Icon(Icons.expand_more),
                        Text(widget.name, style: widget.name_style),
                    ]
                ),
                onPressed: () => setState(() { _retracted = false; })
            );
        }
        else
        {
            button = FlatButton(
                child: Row(
                    children: [
                        Icon(Icons.expand_less),
                        Text(widget.name, style: widget.name_style),
                    ]
                ),
                onPressed: () => setState(() { _retracted = true; })
            );
        }

        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                button, 
                Container(
                    padding: EdgeInsets.fromLTRB(35.0, 0, 0, 0),
                    child: Separator(
                        color: widget.name_style.color,
                        length: 48.0,
                    )
                ),
                if (!_retracted) Container(
                    padding: EdgeInsets.fromLTRB(35.0, 0, 0, 0),
                    child: SelectableText(
                        widget.description, 
                        style: widget.description_style,
                    )
                )
            ],
        );
    }
}