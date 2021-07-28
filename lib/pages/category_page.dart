import 'package:auto_size_text/auto_size_text.dart';
import 'package:bb_earn_english/database/category_provider.dart';
import 'package:bb_earn_english/database/category_test_provider.dart';
import 'package:bb_earn_english/database/db_helper.dart';
import 'package:bb_earn_english/state/state_manager.dart';
import 'package:flutter/material.dart';
// ignore: deprecated_member_use
import 'package:flutter_riverpod/all.dart';


class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<CategoryTest>>(
        future: getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            // if snapshot hasData, that mean categories load success
            CategoryTest categoryTest = new CategoryTest();
            categoryTest.id = -1;
            categoryTest.name = "Exam";
            snapshot.data.add(categoryTest);
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(4.0),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: snapshot.data.map((categoryTest) {
                return GestureDetector(
                  child: Card(
                    elevation: 2,
                    color: categoryTest.id == -1 ? Colors.green : Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: AutoSizeText(
                            '${categoryTest.name}',
                            style: TextStyle(
                                color: categoryTest.id == -1
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<CategoryTest>>  getCategories() async {
    var db = await copyDB();
    var result = await CategoryTestProvider().getCategories(db);
    //context.read(categoryListProvider).state = result;
    return result;
  }
}
