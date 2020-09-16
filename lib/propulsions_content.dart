import 'team_content.dart';

class PropulsionsContent implements TeamContent 
{
    String get
    team_name => 'Propulsions';
    
    List<Content> get
    content 
    {
        return [
            Content( 
                'Propulsions',
                'This is the format which I have code to duplicate.',
                'img0.jpg'
            ),
            Content( 
                'Reversed so Image is on left.',
'''Here is a really loooooooooooong line that has lots of content. So much content. You wouldn't believe the amount of content...\n\n\n\n\n\n\n\n\n\n\n\n\n\nsurprise''',
                'img1.png'
            ),
            Content(
                'Mobile?',
                'Just change the browser size!',
                'img2.jpg'
            ),
            Content(
                'This one has no image',
                'Just the title and description.\n\n\n\n\n',
            )
        ];
    }
    
    List<Format> get
    format
    {
        return [
            Format(3, 2, true, true),
            Format(2, 3, false, false),
            Format(2, 3, false, true),
            Format(1, 1, true, false),
        ];
    }
}