import 'dart:convert';




class Details {
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  int id;
  String title;
  Map<String, dynamic>? networkConnections; //
  Map<String, dynamic>? batary; //
  List? bigPicture; //
  List? minPicture; //
  Map<String, dynamic>? multiMedia; //
  Map<String, dynamic>? otherConnections; //
  Map<String, dynamic>? screen; //
  List? priceList; //
  Map<String, dynamic>? os; //
  Map<String, dynamic>? wirelessConnection; //
  Map<String, dynamic>? camera; //
  String brand;
  Map<String, dynamic>? feature; //
  int point;
  Map<String, dynamic>? design; //
  Map<String, dynamic>? basicKnowledge; //
  Map<String, dynamic>? basicEquipment; //
  List? commentModel;



  Details({
    this.commentModel,
    required this.id,
    required this.title,
    required this.networkConnections,
    required this.batary,
    required this.bigPicture,
    required this.minPicture,
    required this.multiMedia,
    required this.otherConnections,
    required this.screen,
    required this.priceList,
    required this.os,
    required this.wirelessConnection,
    required this.camera,
    required this.brand,
    required this.feature,
    required this.point,
    required this.design,
    required this.basicKnowledge,
    required this.basicEquipment,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'networkConnections': networkConnections,
      'batary': batary,
      'bigPicture': bigPicture,
      'minPicture': minPicture,
      'multiMedia': multiMedia,
      'otherConnections': otherConnections,
      'screen': screen,
      'comments':commentModel,
      'priceList': priceList,
      'os': os,
      'wirelessConnection': wirelessConnection,
      'camera': camera,
      'brand': brand,
      'feature': feature,
      'basicKnowledge': basicKnowledge,
      'design': design,
      'basicEquipment': basicEquipment,
      'point': point,
    };
  }

  Details.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        commentModel = map['comments'],
        networkConnections = map['networkConnections'],
        batary = map['batary'],
        bigPicture = map['bigPicture'],
        minPicture = map['minPicture'],
        multiMedia = map['multiMedia'],
        otherConnections = map['otherConnections'],
        screen = map['screen'],
        priceList = map['priceList'],
        os = map['os'],
        wirelessConnection = map['wirelessConnection'],
        camera = map['camera'],
        brand = map['brand'],
        feature = map['feature'],
        point = map['point'],
        design = map['design'] ,
        basicKnowledge = map['basicKnowledge'],
        basicEquipment = map['basicEquipment'];
}
