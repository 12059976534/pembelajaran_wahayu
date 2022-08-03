import 'package:fecth2/future/present/provider/getlistpoke.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/config/flafovconfig.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Constants.setEnvironment(Environment.dev);
  // await initializeApp();
  List<SingleChildWidget> providersdata = [
    ChangeNotifierProvider<GetlistDatapoke>(create: (_) => GetlistDatapoke())
  ];

  _firetoken();
  runApp(
    MultiProvider(
      providers: providersdata,
      child: MyApp(),
    ),
    // MyApp()
  );
}

FirebaseMessaging _firebasemessaging = FirebaseMessaging.instance;
_firetoken() async {
  NotificationSettings setting = await _firebasemessaging.requestPermission(
      alert: true, badge: true, sound: true, provisional: true);
  if (setting.authorizationStatus == AuthorizationStatus.authorized) {
    _firebasemessaging.getToken().then((v) {
      print("firebase token :$v");
    });
  }
}
