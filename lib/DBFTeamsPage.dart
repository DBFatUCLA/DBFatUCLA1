import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DBFAppBar.dart';

class DBFTeamsPage extends StatelessWidget
{
  final String _title;

  DBFTeamsPage(this._title);

  @override
  Widget
  build(BuildContext context)
  {
    return Scaffold(
      appBar: DBFAppBar(appbar_title: _title),
      body: DBFTeamsContent(),
    );
  }
}

class DBFTeamsContent extends StatelessWidget
{
  List<GridTile> _bios;

  static GridTile
  _make_bio_card(BuildContext context, String team, String description)
  {
    return GridTile(
      child: GestureDetector(
        child: Card(
          child: Center(
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
          ),
          color: Colors.indigo,
        ),
        onTap: ()
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
                        Text(
                          team,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'bold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          description,
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
      )
    );
  }

  DBFTeamsContent() : _bios = List<GridTile>();

  @override
  Widget
  build(BuildContext context)
  {
    _bios.add(_make_bio_card(context, 'Propulsions',
                             'haha plane goes vroooom and woosh'));
    _bios.add(_make_bio_card(context, 'Manufacturing',
                             'Did someone say Monokote?'));
    double aspect_ratio = 16/9;

    return Column(
      children: [
        SizedBox(
          height: 80,
          child: Card(
            child: Center(
              child: Text(
                'Click on a Team to learn more about them!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  fontFamily: 'bold',
                  fontWeight: FontWeight.bold,
                )
              )
            ),
            color: Colors.transparent
          )
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: _bios,
            childAspectRatio: aspect_ratio,
          )
        )
      ]
    );
  }
}
