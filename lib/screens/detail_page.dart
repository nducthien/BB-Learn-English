import 'package:bb_earn_english/models/photo.dart';
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(photo.title),
              Text(photo.thumbnailUrl),
              Switch(
                value: _light,
                onChanged: (state) {
                  setState() {
                    _light = state;
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSettingButtonPressed() {
    print("setting button clicked");
  }
}
