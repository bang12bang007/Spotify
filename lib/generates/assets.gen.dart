/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/OpenSans-Bold.ttf
  String get openSansBold => 'assets/fonts/OpenSans-Bold.ttf';

  /// File path: assets/fonts/OpenSans-BoldItalic.ttf
  String get openSansBoldItalic => 'assets/fonts/OpenSans-BoldItalic.ttf';

  /// File path: assets/fonts/OpenSans-ExtraBold.ttf
  String get openSansExtraBold => 'assets/fonts/OpenSans-ExtraBold.ttf';

  /// File path: assets/fonts/OpenSans-ExtraBoldItalic.ttf
  String get openSansExtraBoldItalic =>
      'assets/fonts/OpenSans-ExtraBoldItalic.ttf';

  /// File path: assets/fonts/OpenSans-Italic.ttf
  String get openSansItalic => 'assets/fonts/OpenSans-Italic.ttf';

  /// File path: assets/fonts/OpenSans-Light.ttf
  String get openSansLight => 'assets/fonts/OpenSans-Light.ttf';

  /// File path: assets/fonts/OpenSans-LightItalic.ttf
  String get openSansLightItalic => 'assets/fonts/OpenSans-LightItalic.ttf';

  /// File path: assets/fonts/OpenSans-Regular.ttf
  String get openSansRegular => 'assets/fonts/OpenSans-Regular.ttf';

  /// File path: assets/fonts/OpenSans-Semibold.ttf
  String get openSansSemibold => 'assets/fonts/OpenSans-Semibold.ttf';

  /// File path: assets/fonts/OpenSans-SemiboldItalic.ttf
  String get openSansSemiboldItalic =>
      'assets/fonts/OpenSans-SemiboldItalic.ttf';

  /// List of all assets
  List<String> get values => [
        openSansBold,
        openSansBoldItalic,
        openSansExtraBold,
        openSansExtraBoldItalic,
        openSansItalic,
        openSansLight,
        openSansLightItalic,
        openSansRegular,
        openSansSemibold,
        openSansSemiboldItalic
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/apple.png
  AssetGenImage get apple => const AssetGenImage('assets/images/apple.png');

  /// File path: assets/images/chooes_mode.png
  AssetGenImage get chooesMode =>
      const AssetGenImage('assets/images/chooes_mode.png');

  /// File path: assets/images/gg.png
  AssetGenImage get gg => const AssetGenImage('assets/images/gg.png');

  /// File path: assets/images/moon.png
  AssetGenImage get moon => const AssetGenImage('assets/images/moon.png');

  /// File path: assets/images/started.png
  AssetGenImage get started => const AssetGenImage('assets/images/started.png');

  /// File path: assets/images/sun.png
  AssetGenImage get sun => const AssetGenImage('assets/images/sun.png');

  /// List of all assets
  List<AssetGenImage> get values => [apple, chooesMode, gg, moon, started, sun];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/gg.svg
  SvgGenImage get gg => const SvgGenImage('assets/svg/gg.svg');

  /// File path: assets/svg/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/svg/logo.svg');

  /// List of all assets
  List<SvgGenImage> get values => [gg, logo];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
