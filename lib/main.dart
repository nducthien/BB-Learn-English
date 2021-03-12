import 'package:bb_earn_english/widget/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final tabs = [
    Container(
      child: Center(
        child: HomePage(),
      ),
    ),
    Container(
      child: Center(
        child: Text(
          'Videos',
          style: TextStyle(fontSize: 30),
        ),
      ),
    ),
    Container(
      child: Center(
        child: Text(
          'Programs',
          style: TextStyle(fontSize: 30),
        ),
      ),
    ),
    Container(
      child: Center(
        child: Text(
          'Playlist',
          style: TextStyle(fontSize: 30),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BB Learn English'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.audiotrack), title: Text("Audio")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ondemand_video), title: Text("Videos")),
          BottomNavigationBarItem(
              icon: Icon(Icons.featured_play_list_rounded),
              title: Text("Programs")),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_sharp), title: Text("Playlist"))
        ],
      ),
    );
  }
}
