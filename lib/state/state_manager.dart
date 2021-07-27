import 'package:bb_earn_english/database/category_provider.dart';

// ignore: deprecated_member_use
import 'package:flutter_riverpod/all.dart';

final

categoryListProvider =
    StateNotifierProvider((ref) => new CategoryList([]));
