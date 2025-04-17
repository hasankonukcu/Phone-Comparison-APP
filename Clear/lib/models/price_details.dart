

class PriceDetails {
  String? title;
  String? url;
  String? kargo; //
  String? price;

  PriceDetails({
    this.title,
    this.url,
    this.kargo,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'urun_adi': title,
      'site_url': url,
      'kargo_dahil': kargo,
      'urun_fiyat': price,

    };
  }

  PriceDetails.fromMap(Map<String, dynamic> map)
      : title = map['urun_adi'],
        url = map['site_url'],
        kargo = map['kargo_dahil'],
        price = map['urun_fiyat'];
}
