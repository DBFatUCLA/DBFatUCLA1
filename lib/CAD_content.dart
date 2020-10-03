import 'team_content.dart';

class CADContent implements TeamContent {
  String get teamName => 'CAD';

  List<Content> get content {
    return [
      Content(
        'Computer Aided Design Subteam',
        ' ',
        'CAD3.jpg',
      ),
      Content(
        'Development Responsibilities:',
        'The Computer-Aided Design (CAD) team generates three-dimensional drawings using computer software that helps us design and manufacture our plane! In many cases, these computer drawings are directly used to 3D-print or laser-cut aircraft parts.',
        'CAD2.png',
      ),
      Content(
        'Design Applications',
        'Before flight, the propulsions and electronics team selects the appropriate propellor and tests the response of the servos that power the control surfaces (flaps, ailerons, elevator and rudder) and other mechanisms, such as our banner deployment mechanism last year.',
        'img2.jpg',
      ),
      Content(
        'Software',
        'The CAD team uses SOLIDWORKS to model the plane and plane components. By using other software, these designs can be used for 3D printing and laser cutting as well as perform aerodynmaic analysis.\n',
      )
    ];
  }

  List<Format> get format {
    return [
      Format(3, 2, true, true),
      Format(2, 3, false, false),
      Format(2, 3, false, true),
      Format(1, 1, true, false),
    ];
  }
}
