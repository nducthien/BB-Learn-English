import 'package:bb_earn_english/models/photo.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Photo photo;

  DetailPage(this.photo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.title),
        actions: [
          Icon(Icons.settings_input_component_outlined),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.favorite),
          ),
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
