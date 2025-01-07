// catalog_model.dart
class CatalogModel {
  static List<Item> items = [
    Item(
        name: 'iphone 12 pro',
        description: 'Apple iphone 12th generation',
        price: 999),
    // // Item(
    //     name: 'iphone 12 pro',
    //     description: 'Apple iphone 12th generation',
    //     price: 999),
    // Item(
        // name: 'iphone 12 pro',
        // description: 'Apple iphone 12th generation',
        // price: 999),
    // You can add more items here
  ];
}

class Item {
  final String name;
  final String description;
  final num price;

  Item({
    required this.name,
    required this.description,
    required this.price,
  });
}
