class AudioContent {
  String lyrics;
  double fromTime;
  double toTime;

  AudioContent({this.lyrics, this.fromTime, this.toTime});
}

List<AudioContent> audioContent = [
  AudioContent(
      lyrics: 'Ta đã ở bên nhau',
      fromTime: 00.04,
      toTime: 00.06
  ),
  AudioContent(
      lyrics: 'Những năm tháng nhọc nhằn',
      fromTime: 00.06,
      toTime: 00.08
  ),
  AudioContent(
      lyrics: 'You make me feel like...',
      fromTime: 00.08,
      toTime: 00.10
  ),
];
