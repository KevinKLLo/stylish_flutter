import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: const Image(
            image: AssetImage('assets/images/Image_Logo02.png'),
            fit: BoxFit.contain,
            height: 20,
          )
        ),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
