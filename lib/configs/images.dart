part of 'config.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const github = _Image('github-logo.png');

  static Future precacheAssets(BuildContext context) async {
    await precacheImage(github, context);
  }
}
