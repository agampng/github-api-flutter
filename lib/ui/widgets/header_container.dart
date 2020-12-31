part of 'widgets.dart';

class HeaderContainerProperties {
  static const double _padding = 28;
  static const double _sizeFraction = 0.6;

  const HeaderContainerProperties._({this.size, this.top, this.right});

  final double size;
  final double top;
  final double right;

  factory HeaderContainerProperties(BuildContext context) {
    final screenSize = context.screenSize;
    final iconSize = context.iconSize;

    final size = screenSize.width * _sizeFraction;
    final top = -(size / 3 -
        iconSize / 3 -
        context.responsive(_padding) -
        context.padding.top);
    final right = -(size / 3 - iconSize / 3 - _padding);

    return HeaderContainerProperties._(size: size, top: top, right: right);
  }
}

class HeaderBackground extends StatelessWidget {
  final List<Widget> Function(HeaderContainerProperties) buildChildren;

  const HeaderBackground({Key key, @required this.buildChildren})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final properties = HeaderContainerProperties(context);

    return Stack(
      children: <Widget>[
        Positioned(
          top: properties.top,
          right: properties.right,
          child: Image(
            image: AppImages.github,
            width: properties.size,
            height: properties.size,
            color: Colors.black.withOpacity(0.05),
          ),
        ),
        ...buildChildren(properties),
      ],
    );
  }
}
