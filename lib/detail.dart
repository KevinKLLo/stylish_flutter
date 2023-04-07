import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String item;
  final List<String> content = [
    '實品顏色依照單品顏色為主',
    '棉 100%',
    '厚薄：薄',
    '彈性：無',
    '素材產地 / 日本',
    '加工產地 / 中國'
  ];

  DetailPage({
    super.key,
    required this.item,
  });

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 24, bottom: 24),
        child: Center(
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth < 660) {
              return MobileLayout(content: content);
            } else {
              return WebLayout(content: content);
            }
          }),
        ),
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({
    super.key,
    required this.content,
  });

  final List<String> content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: ListBody(
        children: [
          Container(
            height: 450,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          ProductInfo(content: content),
          const SizedBox(height: 16),
          const ProductDescription(),
        ],
      ),
    );
  }
}

class WebLayout extends StatelessWidget {
  const WebLayout({
    super.key,
    required this.content,
  });

  final List<String> content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 650,
      child: ListBody(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 320,
                height: 450,
                color: Colors.grey,
              ),
              const SizedBox(width: 10),
              ProductInfo(content: content),
            ],
          ),
          const SizedBox(height: 16),
          const ProductDescription(),
        ],
      ),
    );
  }
}

class GradientTextDivider extends StatelessWidget {
  const GradientTextDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.red, Colors.blue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(bounds),
            child: const Text(
              '細部說明',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Divider(
              thickness: 1.2,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.content,
  });

  final List<String> content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('UNIQLO 特級輕羽絨外套'),
          Text('2023032101'),
          SizedBox(height: 16),
          Text('NT\$ 323'),
          Divider(),
          SizedBox(
            height: 20,
            child: Row(
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
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 20,
            child: Row(
              children: const [
                Text('尺寸'),
                VerticalDivider(),
                SizeTag(sizeText: 'S'),
                SizedBox(width: 14),
                SizeTag(sizeText: 'M'),
                SizedBox(width: 14),
                SizeTag(sizeText: 'L'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 20,
            child: Row(
              children: [
                Text('數量'),
                VerticalDivider(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          debugPrint('--');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black12),
                        child: Icon(Icons.remove),
                      ),
                      SizedBox(width: 14),
                      Text('1'),
                      SizedBox(width: 14),
                      ElevatedButton(
                        onPressed: () {
                          debugPrint('++');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black12),
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                debugPrint('tap ElevatedButton');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
              ),
              child: const Text(
                '請選擇尺寸',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          ListBody(
            children: content
                .map(
                  (text) => Text(
                    text,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                    ),
                  ),
                )
                .toList(growable: false),
          )
        ],
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListBody(
      children: [
        const GradientTextDivider(),
        const Text(
            '細部說明細部說明細部說明細部說明細部說明細部說明細部說明細部說明細部說明細部說明細部說明細部說明細部說明細部說明細部說明細部說明細部說明細部說明細部說明細部說明細部說明'),
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 2 / 1,
          child: Container(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 2 / 1,
          child: Container(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 2 / 1,
          child: Container(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 2 / 1,
          child: Container(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class SizeTag extends StatelessWidget {
  const SizeTag({super.key, required this.sizeText});

  final String sizeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(21),
      ),
      height: 42,
      child: Center(
        child: Text(
          sizeText,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
