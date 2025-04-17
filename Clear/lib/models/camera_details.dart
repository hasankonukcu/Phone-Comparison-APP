class Camera {
  String? kamera_conuzurlugu;
  String? optik_goruntu_sabitleyici;
  String? kamera_ozellikleri;
  String? flas;
  String? diyafram_acikligi;
  String? diyafram_acikligi_max;
  String? video_kayit_cozunurlugu;
  String? video_fps_degeri;
  String? video_kayit_ozellikleri;
  String? video_kayit_secenekleri;
  String? agir_cekim_kayit_secenekleri;
  String? ikinci_arka_kamera;
  String? ikinci_arka_kamera_cozunurlugu;
  String? ikinci_arka_kamera_diyaframi;
  String? ikinci_arka_kamera_ozellikleri;
  String? ucuncu_arka_kamera;
  String? ucuncu_arka_kamera_cozunurlugu;
  String? ucuncu_arka_kamera_diyaframi;
  String? ucuncu_arka_kamera_ozellikleri;
  String? ikinci_on_kamera;
  String? ikinci_on_kamera_cozunurlugu;
  String? ikinci_on_kamera_diyaframi;
  String? ikinci_on_kamera_ozellikleri;
  String? on_kamera_cozunurlugu;
  String? on_kamera_video_cozunurlugu;
  String? on_kamera_fps_degeri;
  String? on_kamera_diyaframi;
  String? on_kamera_ozellikleri;
  String? dxomark_v2;
  String? dxomark_v3;
  String? dxomark_v4;
  int? camera_cozunurlugu_point;
  int? camera_diyafram_acikligi_point;
  int? camera_video_kayit_point;
  int? camera_video_fps_point;

  Camera({
    this.kamera_conuzurlugu,
    this.optik_goruntu_sabitleyici,
    this.kamera_ozellikleri,
    this.flas,
    this.diyafram_acikligi,
    this.diyafram_acikligi_max,
    this.video_kayit_cozunurlugu,
    this.video_fps_degeri,
    this.video_kayit_ozellikleri,
    this.video_kayit_secenekleri,
    this.agir_cekim_kayit_secenekleri,
    this.ikinci_arka_kamera,
    this.ikinci_arka_kamera_cozunurlugu,
    this.ikinci_arka_kamera_diyaframi,
    this.ikinci_arka_kamera_ozellikleri,
    this.ucuncu_arka_kamera,
    this.ucuncu_arka_kamera_cozunurlugu,
    this.ucuncu_arka_kamera_diyaframi,
    this.ucuncu_arka_kamera_ozellikleri,
    this.ikinci_on_kamera,
    this.ikinci_on_kamera_cozunurlugu,
    this.ikinci_on_kamera_diyaframi,
    this.ikinci_on_kamera_ozellikleri,
    this.on_kamera_cozunurlugu,
    this.on_kamera_video_cozunurlugu,
    this.on_kamera_fps_degeri,
    this.on_kamera_diyaframi,
    this.on_kamera_ozellikleri,
    this.dxomark_v2,
    this.dxomark_v3,
    this.dxomark_v4,
    this.camera_cozunurlugu_point,
    this.camera_diyafram_acikligi_point,
    this.camera_video_kayit_point,
    this.camera_video_fps_point,
  });
  Map<String, dynamic> toMap() {
    return {
      'kamera_conuzurlugu': kamera_conuzurlugu,
      'optik_goruntu_sabitleyici': optik_goruntu_sabitleyici,
      'kamera_ozellikleri': kamera_ozellikleri,
      'flas': flas,
      'diyafram_acikligi': diyafram_acikligi,
      'diyafram_acikligi_max': diyafram_acikligi_max,
      'video_kayit_cozunurlugu': video_kayit_cozunurlugu,
      'video_fps_degeri': video_fps_degeri,
      'video_kayit_ozellikleri': video_kayit_ozellikleri,
      'video_kayit_secenekleri': video_kayit_secenekleri,
      'agir_cekim_kayit_secenekleri': agir_cekim_kayit_secenekleri,
      'ikinci_arka_kamera': ikinci_arka_kamera,
      'ikinci_arka_kamera_cozunurlugu': ikinci_arka_kamera_cozunurlugu,
      'ikinci_arka_kamera_diyaframi': ikinci_arka_kamera_diyaframi,
      'ikinci_arka_kamera_ozellikleri': ikinci_arka_kamera_ozellikleri,
      'ucuncu_arka_kamera': ucuncu_arka_kamera,
      'ucuncu_arka_kamera_cozunurlugu': ucuncu_arka_kamera_cozunurlugu,
      'ucuncu_arka_kamera_diyaframi': ucuncu_arka_kamera_diyaframi,
      'ucuncu_arka_kamera_ozellikleri': ucuncu_arka_kamera_ozellikleri,
      'ikinci_on_kamera': ikinci_on_kamera,
      'ikinci_on_kamera_cozunurlugu': ikinci_on_kamera_cozunurlugu,
      'ikinci_on_kamera_diyaframi': ikinci_on_kamera_diyaframi,
      'ikinci_on_kamera_ozellikleri': ikinci_on_kamera_ozellikleri,
      'on_kamera_cozunurlugu': on_kamera_cozunurlugu,
      'on_kamera_video_cozunurlugu': on_kamera_video_cozunurlugu,
      'on_kamera_fps_degeri': on_kamera_fps_degeri,
      'on_kamera_diyaframi': on_kamera_diyaframi,
      'on_kamera_ozellikleri': on_kamera_ozellikleri,
      'dxomark_v2': dxomark_v2,
      'dxomark_v3': dxomark_v3,
      'dxomark_v4': dxomark_v4,
      'camera_cozunurlugu_point': camera_cozunurlugu_point,
      'camera_diyafram_acikligi_point': camera_diyafram_acikligi_point,
      'camera_video_kayit_point': camera_video_kayit_point,
      'camera_video_fps_point': camera_video_fps_point,
    };
  }
  Camera.fromMap(Map<String, dynamic> map)
      : kamera_conuzurlugu = map['kamera_conuzurlugu'],
        optik_goruntu_sabitleyici = map['optik_goruntu_sabitleyici'],
        kamera_ozellikleri = map['kamera_ozellikleri'],
        flas = map['flas'],
        diyafram_acikligi = map['diyafram_acikligi'],
        diyafram_acikligi_max = map['diyafram_acikligi_max'],
        video_kayit_cozunurlugu = map['video_kayit_cozunurlugu'],
        video_fps_degeri = map['video_fps_degeri'],
        video_kayit_ozellikleri = map['video_kayit_ozellikleri'],
        video_kayit_secenekleri = map['video_kayit_secenekleri'],
        agir_cekim_kayit_secenekleri = map['agir_cekim_kayit_secenekleri'],
        ikinci_arka_kamera = map['ikinci_arka_kamera'],
        ikinci_arka_kamera_cozunurlugu = map['ikinci_arka_kamera_cozunurlugu'],
        ikinci_arka_kamera_diyaframi = map['ikinci_arka_kamera_diyaframi'],
        ikinci_arka_kamera_ozellikleri = map['ikinci_arka_kamera_ozellikleri'],
        ucuncu_arka_kamera = map['ucuncu_arka_kamera'],
        ucuncu_arka_kamera_cozunurlugu = map['ucuncu_arka_kamera_cozunurlugu'],
        ucuncu_arka_kamera_diyaframi = map['ucuncu_arka_kamera_diyaframi'],
        ucuncu_arka_kamera_ozellikleri = map['ucuncu_arka_kamera_ozellikleri'],
        ikinci_on_kamera = map['ikinci_on_kamera'],
        ikinci_on_kamera_cozunurlugu = map['ikinci_on_kamera_cozunurlugu'],
        ikinci_on_kamera_diyaframi = map['ikinci_on_kamera_diyaframi'],
        ikinci_on_kamera_ozellikleri = map['ikinci_on_kamera_ozellikleri'],
        on_kamera_cozunurlugu = map['on_kamera_cozunurlugu'],
        on_kamera_video_cozunurlugu = map['on_kamera_video_cozunurlugu'],
        on_kamera_fps_degeri = map['on_kamera_fps_degeri'],
        on_kamera_diyaframi = map['on_kamera_diyaframi'],
        on_kamera_ozellikleri = map['on_kamera_ozellikleri'],
        dxomark_v2 = map['dxomark_v2'],
        dxomark_v3 = map['dxomark_v3'],
        dxomark_v4 = map['dxomark_v4'],
        camera_cozunurlugu_point = map['camera_cozunurlugu_point'],
        camera_diyafram_acikligi_point = map['camera_diyafram_acikligi_point'],
        camera_video_kayit_point = map['camera_video_kayit_point'],
        camera_video_fps_point = map['camera_video_fps_point'];
}
