import 'package:flutter/material.dart';

extension MediaQueryExtentions on BuildContext {
  double get heightScreen => MediaQuery.of(this).size.height;
  double get widthScreen => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).padding.top;
  double get bottomPadding =>
      MediaQuery.of(this).viewInsets.bottom; //default is zero
}
