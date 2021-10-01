import 'team_content.dart';

class Dbf2021 implements TeamContent {
  String get teamName => 'DBF 2021 -- Jigsaw';

  List<Content> get content {
    return [
      Content(
        'Aerodynamics Subteam',
        ' ',
        'aero1.png',
      ),
      Content(
        'Responsibilities',
        'The Aerodynamics team determines the basic dimensions of the aircraft, and makes decisions about all aspects of the wing and tail sections. Additionally, aerodynamic effects of anything carried outside the aircraft body (i.e a banner or footballs) are investigated to determine their effect on aircraft performance.',
        'bannerWindTun.jpg',
      ),
      Content(
        'Software',
        'The aerodynamics team relies heavily on software to perform analysis, using MATLAB code for preliminary design and software such as Ansys and Solidworks to evaluate lift and drag characteristics.',
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
