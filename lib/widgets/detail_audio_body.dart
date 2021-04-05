import 'dart:async';

import 'package:bb_earn_english/untils/lyric_util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'lyric_widget.dart';

class Content extends StatefulWidget {
  const Content({Key key, ScrollController scrollViewController})
      : scrollViewController = scrollViewController,
        super(key: key);

  final ScrollController scrollViewController;

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

  Timer _countdownTimer;
  int _countdownNum = 1000000;
  Duration start = new Duration(seconds: 0);

  Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }

  Future<int> getAudio() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    final int positionAudio = myPrefs.getInt('POSITION_AUDIO');
    print("NOTHING_GONE_FOR_YOU: ---------" + positionAudio.toString());
    return positionAudio;
  }

  @override
  void initState() {
    if (_countdownTimer != null) {
      return;
    }

    getAudio();
    _countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        _countdownNum--;
        start = start + new Duration(seconds: 1);
        if (_countdownNum == 0) {
          _countdownTimer.cancel();
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
