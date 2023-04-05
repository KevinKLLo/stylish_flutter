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
            child: ListBody(
              children: [
                Container(
                  height: 450,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 450,
                  width: 320,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('UNIQLO 特級輕羽絨外套'),
                      Text('2023032101'),
                      SizedBox(height: 16),
                      Text('NT\$ 323'),
                      Divider(),
                      Row(
                        children: [
                          Text('顏色'),
                          VerticalDivider(),
                          Container(
                            width: 18,
                            height: 18,
                            color: Colors.red,
                          ),
                          SizedBox(width: 14),
                          Container(
                            width: 18,
                            height: 18,
                            color: Colors.blue,
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text('顏色'),
                          VerticalDivider(),
                          Container(
                            width: 18,
                            height: 18,
                            color: Colors.red,
                          ),
                          SizedBox(width: 14),
                          Container(
                            width: 18,
                            height: 18,
                            color: Colors.blue,
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text('顏色'),
                          VerticalDivider(),
                          Container(
                            width: 18,
                            height: 18,
                            color: Colors.red,
                          ),
                          SizedBox(width: 14),
                          Container(
                            width: 18,
                            height: 18,
                            color: Colors.blue,
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                          child: const Text('請選擇尺寸'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
