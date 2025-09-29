import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF2A5BB1),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD692FF),
  onPrimaryContainer: Color(0xFF001A43),
  secondary: Color(0xFF245FA6),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFF5DE3FF),
  onSecondaryContainer: Color(0xFF001B3C),
  tertiary: Color(0xFFAB3500),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFDBD0),
  onTertiaryContainer: Color(0xFF390C00),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  surface: Color(0xFFFBFBFF),
  onSurface: Color(0xFF1B1B1F),
  surfaceContainerHighest: Color(0xFF1E12EC),
  onSurfaceVariant: Color(0xFF44474F),
  outline: Color(0xFF757780),
  outlineVariant: Color(0xFFC5C6CD),
  inverseSurface: Color(0xFF303034),
  onInverseSurface: Color(0xFFF2F0F4),
  inversePrimary: Color(0xFFAAC6FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF2A5BB1),
  scrim: Color(0xFF000000),
);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _lightTheme() {
    return ThemeData(
      colorScheme: lightColorScheme,
      textTheme:  const TextTheme(
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(fontSize: 16)
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.surface,
        foregroundColor: lightColorScheme.onSurface,
        centerTitle: true,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
        elevation: 2,
        surfaceTintColor: lightColorScheme.surfaceTint
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Color Scheme (Light)',
      theme: _lightTheme(),
      home: const PaletteDemoPage(),
    );
  }
}

class PaletteDemoPage extends StatelessWidget {
  const PaletteDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
   
    return const Placeholder();
  }
}

class _SwatchData {
  final String label;
  final Color bg;
  final Color fg;

  _SwatchData(this.label, this.bg, this.fg);
}

class _Swatch extends StatelessWidget {

  final _SwatchData data;

  const _Swatch(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: data.bg, borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(12),
      child: Text(data.label, style: TextStyle(color: data.fg),),
    );
  }
}