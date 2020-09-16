import 'team_content.dart';

class PropulsionsContent implements TeamContent 
{
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
'''Here is a really loooooooooooong line that has lots of content. So much content. You wouldn't believe the amount of content...''',
                'img1.png'
            ),
            Content(
                'Mobile?',
                'Just change the browser size!',
                'img2.jpg'
            ),
            Content(
                'This one has no image',
                'Just the title and description.\n\n',
            )
        ];
    }
    
    List<Format> get
    format
    {
        return [
            Format(2, 1, true, true),
            Format(1, 2, false, false),
            Format(1, 1, true, true),
            Format(1, 1, true, false),
        ];
    }
}