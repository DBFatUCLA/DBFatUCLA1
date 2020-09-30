import 'team_content.dart';

class PropulsionsContent implements TeamContent {
  String get teamName => 'Propulsions';

  List<Content> get content {
    return [
      Content(
        'Propulsions and Electronics',
        ' ',
        'img1.jpg',
      ),
      Content(
        'Development Responsibilities:',
        'The Propulsion & Electronics team is responsible for selecting and testing the electric propulsion system components for the aircraft. We also set up any other electronics for the aircraft, such as servo actuators and the receiver/transmitter.',
        'img2.jpg',
      ),
      Content(
        'Flight Day Responsibilities',
        'Before flight, the propulsions and electronics team selects the appropriate propellor and tests the response of the servos that power the control surfaces (flaps, ailerons, elevator and rudder) and other mechanisms, such as our banner deployment mechanism last year.',
        'img3.jpg',
      ),
      Content(
        'Testing Methods:',
        'We rely on a mixture of theoretical and practical methods to test the propulsion systems, including static thrust testing in the lab.\n\n\n\n\n',
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
