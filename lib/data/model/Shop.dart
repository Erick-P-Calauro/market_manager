class Shop {
  const Shop({
    required this.id,
    required this.description,
    this.date,
  });

  final int id;
  final String description;
  final DateTime? date;
}
