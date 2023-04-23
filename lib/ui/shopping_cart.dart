import 'package:flutter/material.dart';
import 'package:flutter_tappay/flutter_tappay.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final FlutterTappay payer = FlutterTappay();
  bool prepared = false;
  String _cardNumber = '';
  String _cardMonth = '';
  String _cardYear = '';
  String _cardCCV = '';
  bool _totalValid = true;
  bool _isCardNumberValid = true;
  bool _isCardCCVValid = true;
  bool _isCardYearValid = true;
  bool _isCardMonthValid = true;
  String _token = '';
  String _result = '付款結果';

  @override
  Widget build(BuildContext context) {
    payerInit();
    return Center(
      child: Column(
        children: [
          const Text('購物車'),
          TextButton(
            onPressed: tapPayer,
            child: const Text('點擊付款'),
          ),
          Text(_result),
        ],
      ),
    );
  }

  void payerInit() {
    payer
        .init(
            appKey:
                "app_whdEWBH8e8Lzy4N6BysVRRMILYORF6UxXbiOFsICkz0J9j1C0JUlCHv1tVJC",
            appId: 11334,
            serverType: FlutterTappayServerType.Sandbox)
        .then((_) {
      setState(() {
        prepared = true;
      });
    });
  }

  void tapPayer() async {
    payer
        .validate(
      cardNumber: _cardNumber,
      dueMonth: _cardMonth,
      dueYear: _cardYear,
      ccv: _cardCCV,
    )
        .then((validationResult) {
      bool cardValid = validationResult.isCardNumberValid;
      bool dateValid = validationResult.isExpiryDateValid;
      bool ccvValid = validationResult.isCCVValid;
      _totalValid = cardValid && ccvValid && dateValid;
      if (cardValid == true)
        _isCardNumberValid = true;
      else
        _isCardNumberValid = _cardNumber != "" ? false : true;
      if (ccvValid == true)
        _isCardCCVValid = true;
      else
        _isCardCCVValid = _cardCCV != "" ? false : true;
      if (dateValid == true) {
        _isCardYearValid = true;
        _isCardMonthValid = true;
      } else {
        _isCardYearValid = _cardYear != "" ? false : true;
        _isCardMonthValid = _cardMonth != "" ? false : true;
      }

      setState(() {});
    });

// get token
    try {
      TappayTokenResponse response = await payer.sendToken(
        cardNumber: _cardNumber,
        dueYear: _cardYear,
        dueMonth: _cardMonth,
        ccv: _cardCCV,
      );
      setState(() {
        _token = response.prime;
        _result = _token;
      });
    } catch (err) {
      setState(() {
        _result = "Payment error: ${err.toString()}";
      });
      // Scaffold.of(context).showSnackBar(
      //     SnackBar(
      //         content: Text("Payment error: ${err.toString()}")
      //     )
      // );
    }
  }
}
