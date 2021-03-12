import 'package:bb_earn_english/api/network.dart';
import 'package:bb_earn_english/widget/audio_page.dart';
import 'package:bb_earn_english/widget/detail_audio_page.dart';
import 'package:bb_earn_english/widget/setting_page.dart';
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
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Setting()));
              }),
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

class DataSearch extends SearchDelegate<String> {
  List<dynamic> list;
  DataSearch({this.list});

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: icon leading
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: result search
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: fetchPhotos(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data[index].title),
                    );
                  });
            } else if (snapshot.hasError) {
              return Container(
                child: Center(child: Text('Not Found Data')),
              );
            } else {
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
      ),
    );
  }
}
