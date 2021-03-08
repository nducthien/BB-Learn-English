import 'package:bb_earn_english/models/photo.dart';
import 'package:bb_earn_english/untils/theme.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Photo photo;
  DetailPage(this.photo);

  nested() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Text("BB Learn English"),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings_input_component_outlined),
                onPressed: () {
                  showAlertDialog(context);
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
        ];
      },
      body: DarkLightTheme(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: nested(),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xFFFFFF),
              borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MaterialButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 12,
                    child: Material(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontFamily: 'helvetica_neue_light',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ),
                ),
                MaterialButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 12,
                    child: Material(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontFamily: 'helvetica_neue_light',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ),
                ),
                MaterialButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 12,
                    child: Material(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontFamily: 'helvetica_neue_light',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
