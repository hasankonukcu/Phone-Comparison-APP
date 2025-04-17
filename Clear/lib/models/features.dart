class Features {
  String? suya_dayaniklilik;
  String? suya_dayaniklilik_seviyesi;
  String? toza_dayaniklilik;
  String? toza_dayaniklilik_seviyesi;
  String? three_g_goruntulu_arama_sebeke;
  String? goruntulu_konusma;
  String? sensorler;
  String? parmak_izi_okuyucu;
  String? bildirim_isigi;
  String? sar_degeri_teng_bas;
  String? sar_degeri_teng_vucut;
  String? servis_ve_uygulamalar;
  String? kutu_icerigi;

  Features({
    this.suya_dayaniklilik,
    this.suya_dayaniklilik_seviyesi,
    this.toza_dayaniklilik,
    this.toza_dayaniklilik_seviyesi,
    this.three_g_goruntulu_arama_sebeke,
    this.goruntulu_konusma,
    this.sensorler,
    this.parmak_izi_okuyucu,
    this.bildirim_isigi,
    this.sar_degeri_teng_bas,
    this.sar_degeri_teng_vucut,
    this.servis_ve_uygulamalar,
    this.kutu_icerigi,
  });
  Map<String, dynamic> toMap() {
    return {
      'suya_dayaniklilik': suya_dayaniklilik,
      'suya_dayaniklilik_seviyesi': suya_dayaniklilik_seviyesi,
      'toza_dayaniklilik': toza_dayaniklilik,
      'toza_dayaniklilik_seviyesi': toza_dayaniklilik_seviyesi,
      'three_g_goruntulu_arama_sebeke': three_g_goruntulu_arama_sebeke,
      'goruntulu_konusma': goruntulu_konusma,
      'sensorler': sensorler,
      'parmak_izi_okuyucu': parmak_izi_okuyucu,
      'bildirim_isigi': bildirim_isigi,
      'sar_degeri_teng_bas': sar_degeri_teng_bas,
      'sar_degeri_teng_vucut': sar_degeri_teng_vucut,
      'servis_ve_uygulamalar': servis_ve_uygulamalar,
      'kutu_icerigi': kutu_icerigi,
    };
  }
  Features.fromMap(Map<String, dynamic> map)
      : suya_dayaniklilik = map['suya_dayaniklilik'],
        suya_dayaniklilik_seviyesi = map['suya_dayaniklilik_seviyesi'],
        toza_dayaniklilik = map['toza_dayaniklilik'],
        toza_dayaniklilik_seviyesi = map['toza_dayaniklilik_seviyesi'],
        three_g_goruntulu_arama_sebeke = map['three_g_goruntulu_arama_sebeke'],
        goruntulu_konusma = map['goruntulu_konusma'],
        sensorler = map['sensorler'],
        parmak_izi_okuyucu = map['parmak_izi_okuyucu'],
        bildirim_isigi = map['bildirim_isigi'],
        sar_degeri_teng_bas = map['sar_degeri_teng_bas'],
        sar_degeri_teng_vucut = map['sar_degeri_teng_vucut'],
        servis_ve_uygulamalar = map['servis_ve_uygulamalar'],
        kutu_icerigi = map['kutu_icerigi'];
}
