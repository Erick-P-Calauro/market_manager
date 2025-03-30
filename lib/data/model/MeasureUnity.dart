class MeasureUnity {
  const MeasureUnity({
    required this.id,
    required this.name,
    required this.abbreviation,
  });

  final int? id;
  final String name;
  final String abbreviation;

  Map<String, Object?> toMap() {
    return {"name": name, "abbreviation": abbreviation};
  }
}
