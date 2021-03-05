import 'package:bb_earn_english/models/photo.dart';
import 'package:bb_earn_english/untils/theme.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Photo photo;
  bool _light = true;

  DetailPage(this.photo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings_input_component_outlined),
            onPressed: () {
              _onSettingButtonPressed();
            },
          ),
          IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
        ],
      ),
      body: DarkLightTheme(),
    );
  }

  void _onSettingButtonPressed() {
    print("setting button clicked");
  }
}
