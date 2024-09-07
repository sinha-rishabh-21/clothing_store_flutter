import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import './store.dart';

class AddMutation extends VxMutation<MyStore> {
  final String id;

  AddMutation({required this.id});
  @override
  perform() {
    final MyStore store = VxState.store as MyStore;
    Item obj = store.catalog.getById(id: id);
    return store.cart.products
        .add(Prod(id: obj.id, title: obj.title, price: obj.price));
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final String id;

  RemoveMutation({required this.id});
  @override
  perform() {
    final MyStore store = VxState.store as MyStore;
    return store.cart.removeById(id: id);
  }
}
