class BasicEquipment {
  String? yonga_seti;
  String? cpu_frekansi;
  String? cpu_cekirdek;
  String? ana_islemci;
  String? I_yard_islemci;
  String? II_yard_islemci;
  String? islemci_mimarisi;
  String? grafik_islemcisi;
  String? cpu_uretim_teknolojisi;
  String? antutu_puani_v7;
  String? antutu_puani_v8;
  String? antutu_puani_v9;
  String? bellek_ram;
  String? ram_tipi;
  String? dahili_depolama;
  String? dahili_depolama_bicimi;
  String? hafiza_karti_destegi;
  String? hafiza_karti_max_kapasite;
  String? diger_chipset_secenekleri;
  String? diger_bellek_ram_secenekleri;
  String? diger_hafiza_secenekleri;
  int? yonga_seti_point;
  int? cpu_cekirdek_point;
  int? cpu_uretim_teknolojisi_point;
  int? ram_bellek_point;

  BasicEquipment({
    this.yonga_seti,
    this.cpu_frekansi,
    this.cpu_cekirdek,
    this.ana_islemci,
    this.I_yard_islemci,
    this.II_yard_islemci,
    this.islemci_mimarisi,
    this.grafik_islemcisi,
    this.cpu_uretim_teknolojisi,
    this.antutu_puani_v7,
    this.antutu_puani_v8,
    this.antutu_puani_v9,
    this.bellek_ram,
    this.ram_tipi,
    this.dahili_depolama,
    this.dahili_depolama_bicimi,
    this.hafiza_karti_destegi,
    this.hafiza_karti_max_kapasite,
    this.diger_chipset_secenekleri,
    this.diger_bellek_ram_secenekleri,
    this.diger_hafiza_secenekleri,
    this.yonga_seti_point,
    this.cpu_cekirdek_point,
    this.cpu_uretim_teknolojisi_point,
    this.ram_bellek_point,
 
  });
  Map<String, dynamic> toMap() {
    return {
      'yonga_seti': yonga_seti,
      'cpu_frekansi': cpu_frekansi,
      'cpu_cekirdek': cpu_cekirdek,
      'ana_islemci': ana_islemci,
      'I_yard_islemci': I_yard_islemci,
      'II_yard_islemci': II_yard_islemci,
      'islemci_mimarisi': islemci_mimarisi,
      'grafik_islemcisi': grafik_islemcisi,
      'cpu_uretim_teknolojisi': cpu_uretim_teknolojisi,
      'antutu_puani_v7': antutu_puani_v7,
      'antutu_puani_v8': antutu_puani_v8,
      'antutu_puani_v9': antutu_puani_v9,
      'bellek_ram': bellek_ram,
      'ram_tipi': ram_tipi,
      'dahili_depolama': dahili_depolama,
      'dahili_depolama_bicimi': dahili_depolama_bicimi,
      'hafiza_karti_destegi': hafiza_karti_destegi,
      'hafiza_karti_max_kapasite': hafiza_karti_max_kapasite,
      'diger_chipset_secenekleri': diger_chipset_secenekleri,
      'diger_bellek_ram_secenekleri': diger_bellek_ram_secenekleri,
      'diger_hafiza_secenekleri': diger_hafiza_secenekleri,
      'yonga_seti_point': yonga_seti_point,
      'cpu_cekirdek_point': cpu_cekirdek_point,
      'cpu_uretim_teknolojisi_point': cpu_uretim_teknolojisi_point,
      'ram_bellek_point': ram_bellek_point,
    };
  }
  BasicEquipment.fromMap(Map<String, dynamic> map)
      : yonga_seti = map['yonga_seti'],
        cpu_frekansi = map['cpu_frekansi'],
        cpu_cekirdek = map['cpu_cekirdek'],
        ana_islemci = map['ana_islemci'],
        I_yard_islemci = map['I_yard_islemci'],
        II_yard_islemci = map['II_yard_islemci'],
        islemci_mimarisi = map['islemci_mimarisi'],
        grafik_islemcisi = map['grafik_islemcisi'],
        cpu_uretim_teknolojisi = map['cpu_uretim_teknolojisi'],
        antutu_puani_v7 = map['antutu_puani_v7'],
        antutu_puani_v8 = map['antutu_puani_v8'],
        antutu_puani_v9 = map['antutu_puani_v9'],
        bellek_ram = map['bellek_ram'],
        ram_tipi = map['ram_tipi'],
        dahili_depolama = map['dahili_depolama'],
        dahili_depolama_bicimi = map['dahili_depolama_bicimi'],
        hafiza_karti_destegi = map['hafiza_karti_destegi'],
        hafiza_karti_max_kapasite = map['hafiza_karti_max_kapasite'],
        diger_chipset_secenekleri = map['diger_chipset_secenekleri'],
        diger_bellek_ram_secenekleri = map['diger_bellek_ram_secenekleri'],
        diger_hafiza_secenekleri = map['diger_hafiza_secenekleri'],
        yonga_seti_point = map['yonga_seti_point'],
        cpu_cekirdek_point = map['cpu_cekirdek_point'],
        cpu_uretim_teknolojisi_point = map['cpu_uretim_teknolojisi_point'],
        ram_bellek_point = map['ram_bellek_point'];
}
