class City {
  final String name;

  City({required this.name});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(name: map['name']);
  }

  @override
  String toString() {
    return 'City{name: $name}';
  }
}
