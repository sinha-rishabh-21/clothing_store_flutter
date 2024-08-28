import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/models/catalog.dart';

class FetchData {
  final String url;
  FetchData({required this.url});

  loadData() async {
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    Catalog.items =
        List.from(decodedData).map<Item>((item) => Item.fromMap(item)).toList();
  }
}
