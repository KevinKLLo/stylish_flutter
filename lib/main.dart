import 'package:flutter/material.dart';
import 'package:stylish_flutter/detail.dart';

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
            ),
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
    return const Center(
      child: Text(
        '女裝',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
      margin: const EdgeInsets.all(10), // 加上 margin 以設置元素間距
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
        // color: Colors.blueGrey,
      ),
      child: Center(
        child: SizedBox(
          height: 120,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(item: 'itemList[index]'),
                ),
              );
            },
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Image.asset(
                    'assets/images/Image_Logo02.png',
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('UNIQLO 特級輕羽絨外套'),
                    Text('NT\$ 323'),
                  ],
                ),
              ],
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
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 300, // 指定固定寬度
            margin: const EdgeInsets.all(10), // 加上 margin 以設置元素間距
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
            child: Center(
              child: Image.asset('assets/images/Image_Logo02.png'),
            ),
          );
        },
      ),
    );
  }
}
