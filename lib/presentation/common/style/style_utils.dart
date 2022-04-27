// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class StyleUtils {
  // Vertical spacing constants. Adjust to your liking.
  static const double _VerticalSpaceSmall = 12.0;
  static const double _VerticalSpaceMedium = 24.0;
  static const double _VerticalSpaceLarge = 48.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 12.0;
  static const double _HorizontalSpaceMedium = 24.0;
  static const double _HorizontalSpaceLarge = 48.0;

  static const Widget verticalSpaceSmall =
      SizedBox(height: _VerticalSpaceSmall);
  static const Widget verticalSpaceMedium =
      SizedBox(height: _VerticalSpaceMedium);
  static const Widget verticalSpaceLarge =
      SizedBox(height: _VerticalSpaceLarge);

  static const Widget horizontalSpaceSmall =
      SizedBox(width: _HorizontalSpaceSmall);
  static const Widget horizontalSpaceMedium =
      SizedBox(width: _HorizontalSpaceMedium);
  static const Widget horizontalSpaceLarge =
      SizedBox(width: _HorizontalSpaceLarge);
}

class Fonts {
  static const String raleway = 'Raleway';
  // etc
}
