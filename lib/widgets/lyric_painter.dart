import 'package:bb_earn_english/models/lyric.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LyricPainter extends CustomPainter with ChangeNotifier {
  // Lyrics list
  List<Lyric> lyrics;

  // List of Translation
  List<Lyric>? subLyrics;

  // Lyrics brush array
  List<TextPainter> lyricTextPaints = [];

  // Transliteration lyrics brush array
  List<TextPainter> subLyricTextPaints = [];

  // canvasSize
  Size canvasSize = Size.zero;

  // Lyric maxWidth
  double? lyricMaxWidth;

  // Lyric Gap Value
  double? lyricGapValue;

  // subLyricGapValue
  double? subLyricGapValue;

  // totalHeight
  double totalHeight = 0;

  // Control lyrics sliding by offset
  static double? _offset = 0;

  set offset(value) {
    _offset = value;
    notifyListeners();
  }

  // Lyric position
  int currentLyricIndex = 0;

  // Old animation controller
  static AnimationController? _animationController;

  // Old previous line position
  static int? _oldCurrentLyricIndex;

  //因空行高度与非空行高度不一致，存一个非空行的位置，绘制时使用
  var notEmptyLyricIndex = 0;

  //Lyric position
  int notEmptySubLyricIndex = 0;

  //Lyric line height
  double _subLyricHeight = 0;

  //lyricTextStyle
  TextStyle lyricTextStyle;

  // Translation Lyrics Style
  TextStyle subLyricTextStyle;

  // Current lyrics style
  TextStyle currLyricTextStyle;

  LyricPainter(this.lyrics,
      {List<Lyric>? remarkLyrics,
      double? currDuration,
      TickerProvider? vsync,
      TextStyle? lyricStyle,
      TextStyle? remarkStyle,
      TextStyle? currLyricStyle,
      this.lyricGapValue,
      this.subLyricGapValue,
      this.lyricMaxWidth})
      : this.lyricTextStyle =
            lyricStyle ?? TextStyle(color: Colors.grey, fontSize: 13),
        this.subLyricTextStyle =
            remarkStyle ?? TextStyle(color: Colors.black, fontSize: 14),
        this.currLyricTextStyle =
            currLyricStyle ?? TextStyle(color: Colors.red, fontSize: 20),
        this.subLyrics = remarkLyrics {
    // Lyrics to brush - addAll add elements from another map
    lyricTextPaints.addAll(lyrics
        .map((l) => TextPainter(
              text: TextSpan(text: l.lyric, style: lyricTextStyle),
              textDirection: TextDirection.ltr),
        )
        .toList());

    // Transliteration Lyrics to Brush
    if (subLyrics != null && subLyrics!.isNotEmpty) {
      subLyricTextPaints.addAll(subLyrics!
          .map((l) => TextPainter(
              text: TextSpan(text: l.lyric, style: subLyricTextStyle),
              textDirection: TextDirection.ltr))
          .toList());
      //Because the height of the blank line is inconsistent with the height of the non-blank line, first save the position of a non-blank line
      notEmptySubLyricIndex = getNotEmptyLineHeight(subLyrics!);
      //Calculate the default lyrics height
      subLyricTextPaints[notEmptySubLyricIndex]
        ..layout(maxWidth: lyricMaxWidth!);
      _subLyricHeight = subLyricTextPaints[notEmptySubLyricIndex].height;
    }

    currentLyricIndex = findLyricIndexByDuration(currDuration ?? 0, lyrics);
    if (currentLyricIndex == 0 || vsync == null) {
      offset = -computeScrollY(currentLyricIndex);
    } else {
      animationScrollY(currentLyricIndex, vsync);
    }
  }

  /// Because the height of the blank line is inconsistent with the height of the non-blank line, get the position of the non-blank line
  int getNotEmptyLineHeight(List<Lyric> lyrics) =>
      lyrics.indexOf(lyrics.firstWhere((lyric) => lyric.lyric.trim().isNotEmpty,
          orElse: () => lyrics.first));

  animationScrollY(currentLyricIndex, TickerProvider tickerProvider) {
    if (currentLyricIndex != 0 && currentLyricIndex != _oldCurrentLyricIndex) {
      if (_animationController != null) {
        _animationController!.stop();
      }
      _animationController = AnimationController(
          vsync: tickerProvider, duration: Duration(milliseconds: 200))
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _animationController!.dispose();
            _animationController = null;
          }
        });
      // Calculate the offset of the previous line
      var previousRowOffset = computeScrollY(currentLyricIndex - 1);
      // Calculate the current row offset
      var currentRowOffset = computeScrollY(currentLyricIndex);
      // The start is the previous line, and the end point is the current line
      Animation animation =
          Tween<double>(begin: previousRowOffset, end: currentRowOffset)
              .animate(_animationController!);
      _animationController!.addListener(() {
        offset = -animation.value;
      });
      _animationController!.forward();
    }
    _oldCurrentLyricIndex = currentLyricIndex;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvasSize = size;

    //The Y coordinate of the initial lyrics is in the center
    lyricTextPaints[currentLyricIndex]
      //Set lyrics
      ..text = TextSpan(
          text: lyrics[currentLyricIndex].lyric, style: currLyricTextStyle)
      ..layout(maxWidth: lyricMaxWidth!);
    var currentLyricY = _offset! +
        size.height / 2 -
        lyricTextPaints[currentLyricIndex].height / 2;

    // Traverse the lyrics to draw
    for (int lyricIndex = 0; lyricIndex < lyrics.length; lyricIndex++) {
      var currentLyricTextPaint = lyricTextPaints[lyricIndex];

      var currentLyric = lyrics[lyricIndex];
      // Lyrics drawn only on the screen
      if (currentLyricY < size.height && currentLyricY > 0) {
        // Draw lyric
        currentLyricTextPaint
          // Set Lyric
          ..text = TextSpan(
              text: currentLyric.lyric,
              style: currentLyricIndex == lyricIndex
                  ? currLyricTextStyle
                  : lyricTextStyle)
          // Calculate text width and height
          ..layout(maxWidth: lyricMaxWidth!)
          // Draw offset = Horizontal center
          ..paint(
              canvas,
              Offset((size.width - currentLyricTextPaint.width) / 2,
                  currentLyricY));
      }
      currentLyricTextPaint..layout(maxWidth: lyricMaxWidth!);
      var currentLyricHeight = currentLyricTextPaint.height;
      //当前歌词结束后调整下次开始绘制歌词的y坐标 - After the current lyrics are over, adjust the y coordinate of the lyrics that will be drawn next time
      currentLyricY += currentLyricHeight + lyricGapValue!;
      //如果有翻译歌词时,寻找该行歌词以后的翻译歌词
      if (subLyrics != null) {
        List<Lyric> remarkLyrics = subLyrics!
            .where((subLyric) =>
                subLyric.startTime! >= currentLyric.startTime! &&
                subLyric.endTime! <= currentLyric.endTime!)
            .toList();
        remarkLyrics.forEach((remarkLyric) {
          // get index
          var subIndex = subLyrics!.indexOf(remarkLyric);

          // Lyrics drawn only on the screen
          if (currentLyricY < size.height && currentLyricY > 0) {
            subLyricTextPaints[subIndex] //Set lyrics
              ..text =
                  TextSpan(text: remarkLyric.lyric, style: subLyricTextStyle)
              // Calculate text width and height
              ..layout(maxWidth: lyricMaxWidth!)
              // Draw offset = Horizontal center
              ..paint(
                  canvas,
                  Offset((size.width - subLyricTextPaints[subIndex].width) / 2,
                      currentLyricY));
          }
          //当前歌词结束后调整下次开始绘制歌词的y坐标 - After the current lyrics are over, adjust the y coordinate of the lyrics that will be drawn next time
          currentLyricY += _subLyricHeight + subLyricGapValue!;
        });
      }
    }
  }

  @override
  bool shouldRepaint(LyricPainter oldDelegate) {
    //Redraw when the lyrics progress changes
    return oldDelegate.currentLyricIndex != currentLyricIndex;
  }

  // Get index of the lyrics according to the current duration
  int findLyricIndexByDuration(double curDuration, List<Lyric> lyrics) {
    for (int i = 0; i < lyrics.length; i++) {
      if (curDuration >= lyrics[i].startTime!.inMilliseconds &&
          curDuration <= lyrics[i].endTime!.inMilliseconds) {
        return i;
      }
    }
    return 0;
  }

  /// 计算传入行和第一行的偏移量 - Calculate the offset between the incoming line and the first line
  double computeScrollY(int curLine) {
    double totalHeight = 0;
    for (var i = 0; i < curLine; i++) {
      var currPaint = lyricTextPaints[i];
      currPaint.layout(maxWidth: lyricMaxWidth!);
      totalHeight += currPaint.height + lyricGapValue!;
    }
    if (subLyrics != null) {
      //增加 当前行之前的翻译歌词的偏移量
      var list = subLyrics!
          .where((subLyric) => subLyric.endTime! <= lyrics[curLine].endTime!)
          .toList();
      totalHeight += list.length * (subLyricGapValue! + _subLyricHeight);
    }
    return totalHeight;
  }
}
