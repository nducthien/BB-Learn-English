import 'package:flutter/material.dart';

class DartLightTheme extends StatefulWidget {
  const DartLightTheme({Key key}) : super(key: key);

  @override
  _DartLightThemeState createState() => _DartLightThemeState();
}

class _DartLightThemeState extends State<DartLightTheme> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  ThemeData _darkTheme = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber
  );

  ThemeData _lightTheme = ThemeData(
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.blue
  );
}
