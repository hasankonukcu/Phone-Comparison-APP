class Design {
  String? boy;
  String? en;
  String? kalanlik;
  String? agirlik;
  String? renk_senecekleri; 
  String? govde_malzemesi_kapak;
  String? govde_malzemesi_cerceve;

  Design({
    this.boy,
    this.en,
    this.kalanlik,
    this.agirlik,
    this.renk_senecekleri,
    this.govde_malzemesi_kapak,
    this.govde_malzemesi_cerceve,
   
  });
  Map<String, dynamic> toMap() {
    return {
      'boy': boy,
      'en': en,
      'kalanlik': kalanlik,
      'agirlik': agirlik,
      'renk_senecekleri': renk_senecekleri,
      'govde_malzemesi_kapak': govde_malzemesi_kapak,
      'govde_malzemesi_cerceve': govde_malzemesi_cerceve,
    };
  }
  
  Design.fromMap(Map<String, dynamic> map)
      : boy = map['boy'],
        en = map['en'],
        kalanlik = map['kalanlik'],
        agirlik = map['agirlik'],
        renk_senecekleri = map['renk_senecekleri'],
        govde_malzemesi_kapak = map['govde_malzemesi_kapak'],
        govde_malzemesi_cerceve = map['govde_malzemesi_cerceve'];
}
