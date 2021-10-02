import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const EdgeInsetsGeometry padding = EdgeInsets.all(12.0);

/// Page with all the DBF teams as cards in a GridView. Clicking on a card will
/// pull up the appropriate Team's info page.
///
class DbfAllTeamsPage extends StatelessWidget {
  static const List<String> _teams = [
    'Propulsions',
    'Manufacturing',
    'CAD',
    'Aerodynamics',
    'Structures',
    'R&D',

  ];
  static final List<Color> _colors = [
    Colors.deepPurpleAccent,
    Colors.orange,
    Colors.cyan,
    Colors.blueGrey,
    Colors.teal,
    Colors.amber,
    Colors.blueAccent,
    Colors.deepOrange,
  ];

  final void Function(int) _changePage;

  DbfAllTeamsPage(void Function(int) changePage, {Key key})
      : _changePage = changePage,
        super(key: key) {
    _colors.shuffle();
  }

  GridTile _makeBioCard(
      BuildContext context, int idx, String team, Color color) {
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
          onPressed: () => _changePage(idx),
        ),
        color: color,
        margin: padding,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<GridTile> bios = [];
    for (int idx = 0; idx < _teams.length; idx++)
      bios.add(_makeBioCard(context, idx, _teams[idx], _colors[idx]));

    const double aspectRatio = 16 / 9;

    return Stack(
      children: <Widget>[
        Image(
          image: const AssetImage('./assets/images/teamsbackground.jpg'),
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          color: Color.fromRGBO(0, 0, 0, 0.5),
        ),
        CupertinoScrollbar(
          child: GridView.extent(
            maxCrossAxisExtent: 500.0,
            children: bios,
            childAspectRatio: aspectRatio,
            padding: padding,
          ),
        )
      ],
    );
  }
}
