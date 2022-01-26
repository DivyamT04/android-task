import 'package:android_task/models/itemlist_change_notifier.dart';
import 'package:android_task/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create:(_) => ItemListChangeNotifier(),
    child: MaterialApp(
      home: LoginScreen(),
    ),
  ));
}