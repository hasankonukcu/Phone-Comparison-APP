class WifiConnection {
  String? wifi_kanallari;
  String? wifi_ozellikleri;
  String? bluetooth_versiyonu;
  String? bluetooth_ozellikleri;
  String? kizil_otesi;
  String? navigasyon_ozellikleri;
  String? nfc;

  WifiConnection({
    this.wifi_kanallari,
    this.wifi_ozellikleri,
    this.bluetooth_versiyonu,
    this.bluetooth_ozellikleri,
    this.kizil_otesi,
    this.navigasyon_ozellikleri,
    this.nfc,
  });
  Map<String, dynamic> toMap() {
    return {
      'wifi_kanallari': wifi_kanallari,
      'wifi_ozellikleri': wifi_ozellikleri,
      'bluetooth_versiyonu': bluetooth_versiyonu,
      'bluetooth_ozellikleri': bluetooth_ozellikleri,
      'kizil_otesi': kizil_otesi,
      'navigasyon_ozellikleri': navigasyon_ozellikleri,
      'nfc': nfc,
    };
  }
  WifiConnection.fromMap(Map<String, dynamic> map)
      : wifi_kanallari = map['wifi_kanallari'],
        wifi_ozellikleri = map['wifi_ozellikleri'],
        bluetooth_versiyonu = map['bluetooth_versiyonu'],
        bluetooth_ozellikleri = map['bluetooth_ozellikleri'],
        kizil_otesi = map['kizil_otesi'],
        navigasyon_ozellikleri = map['navigasyon_ozellikleri'],
        nfc = map['nfc'];
}
