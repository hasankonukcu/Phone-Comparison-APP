class Screen {
  String? screenSize;
  String? screenTechnology;
  String? screenResolition;
  String? screenResolitionStandart;
  String? pixsel;
  String? screenRefreshSpeed;
  String? screenRatio;
  String? screenArea;
  String? screenFeatures;
  String? screenDurabilty;
  String? touchType;
  String? nunmberOfColor;
  String? screenBodyRatio;
  int? screen_teknoloji_point;
  int? screen_cozunurlugu_point;
  int? screen_pixel_point;
  int? screen_yenileme_point;

  Screen({
    this.screenSize,
    this.screenTechnology,
    this.screenResolition,
    this.screenResolitionStandart,
    this.pixsel,
    this.screenRefreshSpeed,
    this.screenRatio,
    this.screenArea,
    this.screenFeatures,
    this.screenDurabilty,
    this.touchType,
    this.nunmberOfColor,
    this.screenBodyRatio,
    this.screen_teknoloji_point,
    this.screen_cozunurlugu_point,
    this.screen_pixel_point,
    this.screen_yenileme_point,
  });

  Map<String, dynamic> toMap() {
    return {
      'Ekran Boyutu': screenSize,
      'Ekran Teknolojisi': screenTechnology,
      'Ekran Çözünürlüğü': screenResolition,
      'Ekran Çözünürlüğü Standardı': screenResolitionStandart,
      'Piksel Yoğunluğu': pixsel,
      'Ekran Yenileme Hızı': screenRefreshSpeed,
      'Ekran Oranı (Aspect Ratio)': screenRatio,
      'Ekran Alanı': screenArea,
      'Ekran Özellikleri': screenFeatures,
      'Ekran Dayanıklılığı': screenDurabilty,
      'Dokunmatik Türü': touchType,
      'Renk Sayısı': nunmberOfColor,
      'Ekran / Gövde Oranı': screenBodyRatio,
      'screen_teknoloji_point': screen_teknoloji_point,
      'screen_cozunurlugu_point': screen_cozunurlugu_point,
      'screen_pixel_point': screen_pixel_point,
      'screen_yenileme_point': screen_yenileme_point,
    };
  }

  Screen.fromMap(Map<String, dynamic> map)
      : screenSize = map['Ekran Boyutu'],
        screenTechnology = map['Ekran Teknolojisi'],
        screenResolition = map['Ekran Çözünürlüğü'],
        screenResolitionStandart = map['Ekran Çözünürlüğü Standardı'],
        pixsel = map['Piksel Yoğunluğu'],
        screenRefreshSpeed = map['Ekran Yenileme Hızı'],
        screenRatio = map['Ekran Oranı (Aspect Ratio)'],
        screenArea = map['Ekran Alanı'],
        screenFeatures = map['Ekran Özellikleri'],
        screenDurabilty = map['Ekran Dayanıklılığı'],
        touchType = map['Dokunmatik Türü'],
        nunmberOfColor = map['Renk Sayısı'],
        screenBodyRatio = map['Ekran / Gövde Oranı'],
        screen_teknoloji_point = map['screen_teknoloji_point'],
        screen_cozunurlugu_point = map['screen_cozunurlugu_point'],
        screen_pixel_point = map['screen_pixel_point'],
        screen_yenileme_point = map['screen_yenileme_point'];
}
