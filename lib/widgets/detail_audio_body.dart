import 'dart:async';

import 'package:bb_earn_english/untils/lyric_util.dart';
import 'package:flutter/material.dart';

import 'lyric_widget.dart';

class Content extends StatefulWidget {
  const Content({Key? key, ScrollController? scrollViewController})
      : scrollViewController = scrollViewController,
        super(key: key);

  final ScrollController? scrollViewController;

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> with TickerProviderStateMixin {
  var songLyc = "[00:17.29]Con cò bé bé"
      "[00:19.79]Nó đậu cành tre"
      "[00:21.79]Đi không hỏi mẹ"
      "[00:23.55]Biết đi đường nào"
      "[00:25.55]Khi đi em hỏi"
      "[00:27.04]Khi về em chào"
      "[00:28.80]Miệng em chúm chím"
      "[00:30.53]Mẹ có yêu không nào.";

  Timer? _countdownTimer;
  int _countdownNum = 1000000;
  Duration start = new Duration(seconds: 0);

  @override
  void initState() {
    if (_countdownTimer != null) {
      return;
    }
    _countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        _countdownNum--;
        start = start + new Duration(seconds: 1);
        if (_countdownNum == 0) {
          _countdownTimer!.cancel();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lyrics = LyricUtil.formatLyric(songLyc);
    return Expanded(
        child: SingleChildScrollView(
      controller: widget.scrollViewController,
      child: Center(
          child: LyricWidget(
        size: Size(300, 300),
        lyrics: lyrics,
        vsync: this,
        currentProgress: start.inMilliseconds.toDouble(),
      )),
    ));
  }
}
