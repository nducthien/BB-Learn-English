import 'dart:io';

import 'package:bb_earn_english/const/const.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> copyDB() async {
  var dbPath = await getDatabasesPath();
  var path = join(dbPath, db_name_test);

  var exists = await databaseExists(path);
  print("Exists is: ----------" + exists.toString());
  if (!exists) {
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // copy from assets
    ByteData data = await rootBundle.load(join("assets/db", db_name_test));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes, flush: true);
  } else {
    print("Db already exits");
  }

  return await openDatabase(path, readOnly: true);
}
