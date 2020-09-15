import 'package:flutter/material.dart';

import 'safetext.dart';
import 'separator.dart';

const Color DbfLogoBackgroundBlue = Color.fromRGBO(196, 229, 252, 1.0);
const String path = './assets/images';

class Propulsions extends StatelessWidget
{
    final Color _alt_background;

    const Propulsions({Color alt_background=DbfLogoBackgroundBlue})
        : _alt_background = alt_background;

    @override Widget 
    build(BuildContext context)
    {
        return SafeArea(
            child: LayoutBuilder(
                builder: (context, _)
                {
                    if (MediaQuery.of(context).size.width > 600)
                        return _build_tablet(context);
                    return _build_mobile(context);
                },
            )
        );
    }
    
    Widget 
    _compose_two_columns(Widget title, Widget description, Widget image, 
            int flex_left, int flex_right, bool text_on_left, 
            bool use_alt_background)
    {
        Widget text = Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    title, 
                    Separator(color: Colors.black, length: 48.0,),
                    description
                ],
            ),
            margin: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
        );
        
        return Container( 
            color: use_alt_background? _alt_background : Colors.transparent,
            child: Container(
                child: Row(
                    children: [
                        Expanded(
                            flex: flex_left,
                            child: text_on_left? text : image
                        ),
                        Expanded( 
                            flex: flex_right,
                            child: Container(
                                child: text_on_left? image : text,
                            )
                        )
                    ]
                ),
                margin: EdgeInsets.all(8.0)
            )
        );
    }
    
    Widget 
    _compose_column(Widget title, Widget description, Widget image, 
            bool use_alt_background)
    {
        return Container(
            color: use_alt_background? _alt_background : Colors.white,
            child: Column(
                children: [
                    Container(
                        child: Column(
                            children: [
                                title,
                                Separator(color: Colors.black, length: 48.0,),
                                description,
                            ],
                        ),
                        margin: EdgeInsets.fromLTRB(4, 4, 4, 0),
                    ),
                    Card(
                        child: image,
                        margin: EdgeInsets.all(8.0)
                    )
                ],
            )
        );
    }

    Widget 
    _build_tablet(BuildContext context)
    {
        Widget image1 = const Image(  
            image: AssetImage('${path}/img0.jpg'),
            fit: BoxFit.fill
        );
        Widget title1 = SafeText(
            'Propulsions',
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
        );
        Widget description1 = SafeText(
            'This is the format which I have code to duplicate.\n'
        );

        Widget image2 = const Image(
            image: AssetImage('${path}/img1.png'),
            fit: BoxFit.fill
        );
        Widget title2 = SafeText( 
            'Reversed so Image is on left.',
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
        );
        Widget description2 = SafeText(
'''
Here is a really loooooooooooong line that has lots of content. So much content. You wouldn't believe the amount of content...\n
Short line.\np\nr\no\np\nu\nl\ns\ni\no\nn\ns\n
Now this is text that tries to leave the format...\nIt cannot.
'''
        );

        Widget image3 = const Image(  
            image: AssetImage('${path}/img2.jpg'),
            fit: BoxFit.fill
        );
        Widget title3 = SafeText(
            'Mobile?',
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
        );
        Widget description3 = SafeText(
            'Still working on it, need some ideas...'
        );

        return Column(
            children: [
                _compose_two_columns(title1, description1, image1, 2, 1, true, 
                        true),
                _compose_two_columns(title2, description2, image2, 1, 2, false,
                        false),
                _compose_two_columns(title3, description3, image3, 1, 1, true,
                        true),
            ],
        );
    }

    Widget 
    _build_mobile(BuildContext context)
    {
        Widget image1 = const Image(  
            image: AssetImage('${path}/img0.jpg'),
            fit: BoxFit.fitWidth
        );
        Widget title1 = SafeText(
            'Propulsions',
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
        );
        Widget description1 = SafeText(
            'This is the format which I have code to duplicate.\n'
        );

        Widget image2 = const Image(
            image: AssetImage('${path}/img1.png'),
            fit: BoxFit.fitWidth
        );
        Widget title2 = SafeText( 
            'Reversed so Image is on left.',
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
        );
        Widget description2 = SafeText(
'''
Here is a really loooooooooooong line that has lots of content. So much content. You wouldn't believe the amount of content...\n
Short line.\np\nr\no\np\nu\nl\ns\ni\no\nn\ns\n
Now this is text that tries to leave the format...\nIt cannot.
'''
        );

        Widget image3 = const Image(  
            image: AssetImage('${path}/img2.jpg'),
            fit: BoxFit.fitWidth
        );
        Widget title3 = SafeText(
            'Mobile?',
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
        );
        Widget description3 = SafeText(
            'Still working on it, need some ideas...'
        );
        
        List<Widget> l = [
            _compose_column(title1, description1, image1, true),
            _compose_column(title2, description2, image2, false),
            _compose_column(title3, description3, image3, true),
        ];
        return ListView.separated(
            shrinkWrap: true,
            itemCount: l.length,
            itemBuilder: (_, index) => l[index],
            separatorBuilder: (_, index) 
                => Divider(
                    color: Color.fromRGBO(0, 0, 0, 0.35), 
                    thickness: 1, 
                    height: 0
                ),
        );
    }
}