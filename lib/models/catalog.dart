// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Catalog {
  // static List<Item> items = [];

  // static Item getById({required String id}) =>
  //     items.firstWhere((element) => element.id == id);
  List<Item> items = [];

  Item getById({required String id}) =>
      items.firstWhere((element) => element.id == id);
}

class Item {
  final String id;
  final String title;
  final num price;
  final String desc;
  final String image;

  Item(
    this.id,
    this.title,
    this.price,
    this.desc,
    this.image,
  );

  Item copyWith({
    String? id,
    String? title,
    num? price,
    String? desc,
    String? image,
  }) {
    return Item(
      id ?? this.id,
      title ?? this.title,
      price ?? this.price,
      desc ?? this.desc,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'desc': desc,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['_id'] as String,
      map['title'] as String,
      map['price'] as num,
      map['desc'] as String,
      map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, title: $title, price: $price, desc: $desc, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.price == price &&
        other.desc == desc &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        desc.hashCode ^
        image.hashCode;
  }
}
