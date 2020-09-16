abstract class TeamContent
{
    String get
    team_name;
    
    List<Content> get 
    content;

    List<Format> get
    format;
}

class Format
{
    final int left_flex;
    final int right_flex;
    final bool text_on_left;
    final bool use_alt_color;

    Format([int left=1, int right=1, bool text_on_left=true, 
            bool use_alt_color=true])
        : left_flex = left,
          right_flex = right,
          text_on_left = text_on_left,
          use_alt_color = use_alt_color;
}

class Content
{
    final String title;
    final String description;
    String image;

    Content(String title, String description, [String image])
        : title = title,
          description = description,
          image = image;
}