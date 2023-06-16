import 'package:catalogue_app/models/catalogue.dart';

class CartModel {
// singleton class
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  // catalog field
  late CatalogModel _catalog;

  // collection of ids
  final List<int> _itemIds = [];

  // get catalog
  CatalogModel get catalog => _catalog;

  // set catalog
  set catalog(CatalogModel newcatalog) {
    _catalog = newcatalog;
  }

  // get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total  price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
