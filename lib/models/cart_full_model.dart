class PizzaCardFullData {
  int id;
  int pizzaSizeId;
  int orderId;
  String name;
  String description;
  String image;
  int quantity;
  String size;
  double price;
  String category;
  PizzaCardFullData(
      {required this.pizzaSizeId,
      required this.name,
      required this.category,
      required this.description,
      required this.image,
      required this.quantity,
      required this.price,
      required this.size,
      required this.orderId,
      required this.id});
}
