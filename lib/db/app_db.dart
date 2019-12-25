import 'dart:math';

import 'package:bloc_test/models/counter.dart';

class AppDB {
  static Future<Counter> fetchRandomCounter() async {
    await Future.delayed(Duration(milliseconds: 500));
    return Counter(5000 + Random().nextInt(5000));
  }
}
