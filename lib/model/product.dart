class Product {
  final int id;
  final String title;
  final String imgPath;

  Product({this.id, this.title, this.imgPath});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['ProDetailID'] as int,
      title: json['ProductTitle'] as String,
     imgPath : json['imgPathSmall1'] as String);

  @override
  String toString() {
    return 'Product: ID = $id \nTitle = $title \nImage Path = $imgPath';
  }
}

class ProductList {
  final List<Product> products;
  ProductList({this.products});
  factory ProductList.fromJson(List<dynamic> parsedJson) {
    List<Product> list = new List<Product>();
    list = parsedJson.map((i) => Product.fromJson(i)).toList();

    return new ProductList(
      products: list,
    );
  }
}
