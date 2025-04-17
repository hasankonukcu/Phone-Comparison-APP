class OperationSystem {
      String? isletim_sistemi;
      String? isletim_sistemi_versiyonu;
      String? kullanici_arayuzu;
      String? kullanici_arayuzu_versiyonu;
      String? yukseltilebilir_versiyon;
      String? planlanan_yukseltilebilir_versiyon;


  OperationSystem({
    this.isletim_sistemi,
    this.isletim_sistemi_versiyonu,
    this.kullanici_arayuzu,
    this.kullanici_arayuzu_versiyonu,
    this.yukseltilebilir_versiyon,
    this.planlanan_yukseltilebilir_versiyon,
   
  });
  Map<String, dynamic> toMap() {
    return {
      'isletim_sistemi': isletim_sistemi,
      'isletim_sistemi_versiyonu': isletim_sistemi_versiyonu,
      'kullanici_arayuzu': kullanici_arayuzu,
      'kullanici_arayuzu_versiyonu': kullanici_arayuzu_versiyonu,
      'yukseltilebilir_versiyon': yukseltilebilir_versiyon,
      'planlanan_yukseltilebilir_versiyon': planlanan_yukseltilebilir_versiyon,
    };
  }
  OperationSystem.fromMap(Map<String, dynamic> map)
      : isletim_sistemi = map['isletim_sistemi'],
        isletim_sistemi_versiyonu = map['isletim_sistemi_versiyonu'],
        kullanici_arayuzu = map['kullanici_arayuzu'],
        kullanici_arayuzu_versiyonu = map['kullanici_arayuzu_versiyonu'],
        yukseltilebilir_versiyon = map['yukseltilebilir_versiyon'],
        planlanan_yukseltilebilir_versiyon = map['planlanan_yukseltilebilir_versiyon'];
}
