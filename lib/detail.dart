import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String item;

  const DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Image(
          image: AssetImage('assets/images/Image_Logo02.png'),
          fit: BoxFit.contain,
          height: 20,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 320,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 24, bottom: 24),
            child: Column(
              children: [
                Container(
                  height: 450,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                Container(
                  height: 450,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
