class NetworkConnection {
        String? two_g;
        String? two_g_frekans; 
        String? two_g_teknolojisi; 
        String? three_g;
        String? three_g_frekans;
        String? three_g_indirme;
        String? three_g_karsi_yukleme;
        String? three_g_teknolojisi;
        String? four_g;
        String? four_g_frekanslari; 
        String? four_g_indirme;
        String? four_g_teknolojisi;
        String? four_g_karsi_yukleme;
        String? four_g_ozellikleri;
        String? four_g_frekans_notu;
        String? four_half_g_destegi;
        String? five_g;

  NetworkConnection({
    this.two_g,
    this.two_g_frekans,
    this.two_g_teknolojisi,
    this.three_g,
    this.three_g_frekans,
    this.three_g_indirme,
    this.three_g_karsi_yukleme,
    this.three_g_teknolojisi,
    this.four_g,
    this.four_g_frekanslari,
    this.four_g_indirme,
    this.four_g_teknolojisi,
    this.four_g_karsi_yukleme,
    this.four_g_ozellikleri,
    this.four_g_frekans_notu,
    this.four_half_g_destegi,
    this.five_g,
  });
   Map<String, dynamic> toMap() {
    return {
      'two_g': two_g,
      'two_g_frekans': two_g_frekans,
      'two_g_teknolojisi': two_g_teknolojisi,
      'three_g': three_g,
      'three_g_frekans': three_g_frekans,
      'three_g_indirme': three_g_indirme,
      'three_g_karsi_yukleme': three_g_karsi_yukleme,
      'three_g_teknolojisi': three_g_teknolojisi,
      'four_g': four_g,
      'four_g_frekanslari': four_g_frekanslari,
      'four_g_indirme': four_g_indirme,
      'four_g_teknolojisi': four_g_teknolojisi,
      'four_g_karsi_yukleme': four_g_karsi_yukleme,
      'four_g_ozellikleri': four_g_ozellikleri,
      'four_g_frekans_notu': four_g_frekans_notu,
      'four_half_g_destegi': four_half_g_destegi,
      'five_g': five_g,
    };
  }
  NetworkConnection.fromMap(Map<String, dynamic> map)
      : two_g = map['two_g'],
        two_g_frekans = map['two_g_frekans'],
        two_g_teknolojisi = map['two_g_teknolojisi'],
        three_g = map['three_g'],
        three_g_frekans = map['three_g_frekans'],
        three_g_indirme = map['three_g_indirme'],
        three_g_karsi_yukleme = map['three_g_karsi_yukleme'],
        three_g_teknolojisi = map['three_g_teknolojisi'],
        four_g = map['four_g'],
        four_g_frekanslari = map['four_g_frekanslari'],
        four_g_indirme = map['four_g_indirme'],
        four_g_teknolojisi = map['four_g_teknolojisi'],
        four_g_karsi_yukleme = map['four_g_karsi_yukleme'],
        four_g_ozellikleri = map['four_g_ozellikleri'],
        four_g_frekans_notu = map['four_g_frekans_notu'],
        four_half_g_destegi = map['four_half_g_destegi'],
        five_g = map['five_g'];


 
}