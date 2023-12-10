import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imageUrl = 'https://picsum.photos/400/200';

  Uint8List? imageData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      setState(() {
        imageData = response.bodyBytes;
      });
    } else {
      throw Exception('Failed to load image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TRY LANG PO'),
      ),
      body: Center(
        child: imageData != null
            ? Image.memory(imageData!)
            : CircularProgressIndicator(),
      ),
    );
  }
}
