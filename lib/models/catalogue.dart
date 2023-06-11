class CatalogModel {
  static final items = [
    Item(
      id: 1,
      name: 'Apple Iphone 14 Pro',
      desc:
          "Apple iPhone 14 Pro smartphone. Announced Sep 2022. Features 6.1″ display, Apple A16 Bionic chipset, 3200 mAh battery, 1024 GB storage, 6 GB RAM",
      price: 59666,
      color: 'grey',
      image: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-14-pro.jpg',
    )
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
