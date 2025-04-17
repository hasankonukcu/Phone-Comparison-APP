class MultiMedia {
  String? radyo;
  String? hoparlor_ozellikleri;
  String? ses_cikisi;
  int? hoparlor_point;

  MultiMedia({
    this.radyo,
    this.hoparlor_ozellikleri,
    this.ses_cikisi,
    this.hoparlor_point,
  });
  Map<String, dynamic> toMap() {
    return {
      'radyo': radyo,
      'hoparlor_ozellikleri': hoparlor_ozellikleri,
      'ses_cikisi': ses_cikisi,
      'hoparlor_point': hoparlor_point,
    };
  }
   MultiMedia.fromMap(Map<String, dynamic> map)
      : radyo = map['radyo'],
        hoparlor_ozellikleri = map['hoparlor_ozellikleri'],
        ses_cikisi = map['ses_cikisi'],
        hoparlor_point = map['hoparlor_point'];
}
