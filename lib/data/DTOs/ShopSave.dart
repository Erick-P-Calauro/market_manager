class ShopSave {
  const ShopSave(
    this.name,
    this.date
  );

  final String name;
  final DateTime date;

  Map<String, Object?> toMap() {
    return {
      'name': name,
      'date': date.microsecondsSinceEpoch
    };
  }
}