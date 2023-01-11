import 'package:flutter/material.dart';

class StorywaysThemeData {
  static const _lightFillColor = Color(0xFF181A19);
  static const _darkFillColor = Colors.white;

  static const Color _primaryColor = Color(0xFF5B5EA6);
  static const Color _publishedDateColor = Color(0xFF263D36);
  static const Color _bottomNavBarColor = Color(0xFFF5F9F7);

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      fontFamily: "Rubik",
      textTheme: _textTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: colorScheme.background,
      ),
      iconTheme: IconThemeData(color: colorScheme.primary),
      bottomAppBarTheme: BottomAppBarTheme(
        color: _bottomNavBarColor.withOpacity(0.7),
        elevation: 0,
      ),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      dividerTheme: DividerThemeData(
        color: colorScheme.secondary,
        thickness: 1,
        space: 0,
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: _primaryColor,
    onPrimary: Colors.white,
    primaryContainer: Color(0xFF5C5EA6),
    secondary: Color(0xFFE1EBE8),
    secondaryContainer: Color(0xFFFAFBFB),
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFFAFBFB),
    onBackground: Color(0xFFE1EBE8),
    error: _lightFillColor,
    onError: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: _primaryColor,
    onPrimary: Colors.white,
    primaryContainer: Color(0xFF5C5EA6),
    secondary: Color(0xFFE1EBE8),
    secondaryContainer: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF), // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _bold = FontWeight.w700;

  static TextStyle publishedDateStyle =
      _textTheme.bodySmall!.copyWith(color: _publishedDateColor);

  static const TextTheme _textTheme = TextTheme(
    headlineSmall:
        TextStyle(fontWeight: _bold, fontSize: 14.0, color: _primaryColor),
    bodyMedium: TextStyle(fontWeight: _regular, fontSize: 14.0),
    bodySmall: TextStyle(
      fontWeight: _regular,
      fontSize: 12.0,
    ),
  );
}
