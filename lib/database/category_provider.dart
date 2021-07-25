import 'package:bb_earn_english/const/const.dart';
import 'package:sqflite/sqflite.dart';

class Category {
  int id;
  String thumbUrl;
  String title;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnCategoryId: id,
      columnCategoryThumbUrl: thumbUrl,
      columnCategoryTitle: title
    };
    return map;
  }

  Category({this.id, this.thumbUrl, this.title});

  Category.fromMap(Map<String, dynamic> map) {
    id = map[columnCategoryId];
    thumbUrl = map[columnCategoryThumbUrl];
    title = map[columnCategoryTitle];
  }
}

class CategoryProvider {
  Future<Category> getCategoryById(Database database, int id) async {
    var maps = await database.query(tableCategoryName,
        columns: [
          columnCategoryId,
          columnCategoryThumbUrl,
          columnCategoryTitle
        ],
        where: '$columnCategoryId=?',
        whereArgs: [id]);
    if (maps.length > 0) return Category.fromMap(maps.first);
    return null;
  }

  Future<List<Category>> getCategories(Database database) async {
    var maps = await database.query(tableCategoryName, columns: [
      columnCategoryId,
      columnCategoryThumbUrl,
      columnCategoryTitle
    ]);
    if (maps.length > 0) return maps.map((e) => Category.fromMap(e)).toList();
    return null;
  }
}
