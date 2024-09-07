import 'dart:convert';

class CartCatalog {
  static List<Prod> products = [];

  static Prod getById({required String id}) =>
      products.firstWhere((element) => element.id == id);
  static void removeById({required String id}) =>
      products.removeWhere((element) => element.id == id);

  static num getTotalPrice() {
    return products.fold(0, (sum, item) => sum + item.price);
  }
}

class Prod {
  final String id;
  final String title;
  final num price;

  Prod({
    required this.id,
    required this.title,
    required this.price,
  });

  // Copy method for immutability
  Prod copyWith({
    String? id,
    String? title,
    num? price,
  }) {
    return Prod(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
    );
  }

  // Convert Prod object to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
    };
  }

  // Create Prod object from Map
  factory Prod.fromMap(Map<String, dynamic> map) {
    return Prod(
      id: map['id'] as String,
      title: map['title'] as String,
      price: map['price'] as num,
    );
  }

  // Convert Prod object to JSON string
  String toJson() => json.encode(toMap());

  // Create Prod object from JSON string
  factory Prod.fromJson(String source) =>
      Prod.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Prod(id: $id, title: $title, price: $price)';

  // Equality check for comparison between objects
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Prod &&
        other.id == id &&
        other.title == title &&
        other.price == price;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ price.hashCode;
}
