import 'package:flutter/material.dart';

class BottomDetail extends StatefulWidget {
  BottomDetail({
    Key key,
    bool showBottomBar,
  })  : showBottomBar = showBottomBar,
        super(key: key);

  final bool showBottomBar;

  @override
  _BottomDetailState createState() => _BottomDetailState();
}

class _BottomDetailState extends State<BottomDetail> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.red,
      height: widget.showBottomBar ? 110 : 0,
      duration: Duration(milliseconds: 200),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //slider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(Icons.skip_previous),
                            iconSize: 35.0,
                            color: Colors.white,
                            onPressed: null),
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          iconSize: 50.0,
                          color: Colors.white,
                        ),
                        IconButton(
                            icon: Icon(Icons.skip_next),
                            iconSize: 35.0,
                            color: Colors.white,
                            onPressed: null),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
