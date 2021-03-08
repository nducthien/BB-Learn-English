import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DarkLightTheme extends StatefulWidget {
  const DarkLightTheme({Key key}) : super(key: key);

  @override
  _DarkLightThemeState createState() => _DarkLightThemeState();
}

bool _light = true;

class _DarkLightThemeState extends State<DarkLightTheme> {
  bool playing = false; // at the beginning, not playing any song
  IconData btnPlay = Icons.play_arrow; // the main state of the play button

  AudioPlayer _audioPlayer;
  AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  // Create custom slider

  Widget slider() {
    return Slider(
        activeColor: Colors.black,
        inactiveColor: Colors.grey,
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (value) {
          seekToSec(value.toInt());
        });
  }

  void seekToSec(int value) {
    Duration newPos = Duration(seconds: value);
    _audioPlayer.seek(newPos);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _audioPlayer = AudioPlayer();
    cache = AudioCache(fixedPlayer: _audioPlayer);

    // handle audio time
    _audioPlayer.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    _audioPlayer.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };

    cache.load("tbdk.mp3");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _light ? _lightTheme : _darkTheme,
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Switch(
                value: _light,
                onChanged: (state) {
                  setState(() {
                    _light = state;
                  });
                },
              ),
              Text("Hello I am here"),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
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
                            color: Colors.black,
                            onPressed: null),
                        IconButton(
                            icon: Icon(btnPlay),
                            iconSize: 50.0,
                            color: Colors.black,
                            onPressed: () {
                              if (!playing) {
                                cache.play("tbdk.mp3");
                                setState(() {
                                  btnPlay = Icons.pause;
                                  playing = true;
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
                            color: Colors.black,
                            onPressed: null),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData _darkTheme = ThemeData(
      accentColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: Colors.amber);

  ThemeData _lightTheme = ThemeData(
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.blue);
}
