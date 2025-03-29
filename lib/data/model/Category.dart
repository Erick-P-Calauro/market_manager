class Category {
  const Category({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name};
  }
}
