class Batary {
  String? batarya_kapasitesi;
  String? konusma_suresi;
  String? internet_kullanimi_wifi;
  String? internet_kullanimi_4g;
  String? internet_kullanimi_3g;
  String? video_oynatma;
  String? muzik_oynatma;
  String? sarj;
  String? batarya_teknolojisi;
  String? hizli_sarj;
  String? hizli_sarj_gucu;
  String? hizli_sarj_ozellikleri;
  String? kablosuz_sarj;
  String? kablosuz_sarj_ozellikleri;
  String? degisir_batarya;
  int? hizli_sarj_gucu_point;

  Batary({
    this.batarya_kapasitesi,
    this.konusma_suresi,
    this.internet_kullanimi_wifi,
    this.video_oynatma,
    this.internet_kullanimi_4g,
    this.internet_kullanimi_3g,
    this.muzik_oynatma,
    this.sarj,
    this.batarya_teknolojisi,
    this.hizli_sarj,
    this.hizli_sarj_gucu,
    this.hizli_sarj_ozellikleri,
    this.kablosuz_sarj,
    this.kablosuz_sarj_ozellikleri,
    this.degisir_batarya,
    this.hizli_sarj_gucu_point,
  });
  Map<String, dynamic> toMap() {
    return {
      'batarya_kapasitesi': batarya_kapasitesi,
      'konusma_suresi': konusma_suresi,
      'internet_kullanimi_wifi': internet_kullanimi_wifi,
      'video_oynatma': video_oynatma,
      'internet_kullanimi_4g': internet_kullanimi_4g,
      'internet_kullanimi_3g': internet_kullanimi_3g,
      'muzik_oynatma': muzik_oynatma,
      'sarj': sarj,
      'batarya_teknolojisi': batarya_teknolojisi,
      'hizli_sarj': hizli_sarj,
      'hizli_sarj_gucu': hizli_sarj_gucu,
      'hizli_sarj_ozellikleri': hizli_sarj_ozellikleri,
      'kablosuz_sarj': kablosuz_sarj,
      'kablosuz_sarj_ozellikleri': kablosuz_sarj_ozellikleri,
      'degisir_batarya': degisir_batarya,
      'hizli_sarj_gucu_point': hizli_sarj_gucu_point,
    };
  }
  Batary.fromMap(Map<String, dynamic> map)
      : batarya_kapasitesi = map['batarya_kapasitesi'],
        konusma_suresi = map['konusma_suresi'],
        internet_kullanimi_wifi = map['internet_kullanimi_wifi'],
        video_oynatma = map['video_oynatma'],
        internet_kullanimi_4g = map['internet_kullanimi_4g'],
        internet_kullanimi_3g = map['internet_kullanimi_3g'],
        muzik_oynatma = map['muzik_oynatma'],
        sarj = map['sarj'],
        batarya_teknolojisi = map['batarya_teknolojisi'],
        hizli_sarj = map['hizli_sarj'],
        hizli_sarj_gucu = map['hizli_sarj_gucu'],
        hizli_sarj_ozellikleri = map['hizli_sarj_ozellikleri'],
        kablosuz_sarj = map['kablosuz_sarj'],
        kablosuz_sarj_ozellikleri = map['kablosuz_sarj_ozellikleri'],
        degisir_batarya = map['degisir_batarya'],
        hizli_sarj_gucu_point = map['hizli_sarj_gucu_point'];
}
