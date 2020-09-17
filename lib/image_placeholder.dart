import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget
{
    final ImageProvider _image_provider;
    final Widget _placeholder;
    final BoxFit _fit;

    const ImagePlaceholder(ImageProvider image, Widget placeholder, {BoxFit fit,
             Key key})
        : _image_provider = image, 
          _placeholder = placeholder, 
          _fit = fit,
          super(key: key);


    @override Widget
    build(BuildContext context)
    {
        return Image(
            image: _image_provider,
            fit: _fit,
            frameBuilder: (_, child, frame, was_sync_loaded)
            {
                if (was_sync_loaded)
                    return child;
                return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: frame != null? child : _placeholder
                );
            },
        );
    }
}