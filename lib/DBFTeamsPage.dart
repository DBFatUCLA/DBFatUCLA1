import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'safetext.dart';
import 'separator.dart';

class DBFTeamsPage extends StatelessWidget
{
  static const EdgeInsetsGeometry _padding = EdgeInsets.all(12.0);
  List<String> _teams;
  List<String> _descriptions;
  List<Color> _colors;

  DBFTeamsPage({Key key})
    : _colors = [], _teams = [], _descriptions = [], super(key: key)
  {
    _colors.add(Colors.deepPurpleAccent);
    _colors.add(Colors.orange);
    _colors.add(Colors.indigo);
    _colors.add(Colors.blueGrey);
    _colors.add(Colors.teal);
    _colors.shuffle();

    _teams.add('Propulsions');
    _descriptions.add('haha plane goes vroooom and woosh');

    _teams.add('Manufacturing');
    _descriptions.add('Did someone say Monokote?');

    _teams.add('CAD');
    _descriptions.add('Spruce Caboose!');

    _teams.add('Aerodynamics');
    _descriptions.add('Spruce Bruce!');

    _teams.add('Structures');
    _descriptions.add('Spruce Zeus... what could have been...');
  }

  static GridTile
  _make_bio_card(BuildContext context, String team, String description,
      Color color)
  {
    return GridTile(
      child: Card(
        child: Container(
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
            onPressed: ()
            {
              showDialog(
                context: context,
                builder: (BuildContext context)
                {
                  return FractionallySizedBox(
                    child: Card(
                      child: Center(
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
                        )
                      ),
                    ),
                    widthFactor: .8,
                    heightFactor: .8
                  );
                }
              );
            }
          ),
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

    double aspect_ratio = 16/9;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget> [
        Image(
          image: AssetImage('./assets/images/teamsbackground.jpg'),
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
