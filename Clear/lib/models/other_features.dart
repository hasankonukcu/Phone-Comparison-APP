class OtherFeatures {
  String? usb_versiyonu;
  String? usb_baglanti_tipi;
  String? usb_ozellikleri;
  String? hat_sayisi;
  String? sim;

  OtherFeatures({
    this.usb_versiyonu,
    this.usb_baglanti_tipi,
    this.usb_ozellikleri,
    this.hat_sayisi,
    this.sim,
  });
  Map<String, dynamic> toMap() {
    return {
      'usb_versiyonu': usb_versiyonu,
      'usb_baglanti_tipi': usb_baglanti_tipi,
      'usb_ozellikleri': usb_ozellikleri,
      'hat_sayisi': hat_sayisi,
      'sim': sim,
    };
  }
  OtherFeatures.fromMap(Map<String, dynamic> map)
      : usb_versiyonu = map['usb_versiyonu'],
        usb_baglanti_tipi = map['usb_baglanti_tipi'],
        usb_ozellikleri = map['usb_ozellikleri'],
        hat_sayisi = map['hat_sayisi'],
        sim = map['sim'];
}
