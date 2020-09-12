import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color MIDNIGHT_BLUE = Color.fromRGBO(25, 25, 112, 1.0);

class TeamsInfo extends StatelessWidget
{
    final Widget _content;
    final void Function() _ret_to_parent;

    TeamsInfo(Widget content, void Function() return_to_parent)
        : _content = content,
          _ret_to_parent = return_to_parent;
          
    @override Widget 
    build(BuildContext context)
    {
        return Container(
            color: Colors.white,
            child: Stack(
                children: [
                    CupertinoScrollbar(
                        child: SingleChildScrollView(
                            child: _content
                        )
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            margin: EdgeInsets.fromLTRB(16.0, 0, 0, 8.0),
                            child: RaisedButton(
                                color: MIDNIGHT_BLUE,
                                onPressed: _ret_to_parent, 
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
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white
                                            ),
                                        ),
                                    ],
                                )
                            )
                        )
                    ),
                ],
            )
        );
    }
}