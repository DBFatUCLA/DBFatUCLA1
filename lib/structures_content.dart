import 'team_content.dart';

class StructuresContent implements TeamContent {
  String get teamName => 'Structures';

  List<Content> get content {
    return [
      Content(
        'Structures',
        ' ',
        'struct1.png',
      ),
      Content(
        'Responsibilities',
        'The Structures team is involved with designing and testing structural components of the airplane. We determine structural capabilities through calculations and computer modeling.',
        'landing1.JPG',
      ),
      Content(
        'Software:',
        'The team uses software such as ANSYS and Solidworks to perform analysis of the structural capabilities of the plane based on expected stresses and strains associated with takeoff, flight, and landing.',
        'struct2.png',
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
