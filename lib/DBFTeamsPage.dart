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
  List<GridTile> _bios;

  static GridTile
  _make_bio_card(BuildContext context, String team, String description)
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
        color: Colors.indigo,
        margin: _padding,
      ),
    );
  }

  DBFTeamsContent() : _bios = List<GridTile>();

  @override Widget
  build(BuildContext context)
  {
    _bios.add(_make_bio_card(context, 'Propulsions',
                             'haha plane goes vroooom and woosh'));
    _bios.add(_make_bio_card(context, 'Manufacturing',
                             'Did someone say Monokote?'));
    double aspect_ratio = 16/9;

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Card(
              child: Center(
                child: SelectableText(
                  'Click on a Team to learn more about them!',
                  toolbarOptions: ToolbarOptions(
                    copy: true,
                    paste: true
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Cambria',
                    fontWeight: FontWeight.bold,
                  )
                ),
              ),
              color: Colors.transparent
            )
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: _bios,
              childAspectRatio: aspect_ratio,
              padding: _padding,
            )
          )
        ]
      ),
      color: Colors.black
    );
  }
}
