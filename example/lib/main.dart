import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:app_activity_launcher/app_activity_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _app = AppActivityLauncher();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _openVibePlyr,
            child: const Text("Open VibePlyr"),
          ),
        ),
      ),
    );
  }

  _openVibePlyr() async {
    var res = await _app.openMarket(appId: "io.mediaon.vibeplyr");
    print(res);
  }
}
