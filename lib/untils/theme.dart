import 'package:flutter/material.dart';

class DarkLightTheme extends StatefulWidget {
  const DarkLightTheme({Key key}) : super(key: key);

  @override
  _DarkLightThemeState createState() => _DarkLightThemeState();
}

  bool _light = true;

class _DarkLightThemeState extends State<DarkLightTheme> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _light ? _lightTheme : _darkTheme,
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Switch(
                value: _light,
                onChanged: (state) {
                  setState(() {
                    _light = state;
                  });
                },
              ),
              Text("Hello I am here")
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData _darkTheme = ThemeData(
      accentColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: Colors.amber);

  ThemeData _lightTheme = ThemeData(
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.blue);
}
