

class SliderModel {
  int id;
  String title;
  String? bigPicture;
  int point;
  String batteryCapacity;
  String internalStorage;
  int price;
  String priceStr;
  String ram;
  String screenSize;

  SliderModel({
    required this.id,
    required this.title,
    required this.bigPicture,
    required this.point,
    required this.batteryCapacity,
    required this.internalStorage,
    required this.price,
    required this.priceStr,
    required this.ram,
    required this.screenSize,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'bigPicture': bigPicture,
      'point': point,
      'batteryCapacity': batteryCapacity,
      'internalStorage': internalStorage,
      'price': price,
      'priceStr': priceStr,
      'ram': ram,
      'screenSize': screenSize,
    };
  }

  SliderModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        bigPicture = map['bigPicture'],
        point = map['point'],
        batteryCapacity = map['batteryCapacity'],
        internalStorage = map['internalStorage'],
        price = map['price'],
        priceStr = map['priceStr'],
        ram = map['ram'],
        screenSize = map['screenSize'];
}
