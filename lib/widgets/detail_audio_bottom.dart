import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bb_earn_english/models/audio.dart';
import 'package:bb_earn_english/widgets/detail_audio_body.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

bool _light = true;

class _BottomDetailState extends State<BottomDetail> {
  bool playing = false; // at the beginning, not playing any song
  IconData btnPlay = Icons.play_arrow; // the main state of the play button

  AudioPlayer _audioPlayer;
  AudioCache cache;
  Audio audio;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  Widget slider() {
    return Slider(
        activeColor: Color(0xFFB0BCC6),
        inactiveColor: Color(0xFFE0F0F4),
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (value) {
          seekToSec(value.toInt());
          print("Value seekToSec: ------ : " + value.toString());
        });
  }

  void seekToSec(int value) {
    Duration newPos = Duration(seconds: value);
    _audioPlayer.seek(newPos);
  }

  void savePosition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('POSITION_AUDIO', position.inSeconds);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _audioPlayer = AudioPlayer();
    cache = AudioCache(fixedPlayer: _audioPlayer);

    // handle audio time
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        musicLength = duration;
        print("musicLength: ------ : " + musicLength.toString());
      });
    });

    _audioPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        position = p;
        audio = Audio(position: position);
        savePosition();
        print("position: ------ : " + position.toString());
        print("position audio: ------ : " + audio.toString());
      });
    });

    cache.load("tbdk.mp3");
  }

  @override
  void dispose() {
    super.dispose();

    _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.blueAccent,
      height: widget.showBottomBar ? 114 : 0,
      duration: Duration(milliseconds: 200),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                slider(),
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
                        icon: Icon(btnPlay),
                        iconSize: 50.0,
                        color: Colors.white,
                        onPressed: () {
                          if (!playing) {
                            cache.play("tbdk.mp3");
                            setState(() {
                              btnPlay = Icons.pause;
                              playing = true;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Content(
                                      audio: audio,
                                    )),
                              );
                            });
                          } else {
                            _audioPlayer.pause();
                            setState(() {
                              btnPlay = Icons.play_arrow;
                              playing = false;
                            });
                          }
                        }),
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
