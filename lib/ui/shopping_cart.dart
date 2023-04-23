import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  static const platform = MethodChannel('stylish_flutter/shoppingCart');
  String _status = '預設狀態';

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
        child: Column(
          children: [
            const Text('購物車'),
            ElevatedButton(
              onPressed: _tapPurchase,
              child: Text(_status),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _tapPurchase() async {
    final String result =
        await platform.invokeMethod('tapPurchase', {'from': 'Flutter'});

    setState(() {
      _status = '購買結果：$result';
    });
  }
}
