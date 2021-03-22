import 'dart:async';

import 'package:bb_earn_english/untils/lyric_util.dart';
import 'package:flutter/material.dart';

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
  var songLyc = "[00:00.000] Ta đã ở bên nhau"
      "\n[00:00.226]Những năm tháng nhọc nhằn"
      "\n[00:00.680]You make me feel like..."
      "\n[00:03.570]I got everything"
      "\n[00:20.920]Dù mai có ra sao"
      "\n[00:22.360]Ta vẫn sẽ tự hào"
      "\n[00:23.520]Vì đã luôn bên nhau"
      "\n[00:25.100]We do everything"
      "\n[00:26.280]Đưa tay đây nào"
      "\n[00:28.560]Mãi bên nhau bạn nhớ"
      "\n[00:30.930]Bên ngoài thế giới trời cao đất dày, ở trong team có anh em chất đầy"
      "\n[00:33.420]Đưa tay đây nào."
      "\n[00:35.970]Mãi bên nhau bạn nhớ"
      "\n[00:38.210]Cùng mặc lên người chiếc áo bóng bẩy sau những ngày tháng trầy da tróc vẩy cùng nhau"
      "\n[00:40.300]Trôi đi, trôi đi, trôi đi trên dòng thời gian"
      "\n[00:45.100]Đã nuôi ta khôn lớn lên đôi khi không được bình an yeah yeah"
      "\n[00:50.200]Bạn ơi tôi sẽ mãi thật lòng"
      "\n[00:54.860]Sau mưa thì sẽ có cầu vồng"
      "\n[01:02.400]Tuổi trẻ thường háo thắng"
      "\n[01:07.340]Vẫn giữ màu áo trắng"
      "\n[01:12.870]Đôi khi ta bí lối cùng đường"
      "\n[01:15.420]Vẫn có homie luôn cùng đường"
      "\n[01:18.100]Đi qua ngày mưa ngày nắng"
      "\n[01:19.670]Ăn chung vị cay vị đắng"
      "\n[01:21.289]Từ mặt trời chuyển thành mặt trăng"
      "\n[01:32.960]Tấm lòng vẫn luôn ngay ngắn"
      "\n[01:37.830]Bụi phấn cùng với quả chò bay"
      "\n[01:42.850]Tan trường cùng những quyển truyện hay"
      "\n[01:47.800]Quấy phá giáo viên bắt đứng phạt"
      "\n[01:51.940]Nhưng bạn bè thì không bỏ một ai"
      "\n[01:56.720]Ta đã ở bên nhau"
      "\n[02:01.680]Những năm tháng nhọc nhằn"
      "\n[02:06.640]You make me feel like..."
      "\n[02:14.500]I got everything"
      "\n[02:19.000]Dù mai có ra sao"
      "\n[02:24.670]Ta vẫn sẽ tự hào"
      "\n[02:27.200]Vì đã luôn bên nhau"
      "\n[02:29.900]We do everything"
      "\n[02:31.420]Đưa tay đây nào"
      "\n[02:33.300]Mãi bên nhau bạn nhớ"
      "\n[02:47.200]Bên ngoài thế giới trời cao đất dày, ở trong team có anh em chất đầy"
      "\n[03:05.650]Đưa tay đây nào (yeah)"
      "\n[03:09.200]Mãi bên nhau bạn nhớ (ok)"
      "\n[03:15.960]Cùng mặc lên người chiếc áo bóng bẩy sau những ngày tháng trầy da tróc vẩy cùng nhau (what's up)"
      "\n[03:19.110]That's break boy, 2009"
      "\n[03:25.970]Tuổi thơ gắn bó, anh em Tiền Giang"
      "\n[03:30.690]Nhảy b-boy, chạy show đám cưới"
      "\n[03:36.400]Tập ngoài công viên, mặc đồ second hand"
      "\n[03:38.840]Khu lao động đó, những ngày bình yên lộng gió"
      "\n[03:41.520]Tiếng đồng lúa, phát ra từ giọng nó"
      "\n[03:43.200]Cám ơn, vì đã trân trọng nóて"
      "\n[03:44.829]Yeah, cùng ôm, một giấc mộng khó";

  Timer _countdownTimer;
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
