import 'package:flutter/material.dart';

class ScreenConfigs {
  static late MediaQueryData _mediaQueryData;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _designWidth;
  static late double _designHeight;
  static late double _textScaleFactor;

  static void init(BuildContext context, {Size designSize = const Size(375, 812)}) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    _designWidth = designSize.width;
    _designHeight = designSize.height;
    _textScaleFactor = _mediaQueryData.textScaleFactor;
  }

  static double sp(double size) {
    double scale = _screenWidth / _designWidth;
    return size * scale * _textScaleFactor;
  }

  static double w(double size) {
    return size * _screenWidth / _designWidth;
  }

  static double h(double size) {
    return size * _screenHeight / _designHeight;
  }

  // Additional utility methods

  static double get scaleWidth => _screenWidth / _designWidth;

  static double get scaleHeight => _screenHeight / _designHeight;

  static double setWidth(double width) => w(width);

  static double setHeight(double height) => h(height);

  static double radius(double radius) => radius * scaleWidth;

  static double setSp(double fontSize) => sp(fontSize);

  // Shorthand for MediaQuery properties
  static double get statusBarHeight => _mediaQueryData.padding.top;

  static double get bottomBarHeight => _mediaQueryData.padding.bottom;

  // Orientation helper
  static bool get isPortrait => _mediaQueryData.orientation == Orientation.portrait;

  static bool get isLandscape => _mediaQueryData.orientation == Orientation.landscape;
}

// Extension methods for easier usage
extension SizeExtension on num {
  double get w => ScreenConfigs.w(toDouble());

  double get h => ScreenConfigs.h(toDouble());

  double get sp => ScreenConfigs.sp(toDouble());

  double get r => ScreenConfigs.radius(toDouble());
}
