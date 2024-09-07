import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/core/store.dart';
import 'package:shopping_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class FetchData {
  final String url;
  FetchData({required this.url});

  loadData() async {
    final MyStore store = VxState.store as MyStore;
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    store.catalog.items =
        List.from(decodedData).map<Item>((item) => Item.fromMap(item)).toList();
  }
}
