import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'safetext.dart';
import 'separator.dart';

/// Page with cards team names. Pressing on them brings up a description via
///     dialog.
/// Cards are colored, which get shuffled everytime the page is loaded.
class DBFTeamsPage extends StatelessWidget
{
    static const EdgeInsetsGeometry _padding = EdgeInsets.all(12.0);
    static const List<String> _teams = [
        'Propulsions',
        'Manufacturing',
        'CAD',
        'Aerodynamics',
        'Structures'
    ];
    static const List<String> _descriptions = [
        'haha plane goes vroooom and woosh',
        'Did someone say Monokote?',
        'Spruce Caboose!',
        'Spruce Bruce!',
        'Spruce Zeus... what could have been...'
    ];
    List<Color> _colors = [
        Colors.deepPurpleAccent,
        Colors.orange,
        Colors.cyan,
        Colors.blueGrey,
        Colors.teal,
        Colors.amber,
        Colors.blueAccent,
        Colors.lightBlueAccent
    ];

    DBFTeamsPage({Key key})
        : super(key: key)
    {
        _colors.shuffle();
    }

    /// What happens when a 
    static void Function()
    _display_description(BuildContext context, String team, String description)
    {
        Widget display_me = FractionallySizedBox(
            heightFactor: 0.8,
            widthFactor: 0.8,
            child: Card(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                        SafeText(
                            team,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                        Separator(color: Colors.black, length: 0.0),
                        Container(
                            child: SafeText(description),
                            margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
                        )
                    ],
                ),
            )
        );

        return ()
        {
            showDialog(
                context: context,
                builder: (BuildContext _)
                    => display_me,
            );
        };
    }

    static GridTile
    _make_bio_card(BuildContext context, String team, String description,
            Color color)
    {
        return GridTile(
            child: Card(
                child: FlatButton(
                    child: Text(
                        team,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'bold',
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                    onPressed: DBFTeamsPage._display_description(context, team, 
                        description)
                ),
                color: color,
                margin: _padding,
            ),
        );
    }

    @override Widget
    build(BuildContext context)
    {
        List<GridTile> bios = [];
        for (int idx = 0; idx < _teams.length; idx++)
        {
            bios.add(_make_bio_card(context, _teams[idx], _descriptions[idx],
                    _colors[idx]));
        }

        const double aspect_ratio = 16/9;
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;

        return Stack(
            children: <Widget> [
                Image(
                    image: const AssetImage(
                        './assets/images/teamsbackground.jpg'
                    ),
                    fit: BoxFit.fill,
                    height: height,
                    width: width,
                ),
                Container(
                    color: Color.fromRGBO(0, 0, 0, 0.5)
                ),
                CupertinoScrollbar(
                    child: GridView.extent(
                        maxCrossAxisExtent: 500.0,
                        children: bios,
                        childAspectRatio: aspect_ratio,
                        padding: _padding,
                    )
                )
            ]
        );
    }
}
