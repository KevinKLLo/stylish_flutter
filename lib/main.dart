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
          ),
        ),
        body: Column(
          children: [
            const HorizontalListView(),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return const HeaderCard();
                  } else {
                    return const ItemCard();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 40,
      child: Center(
        child: Text(
          '女裝',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // 指定固定寬度
      margin: const EdgeInsets.all(10), // 加上 margin 以設置元素間距
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueGrey,
      ),
      child: const Center(
        child: SizedBox(
          height: 150,
          child: Center(
            child: Text(
              'ItemCard',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 200, // 指定固定寬度
            margin: const EdgeInsets.all(10), // 加上 margin 以設置元素間距
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blueGrey,
            ),
            child: Center(
              child: Text(
                'Item $index',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
