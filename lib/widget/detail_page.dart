import 'package:bb_earn_english/models/photo.dart';
import 'package:bb_earn_english/untils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'bottom_detail.dart';

class DetailPage extends StatelessWidget {
  final Photo photo;

  DetailPage(this.photo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // title: 'Flutter Demo',
      // theme: ThemeData(),
      body: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

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
            ActionBar(showAppbar: _showAppbar),
            Content(scrollViewController: _scrollViewController),
            BottomDetail(showBottomBar: _showBottomBar)
          ],
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
    bool showBottomBar,
  })  : _showBottomBar = showBottomBar,
        super(key: key);

  final bool _showBottomBar;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.red,
      height: _showBottomBar ? 110.0 : 0.0,
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

class ActionBar extends StatelessWidget {
  const ActionBar({
    Key key,
    bool showBottomBar,
    bool showAppbar,
  })  : _showAppbar = showAppbar,
        super(key: key);

  final bool _showAppbar;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: _showAppbar ? 56.0 : 0.0,
      duration: Duration(milliseconds: 200),
      child: AppBar(
        title: Text("BB Learn English"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings_input_component_outlined),
            onPressed: () {
              showAlertDialog(context);
            },
          ),
          IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.playlist_add, color: Colors.black45),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Text('Add to play list'),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.download_rounded, color: Colors.black45),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Text('Download'),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.share, color: Colors.black45),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Text('Share'),
                      ),
                    ],
                  ),
                )
              ],
              child: Icon(Icons.more_vert),
            ),
          )
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key key, ScrollController scrollViewController})
      : _scrollViewController = scrollViewController,
        super(key: key);

  final ScrollController _scrollViewController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: _scrollViewController,
        child: Column(
          children: <Widget>[
            Text('Ta đã ở bên nhau'),
            Text('Những năm tháng nhọc nhằn'),
            Text('You make me feel like...'),
            Text('I got everything'),
            Text('Dù mai có ra sao'),
            Text('Ta vẫn sẽ tự hào'),
            Text('Vì đã luôn bên nhau'),
            Text('We do everything'),
            Text('Đưa tay đây nào'),
            Text('Mãi bên nhau bạn nhớ'),
            Text(
                'Bên ngoài thế giới trời cao đất dày, ở trong team có anh em chất đầy'),
            Text('Đưa tay đây nào'),
            Text('Mãi bên nhau bạn nhớ'),
            Text(
                'Cùng mặc lên người chiếc áo bóng bẩy sau những ngày tháng trầy da tróc vẩy cùng nhau'),
            Text('Trôi đi, trôi đi, trôi đi trên dòng thời gian'),
            Text(
                'Đã nuôi ta khôn lớn lên đôi khi không được bình an yeah yeah'),
            Text('Bạn ơi tôi sẽ mãi thật lòng'),
            Text('Sau mưa thì sẽ có cầu vồng'),
            Text('Tuổi trẻ thường háo thắng'),
            Text('Vẫn giữ màu áo trắng'),
            Text('Đôi khi ta bí lối cùng đường'),
            Text('Vẫn có homie luôn cùng đường'),
            Text('Đi qua ngày mưa ngày nắng'),
            Text('Từ mặt trời chuyển thành mặt trăng'),
            Text('Tấm lòng vẫn luôn ngay ngắn'),
            Text('Bụi phấn cùng với quả chò bay'),
            Text('Tan trường cùng những quyển truyện hay'),
            Text('Quấy phá giáo viên bắt đứng phạt'),
            Text('Nhưng bạn bè thì không bỏ một ai'),
            Text('Ta đã ở bên nhau'),
            Text('Những năm tháng nhọc nhằn'),
            Text('You make me feel like...'),
            Text('I got everything'),
            Text('Dù mai có ra sao'),
            Text('Ta vẫn sẽ tự hào'),
            Text('Vì đã luôn bên nhau'),
            Text('We do everything'),
            Text('Đưa tay đây nào'),
            Text('Mãi bên nhau bạn nhớ'),
            Text(
                'Bên ngoài thế giới trời cao đất dày, ở trong team có anh em chất đầy'),
            Text('Đưa tay đây nào'),
            Text('Mãi bên nhau bạn nhớ'),
            Text(
                'Cùng mặc lên người chiếc áo bóng bẩy sau những ngày tháng trầy da tróc vẩy cùng nhau'),
            Text('Thats break boy, 2009'),
            Text('Tuổi thơ gắn bó, anh em Tiền Giang'),
            Text('Nhảy b-boy, chạy show đám cưới'),
            Text('Tập ngoài công viên, mặc đồ second hand'),
            Text('Khu lao động đó, những ngày bình yên lộng gió'),
            Text('Tiếng đồng lúa, phát ra từ giọng nó'),
            Text('Cám ơn, vì đã trân trọng nó'),
            Text('Yeah, cùng ôm, một giấc mộng khó'),
            Text('Yeah'),
            Text('Và míc cầm cứng tay'),
            Text('Like a Travis Scott, ước gì mày đứng đây'),
            Text('Cùng tận hưởng khoảnh khắc này, nà ní'),
            Text('Chưa dịp tái ngộ, còn nhớ là quý'),
            Text('OTD for life, những đứa con xứ ruộng thẳng cánh cò bay'),
            Text('Vượt cùng ải khó trò hay'),
            Text('Chung tay bẻ lái hướng đò ngay'),
            Text('Ey'),
            Text('Câu từ này là bạn hiền'),
            Text('Là đồng minh ở bên cạnh dù cạn tiền'),
            Text('Là lòng tin cho tâm hồn mình lên tiếng'),
            Text('Nên hiến vì đam mê không nên tiếc'),
            Text('Nên viết, trước khi thời gian dập tắt ý chí'),
            Text('Nhìn lại thanh xuân bằng cặp mắt quyến luyến'),
            Text('Cái đập tay không phân biệt chiến tuyến'),
            Text('Ta luôn biết nhận sai, và lắng nghe lời chí lý'),
            Text('I know we wont stop'),
            Text('I know we wont...'),
            Text('Vì chúng ta sinh ra là để bước đi mà'),
            Text('I know we cant stop'),
            Text('I know we cant'),
            Text('Let it be'),
            Text('Ta đã ở bên nhau'),
            Text('Những năm tháng nhọc nhằn'),
            Text('You make me feel like...'),
            Text('I got everything'),
            Text('Dù mai có ra sao'),
            Text('Ta vẫn sẽ tự hào'),
            Text('Vì đã luôn bên nhau'),
            Text('We do everything'),
          ],
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: MediaQuery.of(context).size.width / 1.3,
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: const Color(0xFFFFFF),
            borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
          ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MaterialButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 12,
                  child: Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'helvetica_neue_light',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 12,
                  child: Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'helvetica_neue_light',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 12,
                  child: Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontFamily: 'helvetica_neue_light',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
