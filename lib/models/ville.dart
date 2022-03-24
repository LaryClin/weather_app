final String tableVilles = 'Villes';

class VilleFields {
  static final List<String> values = [id, name];

  static const String id = '_id';
  static const String name = 'title';
}

class Ville {
  final int? id;
  final String name;

  const Ville({
    this.id,
    required this.name,
  });

  Ville copy({
    int? id,
    String? name
  }) =>
      Ville(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  static Ville fromJson(Map<String, Object?> json) => Ville(
    id: json[VilleFields.id] as int?,
    name: json[VilleFields.name] as String
  );

  Map<String, Object?> toJson() => {
    VilleFields.id: id,
    VilleFields.name: name,
  };
}