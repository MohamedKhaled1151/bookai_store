// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/back_arrow.png
  AssetGenImage get backArrow =>
      const AssetGenImage('assets/images/back_arrow.png');

  /// File path: assets/images/system_design.png
  AssetGenImage get systemDesign =>
      const AssetGenImage('assets/images/system_design.png');

  /// File path: assets/images/welcome.png
  AssetGenImage get welcome => const AssetGenImage('assets/images/welcome.png');

  /// List of all assets
  List<AssetGenImage> get values => [backArrow, systemDesign, welcome];
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// File path: assets/logos/logo_app.png
  AssetGenImage get logoApp => const AssetGenImage('assets/logos/logo_app.png');

  /// File path: assets/logos/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/logos/splash_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [logoApp, splashLogo];
}

class $AssetsSvgiconsGen {
  const $AssetsSvgiconsGen();

  /// File path: assets/svgicons/apple_ic.svg
  String get appleIc => 'assets/svgicons/apple_ic.svg';

  /// File path: assets/svgicons/facebook-1-svgrepo-com.svg
  String get facebook1SvgrepoCom =>
      'assets/svgicons/facebook-1-svgrepo-com.svg';

  /// File path: assets/svgicons/facebook-svgrepo-com.svg
  String get facebookSvgrepoCom => 'assets/svgicons/facebook-svgrepo-com.svg';

  /// File path: assets/svgicons/google_ic.svg
  String get googleIc => 'assets/svgicons/google_ic.svg';

  /// List of all assets
  List<String> get values => [
    appleIc,
    facebook1SvgrepoCom,
    facebookSvgrepoCom,
    googleIc,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogosGen logos = $AssetsLogosGen();
  static const $AssetsSvgiconsGen svgicons = $AssetsSvgiconsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
