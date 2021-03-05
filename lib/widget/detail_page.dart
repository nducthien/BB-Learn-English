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
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.playlist_add, color: Colors.black45),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Text('Add to play list'),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.download_rounded, color: Colors.black45),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Text('Download'),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.share, color: Colors.black45),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Text('Share'),
                      ),
                    ],
                  ),
                )
              ],
              child: Icon(Icons.more_vert),
            ),
          )
        ],
      ),
      body: DarkLightTheme(),
    );
  }

  void _onSettingButtonPressed() {
    print("setting button clicked");
  }
}
