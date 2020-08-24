import 'package:flutter/material.dart';

import 'DBFAppBar.dart';

class DBFTeamsPage extends StatelessWidget
{
  final String _title;
  final String _route;

  DBFTeamsPage({Key key, String title, String route})
    : _title = title,
      _route = route,
      super(key: key);

  @override
  Widget
  build(BuildContext context)
  {
    return Scaffold(
      appBar: DBFAppBar(title: _title, route: _route),
      body: DBFTeamsContent(),
    );
  }
}

class DBFTeamsContent extends StatelessWidget
{
  static EdgeInsetsGeometry _padding = EdgeInsets.all(12.0);
  List<String> _teams;
  List<String> _descriptions;
  List<Color> _colors;

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
                fontSize: 25,
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
                          children: <Widget> [
                            SelectableText(
                              team,
                              toolbarOptions: ToolbarOptions(
                                copy: true,
                                paste: true
                              ),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'bold',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SelectableText(
                              description,
                              toolbarOptions: ToolbarOptions(
                                copy: true,
                                paste: true
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )
                      ),
                    ),
                    widthFactor: .7,
                    heightFactor: .7
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

  DBFTeamsContent()
    : _colors = [], _teams = [], _descriptions = []
  {
    _colors.add(Colors.deepPurpleAccent);
    _colors.add(Colors.orange);
    _colors.add(Colors.indigo);
    _colors.add(Colors.blueGrey);
    _colors.shuffle();

    _teams.add('Propulsions');
    _descriptions.add('haha plane goes vroooom and woosh');

    _teams.add('Manufacturing');
    _descriptions.add('Did someone say Monokote?');

    _teams.add('CAD');
    _descriptions.add('Spruce Caboose!');

    _teams.add('Rowlet');
    _descriptions.add('Don\'t do anything meaningful');
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
        GridView.extent(
          maxCrossAxisExtent: 500.0,
          children: bios,
          childAspectRatio: aspect_ratio,
          padding: _padding,
        )
      ]
    );
  }
}
