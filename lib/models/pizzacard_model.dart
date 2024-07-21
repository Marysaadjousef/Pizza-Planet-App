class ProductCard {
  int id;
  double? smallSizePrice;
  String name;
  String description;
  String image;
  String category;
  ProductCard(
      {required this.id,
      required this.category,
      required this.name,
      required this.description,
      required this.image,
      this.smallSizePrice});

  static ProductCard convertToObject(Map<String, dynamic> row, double price) {
    return ProductCard(
        category: row['category'],
        id: row['id'],
        name: row['name'],
        description: row['description'],
        image: row['image'],
        smallSizePrice: price);
  }
}
