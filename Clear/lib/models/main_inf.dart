class MainInformation {
  String? cikis_yili;
  String? duyurulma_tarihi;
  String? kullanim_kilavuzu;

  MainInformation({
    this.cikis_yili,
    this.duyurulma_tarihi,
    this.kullanim_kilavuzu,
  });
  Map<String, dynamic> toMap() {
    return {
      'cikis_yili': cikis_yili,
      'duyurulma_tarihi': duyurulma_tarihi,
      'kullanim_kilavuzu': kullanim_kilavuzu,
    };
  }

  MainInformation.fromMap(Map<String, dynamic> map)
      : cikis_yili = map['cikis_yili'],
        duyurulma_tarihi = map['duyurulma_tarihi'],
        kullanim_kilavuzu = map['kullanim_kilavuzu'];
}
