import 'package:compare_app/models/comment.dart';

class Phones {
  int id;
  int price;
  String priceStr;
  String screenSize;
  String internalStorage;
  String bigPicture;
  String ram;
  String batteryCapacity;
  String brand;
  String title;
  int point;

  Phones({
    required this.id,
    required this.price,
    required this.priceStr,
    required this.screenSize,
    required this.internalStorage,
    required this.bigPicture,
    required this.ram,
    required this.batteryCapacity,
    required this.brand,
    required this.title,
    required this.point,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'priceStr': priceStr,
      'screenSize': screenSize,
      'internalStorage': internalStorage,
      'bigPicture': bigPicture,
      'ram': ram,
      'batteryCapacity': batteryCapacity,
      'brand': brand,
      'title': title,
      'point': point,
    };
  }

  Phones.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        price = map['price'],
        priceStr = map['priceStr'],
        screenSize = map['screenSize'],
        internalStorage = map['internalStorage'],
        bigPicture = map['bigPicture'],
        brand = map['brand'],
        ram = map['ram'],
        title = map['title'],
        point = map['point'],
        batteryCapacity = map['batteryCapacity'];
}
