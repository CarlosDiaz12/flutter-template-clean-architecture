import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightTheme =
      _themeData(ThemeData.light(), lightColorScheme, _lightFocusColor);
  static ThemeData darkTheme =
      _themeData(ThemeData.dark(), darkColorScheme, _darkFocusColor);

  static ThemeData _themeData(
      ThemeData base, ColorScheme colorScheme, Color focusColor) {
    return base.copyWith(
      colorScheme: colorScheme,
      disabledColor: colorScheme.surface,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: colorScheme.primaryContainer, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.onSecondary, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        border: const OutlineInputBorder(),
      ),
      textTheme: _textTheme.apply(
          displayColor: colorScheme.onBackground,
          bodyColor: colorScheme.onBackground),
      primaryTextTheme: _textTheme.apply(
          displayColor: colorScheme.onBackground,
          bodyColor: colorScheme.onBackground),
      primaryColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        titleTextStyle: _textTheme.headline5?.copyWith(
          fontWeight: FontWeight.w700,
          color: colorScheme.onPrimary,
        ),
        toolbarTextStyle: _textTheme.headline5?.copyWith(
          fontWeight: FontWeight.w700,
          color: colorScheme.onPrimary,
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),
      cardColor: colorScheme.surface,
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      hintColor: colorScheme.onSecondary,
      focusColor: colorScheme.secondary,
      buttonTheme: const ButtonThemeData(
        shape: ContinuousRectangleBorder(),
        textTheme: ButtonTextTheme.primary,
      ),
      chipTheme: base.chipTheme.copyWith(
          labelStyle:
              _textTheme.bodyText2?.copyWith(color: colorScheme.onBackground),
          secondarySelectedColor: colorScheme.brightness == Brightness.dark
              ? colorScheme.secondary
              : colorScheme.primaryContainer,
          secondaryLabelStyle:
              _textTheme.bodyText2?.copyWith(color: colorScheme.onBackground)),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          colorScheme.surface.withOpacity(0.80),
          colorScheme.onSurface,
        ),
        contentTextStyle:
            _textTheme.subtitle1?.apply(color: colorScheme.onBackground),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFF0D60B6),
    primaryContainer: Color(0xFF1565D8),
    secondary: Color(0xFFF2AE1D),
    secondaryContainer: Color(0xFFF09650),
    background: Colors.white,
    surface: Color(0xFFe8effa),
    onBackground: Colors.black,
    error: Color(0xFFC12D2C),
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Color(0xFF8692A6),
    onSurface: Color(0xFF879FBE),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFF0D60B6),
    primaryContainer: Color(0xFF1565D8),
    secondary: Color(0xFFF2AE1D),
    secondaryContainer: Color(0xFFF09650),
    background: Color(0xFF262624),
    surface: Color(0xFF2E2E29),
    onBackground: Colors.white,
    error: Color(0xFFC12D2C),
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Color(0xFF58595b),
    brightness: Brightness.dark,
  );

  static const TextTheme _textTheme = TextTheme(
    headline1: TextStyle(
        fontSize: 90, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    headline2: TextStyle(
        fontSize: 54, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    headline3: TextStyle(fontSize: 45, fontWeight: FontWeight.w400),
    headline4: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    headline5: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    headline6: TextStyle(
        fontSize: 17, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    subtitle1: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    subtitle2: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyText1: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.5),
    bodyText2: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.25),
    button: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    caption: TextStyle(
        fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: TextStyle(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );
}
