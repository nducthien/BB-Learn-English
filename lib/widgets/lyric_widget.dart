import 'package:bb_earn_english/models/lyric.dart';
import 'package:flutter/cupertino.dart';
import 'lyric_painter.dart';

class LyricWidget extends StatefulWidget {
  final List<Lyric> lyrics;
  final List<Lyric>? remarkLyrics;
  final Size size;
  final double? currentProgress;
  final TickerProvider? vsync;

  final TextStyle? lyricStyle;
  final TextStyle? remarkStyle;
  final TextStyle? currLyricStyle;
  final double lyricGap;
  final double remarkLyricGap;
  final double lyricMaxWidth;

  LyricWidget(
      {Key? key,
      required this.lyrics,
      this.remarkLyrics,
      required this.size,
      this.currentProgress,
      this.vsync,
      this.lyricStyle,
      this.remarkStyle,
      this.currLyricStyle,
      this.lyricGap: 10,
      this.remarkLyricGap: 20,
      double? lyricMaxWidth})
      : this.lyricMaxWidth = lyricMaxWidth ?? size.width;

  @override
  _LyricWidgetState createState() => _LyricWidgetState();
}

class _LyricWidgetState extends State<LyricWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LyricPainter(widget.lyrics,
          currDuration: widget.currentProgress,
          vsync: widget.vsync,
          remarkLyrics: widget.remarkLyrics,
          remarkStyle: widget.remarkStyle,
          currLyricStyle: widget.currLyricStyle,
          lyricGapValue: widget.lyricGap,
          lyricMaxWidth: widget.lyricMaxWidth,
          subLyricGapValue: widget.remarkLyricGap),
      size: widget.size,
    );
  }
}
