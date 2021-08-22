import 'team_content.dart';

class RDContent implements TeamContent {
  String get teamName => 'R&D';

  List<Content> get content {
    return [
      Content(
        'R&D Subteam',
        ' ',
        'aero1.png',
      ),
      Content(
        'Responsibilities',
        'The R&D team determines works to develop new designs, analysis tools, and manufacturing techniques.',
        'bannerWindTun.jpg',
      ),
      Content(
        'Development',
        'For the 2021-22 school year, the team will start with a biplane collaboration with the manufacturing subteam.',
        'aero2.png',
      ),
    ];
  }

  List<Format> get format {
    return [
      Format(3, 2, true, true),
      Format(2, 3, false, false),
      Format(2, 3, false, true),
    ];
  }
}
