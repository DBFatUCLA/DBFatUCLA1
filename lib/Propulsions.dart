import 'package:flutter/material.dart';

import 'safetext.dart';
import 'separator.dart';

const Color LIGHT_GREY = Color.fromRGBO(205, 205, 205, 1);
const String PATH = './assets/images';

class Propulsions extends StatelessWidget
{
    const Propulsions();

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
            bool do_use_grey_background)
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
            color: do_use_grey_background? LIGHT_GREY : Colors.transparent,
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
    _build_tablet(BuildContext context)
    {
        Widget image1 = const Image(  
            image: AssetImage('${PATH}/img0.jpg'),
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
            image: AssetImage('${PATH}/img1.png'),
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
            image: AssetImage('${PATH}/img2.jpg'),
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
        return Column(
            children: [
                Card( 
                    color: LIGHT_GREY,
                    child: Column(
                        children: [
                            SafeText(
                                'Propulsions', 
                                fontSize: 36.0, 
                                fontWeight: FontWeight.bold,
                            ),
                            SafeText('Something here...'),
                            const Image( 
                                image: AssetImage('./assets/images/img0.jpg')
                            )
                        ],
                    ),
                )
            ],
        );
    }
}