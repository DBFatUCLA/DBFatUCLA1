abstract class TeamContent {
  String get teamName;

  List<Content> get content;

  List<Format> get format;
}

class Format {
  final int leftFlex;
  final int rightFlex;
  final bool textOnLeft;
  final bool useAltColor;

  Format(
      [int left = 1,
      int right = 1,
      bool textOnLeft = true,
      bool useAltColor = true])
      : leftFlex = left,
        rightFlex = right,
        textOnLeft = textOnLeft,
        useAltColor = useAltColor;
}

class Content {
  final String title;
  final String description;
  String image;

  Content(String title, String description, [String image])
      : title = title,
        description = description,
        image = image;
}
