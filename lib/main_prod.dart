import 'package:flutter/material.dart';

import 'core/config/flafovconfig.dart';
import 'main.dart';

void main() async {
  Constants.setEnvironment(Environment.prod);
  // await initializeApp();
  runApp(MyApp());
}
