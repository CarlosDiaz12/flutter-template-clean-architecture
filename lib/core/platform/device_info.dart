import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class DeviceOS {
  // Syntax sugar, proxy the UniversalPlatform methods so our views can reference a single class
  static bool isIOS = UniversalPlatform.isIOS;
  static bool isAndroid = UniversalPlatform.isAndroid;
  static bool isMacOS = UniversalPlatform.isMacOS;
  static bool isLinux = UniversalPlatform.isLinux;
  static bool isWindows = UniversalPlatform.isWindows;

  // Higher level device class abstractions (more syntax sugar for the views)
  static bool isWeb = kIsWeb;
  static bool get isDesktop => isWindows || isMacOS || isLinux;
  static bool get isMobile => isAndroid || isIOS;
  static bool get isDesktopOrWeb => isDesktop || isWeb;
  static bool get isMobileOrWeb => isMobile || isWeb;
}

// ignore: constant_identifier_names
enum ScreenType { Monitor, Phone, Tablet, Watch }

class FormFactor {
  static double desktop = 900;
  static double tablet = 600;
  static double handset = 300;
}

class DeviceScreen {
  static ScreenType getFormFactor(BuildContext context) {
    // Use .shortestSide to detect device type regardless of orientation
    double deviceWidth = MediaQuery.of(context).size.shortestSide;
    if (deviceWidth > FormFactor.desktop) return ScreenType.Monitor;
    if (deviceWidth > FormFactor.tablet) return ScreenType.Tablet;
    if (deviceWidth > FormFactor.handset) return ScreenType.Phone;
    return ScreenType.Watch;
  }

  static ScreenSize getSize(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.shortestSide;
    if (deviceWidth > 900) return ScreenSize.ExtraLarge;
    if (deviceWidth > 600) return ScreenSize.Large;
    if (deviceWidth > 300) return ScreenSize.Normal;
    return ScreenSize.Small;
  }

  static bool isPhone(BuildContext context) =>
      getFormFactor(context) == ScreenType.Phone;
  static bool isTablet(BuildContext context) =>
      getFormFactor(context) == ScreenType.Tablet;
  static bool isMonitor(BuildContext context) =>
      getFormFactor(context) == ScreenType.Monitor;
}

// ignore: constant_identifier_names
enum ScreenSize { Small, Normal, Large, ExtraLarge }
