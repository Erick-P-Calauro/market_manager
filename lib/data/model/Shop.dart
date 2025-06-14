class Shop {
  const Shop({
    required this.id,
    this.description,
    required this.date,
  });

  final int id;
  final String? description;
  final DateTime date;
}
