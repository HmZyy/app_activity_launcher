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
    var res = await _app.openActivity(
        appId: "io.mediaon.vibeplyr",
        activity: "PlayerActivity",
        extras: {
          "url":
              "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_1MB.mp4"
        });
    print(res);
  }
}
