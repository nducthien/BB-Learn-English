import 'package:bb_earn_english/models/audio.dart';
import 'package:bb_earn_english/models/photo.dart';
import 'package:bb_earn_english/widgets/detail_audio_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/detail_audio_app_bar.dart';
import '../widgets/detail_audio_bottom.dart';

class DetailPage extends StatefulWidget {
  final Photo photo;

  DetailPage(this.photo);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // title: 'Flutter Demo',
      // theme: ThemeData(),
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.audio}) : super(key: key);
  final Audio audio;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;
  bool _showBottomBar = true;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(_calScroll);
  }

  void _calScroll() {
    if (_scrollViewController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!isScrollingDown) {
        isScrollingDown = true;
        _showAppbar = false;
        _showBottomBar = false;
        setState(() {});
      }
    }

    if (_scrollViewController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (isScrollingDown) {
        isScrollingDown = false;
        _showAppbar = true;
        _showBottomBar = true;
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    _scrollViewController.removeListener(_calScroll);
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AppBarDetail(showAppbar: _showAppbar),
            Content(scrollViewController: _scrollViewController, audio: widget.audio),
            BottomDetail(showBottomBar: _showBottomBar)
          ],
        ),
      ),
    );
  }
}
