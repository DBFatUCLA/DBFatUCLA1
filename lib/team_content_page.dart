import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'team_content.dart';
import 'image_placeholder.dart';
import 'safetext.dart';
import 'separator.dart';

const Color DbfLogoBackgroundBlue = Color.fromRGBO(196, 229, 252, 1.0);
const double largePadding = 32;
const double smallPadding = 12;
const double separatorLength = 48;
const String path = './assets/images';

/**
 * Actual Widget that displays the content & images of a Team's info page.
 * Content and tiling are controled by the TeamContent object.
 */
class TeamContentPage extends StatelessWidget
{
    final Color _alt_background;
    final TeamContent _content;

    const TeamContentPage(TeamContent content, {
            Color alt_background=DbfLogoBackgroundBlue})
        : _alt_background = alt_background,
          _content = content;

    @override Widget 
    build(BuildContext context)
    {
        final bool build_tablet = MediaQuery.of(context).size.width > 600;
        final Widget Function(BuildContext context, int idx) func =
            (_, idx)
            {
                Content c = _content.content[idx];
                Format f = _content.format[idx];
                SafeText title = SafeText(
                    c.title, 
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                );
                SafeText description = SafeText(
                    c.description,
                    textAlign: TextAlign.left,
                );

                if (c.image == null)
                {
                    return _compose_no_image(title, description, 
                            f.use_alt_color);
                }
                
                Widget image = ImagePlaceholder(
                    AssetImage('${path}/${c.image}'),
                    CircularProgressIndicator(),
                    fit: BoxFit.fill
                );
                if (build_tablet)
                {
                    return _compose_two_columns(title, description, image, 
                            f.left_flex, f.right_flex, f.text_on_left, 
                            f.use_alt_color);
                }
                return _compose_column(title, description, image, 
                        f.use_alt_color);
            };
        
        return SafeArea(
            child: CupertinoScrollbar(
                child: ListView.separated(
                    itemCount: _content.content.length,
                    itemBuilder: func,
                    separatorBuilder: (_, __)
                        => Divider(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            height: 0,
                            thickness: 1,
                        )
                )
            )
        );
    }
    
    Widget 
    _compose_no_image(Widget title, Widget description, bool use_alt_background)
    {
        return Container(
            color: use_alt_background? _alt_background : Colors.transparent,
            margin: EdgeInsets.symmetric(
                horizontal: largePadding,
                vertical: smallPadding
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    title,
                    Separator(color: Colors.black, length: separatorLength,),
                    description,
                ],
            )
        );
    }
    
    Widget 
    _compose_two_columns(Widget title, Widget description, Widget image, 
            int flex_left, int flex_right, bool text_on_left, 
            bool use_alt_background)
    {
        Widget text = Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                title, 
                Separator(color: Colors.black, length: separatorLength,),
                description
            ],
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
                        Container(width: largePadding,),
                        Expanded( 
                            flex: flex_right,
                            child: text_on_left? image : text,
                        ),
                    ]
                ),
                margin: EdgeInsets.symmetric(
                    horizontal: largePadding, 
                    vertical: smallPadding
                )
            )
        );
    }
    
    Widget 
    _compose_column(Widget title, Widget description, Widget image, 
            bool use_alt_background)
    {
        return Container(
            color: use_alt_background? _alt_background : Colors.transparent,
            padding: EdgeInsets.symmetric(
                horizontal: largePadding,
                vertical: smallPadding
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                title,
                                Separator(
                                    color: Colors.black, 
                                    length: separatorLength,
                                ),
                                description,
                            ],
                        ),
                    ),
                    Container(height: smallPadding,),
                    image
                ],
            )
        );
    }
}