class Shop {
  Shop({
    required this.id,
    required this.name,
    required this.date,
  });

  Shop.cadastro(
    this.name,
    this.date
  );

  int? id;
  final String name;
  final DateTime date;

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date
    };
  }
}
