import 'package:bb_earn_english/pages/setting_page.dart';
import 'package:bb_earn_english/pages/video_page.dart';
import 'package:bb_earn_english/services/network.dart';
import 'package:flutter/material.dart';

import 'audio_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final tabs = [
    Container(
      child: Center(
        child: AudioPage(),
      ),
    ),
    Container(
      child: Center(
        child: VideoPage(),
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
  void initState() {
    // TODO: implement initState
    getDataPhoto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BB Learn English'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: DataSearch(list: listPhotoSearch));
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

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    var searchPhoto =
        query.isEmpty ? list : list.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
        itemCount: searchPhoto.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.search),
            title: Text(searchPhoto[i]),
            onTap: () {
              query = searchPhoto[i];
              showResults(context);
            },
          );
        });
  }
}
