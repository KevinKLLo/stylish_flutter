import 'package:flutter/material.dart';
import 'package:stylish_flutter/ui/detail.dart';
import 'package:stylish_flutter/Model/product.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(this.product, {super.key});

  final Product product;

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
                  children: [
                    Text(product.title),
                    Text('NT\$ ${product.price.toString()}'),
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
