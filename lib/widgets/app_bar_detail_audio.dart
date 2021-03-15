import 'package:flutter/material.dart';

import '../untils/custom_dialog_box.dart';
import '../pages/detail_audio_page.dart';

class AppBarDetail extends StatefulWidget {
  AppBarDetail({
    Key key,
    bool showBottomBar,
    bool showAppbar,
  })  : showAppbar = showAppbar,
        super(key: key);

  final bool showAppbar;

  @override
  _AppBarDetailState createState() => _AppBarDetailState();
}

class _AppBarDetailState extends State<AppBarDetail> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: widget.showAppbar ? 56.0 : 0.0,
      duration: Duration(milliseconds: 200),
      child: AppBar(
        title: Text("BB Learn English"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings_input_component_outlined),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox(
                      title: "Custom Dialog Demo",
                      descriptions:
                          "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
                      text: "Yes",
                    );
                  });
            },
          ),
          IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: PopupMenuButton(
              onSelected: (newValue) {
                setState(() {
                  value = newValue;
                  if (value == 0) {
                    print("Click to: " + value.toString());
                  } else if (value == 1) {
                    print("Click to: " + value.toString());
                  } else if (value == 2) {
                    print("Click to: " + value.toString());
                  }
                });
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
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
                  value: 1,
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
                  value: 2,
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
    );
  }
}
