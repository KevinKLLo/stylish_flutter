class Product {
  final int id;
  // final String category;
  final String title;
  // final String description;
  final int price;
  // final String texture;
  // final String wash;
  // final String place;
  // final String note;
  // final String story;
  // final List<Color> colors;
  // final List<String> sizes;
  // final List<Variant> variants;
  // final String mainImage;
  // final List<String> images;

  Product({
    required this.id,
    // required this.category,
    required this.title,
    // required this.description,
    required this.price,
    // required this.texture,
    // required this.wash,
    // required this.place,
    // required this.note,
    // required this.story,
    // required this.colors,
    // required this.sizes,
    // required this.variants,
    // required this.mainImage,
    // required this.images,
  });
}

class Color {
  final String code;
  final String name;

  Color({required this.code, required this.name});
}

class Variant {
  final String colorCode;
  final String size;
  final int stock;

  Variant({required this.colorCode, required this.size, required this.stock});
}

class ProductList {
  final List<Product> data;
  final int nextPaging;

  ProductList({required this.data, required this.nextPaging});
}
