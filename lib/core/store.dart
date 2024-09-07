import 'package:shopping_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:shopping_app/models/cart_model.dart';

class MyStore extends VxStore {
  Catalog catalog;
  CartCatalog cart;

  MyStore()
      : catalog = Catalog(),
        cart = CartCatalog(); // Initialized here
}
