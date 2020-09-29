import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  final ImageProvider _imageProvider;
  final Widget _placeholder;
  final BoxFit _fit;

  const ImagePlaceholder(ImageProvider image, Widget placeholder,
      {BoxFit fit, Key key})
      : _imageProvider = image,
        _placeholder = placeholder,
        _fit = fit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: _imageProvider,
      fit: _fit,
      frameBuilder: (_, child, frame, wasSyncLoaded) {
        if (wasSyncLoaded) return child;
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: frame != null ? child : _placeholder,
        );
      },
    );
  }
}
