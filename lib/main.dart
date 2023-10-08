
import 'package:api_all/PostApiScreen/post_image.dart';
import 'package:api_all/PostApiScreen/register_api.dart';
import 'package:api_all/Screen/fetch_image.dart';
import 'package:api_all/Screen/without_json.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ImageScreen(),
    );
  }
}
