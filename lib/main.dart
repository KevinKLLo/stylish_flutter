import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_flutter/Cubit/product_list_cubit.dart';
import 'package:stylish_flutter/ui/item_card.dart';
import 'package:stylish_flutter/ui/shopping_cart.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductListCubit()),
      ],
      child: const MaterialApp(home: MainApp()),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    fetchProductList(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Image(
          image: AssetImage('assets/images/Image_Logo02.png'),
          fit: BoxFit.contain,
          height: 20,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const ShoppingCart()),
              // );
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ShoppingCart()));
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Column(
        children: [
          const HorizontalListView(),
          Expanded(
            child: BlocBuilder<ProductListCubit, ProductListState>(
              builder: (context, state) {
                if (state is ProductListLoading) {
                  return const Center(child: Text('載入中'));
                }
                if (state is ProductListSuccess) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return const HeaderCard();
                      } else {
                        var product = state.productList[index];
                        return ItemCard(product);
                      }
                    },
                  );
                }
                return const Text('出現非預期錯誤');
              },
            ),
          ),
        ],
      ),
    );
  }

  void fetchProductList(BuildContext context) {
    context.read<ProductListCubit>().fetchProductList();
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
