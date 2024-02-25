class PizzaCard {
  int id;
  String name;
  String description;
  String image;

  PizzaCard(
      {required this.id,
      required this.name,
      required this.description,
      required this.image});

  static PizzaCard convertToObject(Map<String, dynamic> row) {
    return PizzaCard(
        id: row['id'],
        name: row['name'],
        description: row['description'],
        image: row['image']);
  }
}
