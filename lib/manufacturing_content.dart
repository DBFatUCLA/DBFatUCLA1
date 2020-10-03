import 'team_content.dart';

class ManufacturingContent implements TeamContent {
  String get teamName => 'Manufacturing';

  List<Content> get content {
    return [
      Content(
        'Manufacturing',
        ' ',
        'manufacture2.jpg',
      ),
      Content(
        'Manufacturing.',
        'The Manufacturing team is responsible for building the entire aircraft from the ground up. We do parts fabrication and assembly based on designs from the CAD team using carbon fiber, 3D printed plastics, wood, and a variety of other materials.',
        'oldComp.jpg',
      ),
      Content(
        'Who participates?',
        'Both manufacturing subteam members and members from other subteams help to manufacture prototypes for testing and the final plane for competition. Interested members are encouraged to join the manufacturing subteam to learn more about manufacturing processes before build days.',
        'compManuf.jpg',
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
