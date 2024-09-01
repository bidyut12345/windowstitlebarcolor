import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:windowstitlebarcolor/windowstitlebarcolor.dart';

void main() {
  runApp(const MyApp());
  Windowstitlebarcolor.setTitleBarColor(Colors.red);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Color bgColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              {"Name": "Red", "Color": Colors.red},
              {"Name": "Green", "Color": Colors.green},
              {"Name": "Blue", "Color": Colors.blue},
              {"Name": "Yellow", "Color": Colors.yellow},
              {"Name": "Indigo", "Color": Colors.indigo},
              {"Name": "Orange", "Color": Colors.orange},
              {"Name": "Black", "Color": Colors.black},
            ]
                .map((e) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          child: Text(e["Name"].toString()),
                          style: ElevatedButton.styleFrom(backgroundColor: e["Color"] as Color? ?? Colors.red),
                          onPressed: () {
                            Windowstitlebarcolor.setTitleBarColor(e["Color"] as Color? ?? Colors.red);
                            setState(() {
                              bgColor = e["Color"] as Color? ?? Colors.red;
                            });
                          },
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
