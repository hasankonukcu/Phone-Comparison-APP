import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compare_app/models/basic_equipment.dart';
import 'package:compare_app/models/batary_details.dart';
import 'package:compare_app/models/camera_details.dart';
import 'package:compare_app/models/design.dart';
import 'package:compare_app/models/details_model.dart';
import 'package:compare_app/models/features.dart';
import 'package:compare_app/models/main_inf.dart';
import 'package:compare_app/models/multi_media.dart';
import 'package:compare_app/models/network_connection.dart';
import 'package:compare_app/models/os.dart';
import 'package:compare_app/models/other_features.dart';
import 'package:compare_app/models/screen_details.dart';
import 'package:compare_app/models/wifi_connection.dart';
import 'package:compare_app/viewmodel/user_model.dart';
import 'package:compare_app/widgets/fadeanimation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({Key? key}) : super(key: key);

  @override
  State<ComparePage> createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  List<Details?> _allDetails = [];
  int current = 0;

  var textColor = Colors.white;
  var listItemTextColor = Colors.black;
  final fontSize = 10.0;
  var bgColor = const Color.fromARGB(255, 62, 83, 99);

  var cpuMax = 0;
  var ramMax = 0;
  var yongaMax = 0;
  var teknolojiMax = 0;
  var bataryMax = 0;
  var videoMax = 0;
  var cameraCozunurlukMax = 0;
  var cameraVideoKayitMax = 0;
  var cameraDiyaframMax = 0;
  var hoparlorMax = 0;
  var pixelMax = 0;
  var yenilemeMax = 0;
  var screenTeknolojiMax = 0;
  var screenCozunurlukMax = 0;

  var screenLenght = 0;
  var basicEqLenght = 0;
  var cameraLenght = 0;
  var networkConLenght = 0;
  var wifiConnectLenght = 0;
  var featuresLenght = 0;

  @override
  void initState() {
    super.initState();
    final _userModel = Provider.of<UserModel>(context, listen: false);

    getFirebaseData(_userModel.compareList);
  }

  getMax() {
    if (_allDetails != null) {
      _allDetails.forEach((element) {
        var basic = BasicEquipment.fromMap(element!.basicEquipment!);
        var cpuPoint = basic.cpu_cekirdek_point;
        var ramPoint = basic.ram_bellek_point;
        var yongaPoint = basic.yonga_seti_point;
        var teknolojiPoint = basic.cpu_uretim_teknolojisi_point;
        if (cpuPoint! > cpuMax) {
          cpuMax = cpuPoint;
        }
        if (ramPoint! > ramMax) {
          ramMax = ramPoint;
        }
        if (yongaPoint! > yongaMax) {
          yongaMax = yongaPoint;
        }
        if (teknolojiPoint! > cpuMax) {
          teknolojiMax = teknolojiMax;
        }
        var batary = Batary.fromMap(element.batary!);
        var bataryP = batary.hizli_sarj_gucu_point;
        if (bataryP! > bataryMax) {
          bataryMax = bataryP;
        }

        var camera = Camera.fromMap(element.camera!);
        var videoFpsP = camera.camera_video_fps_point;
        var cameraCozunurlukP = camera.camera_cozunurlugu_point;
        var cameraVideoKayitP = camera.camera_video_kayit_point;
        var cameraDiyaframP = camera.camera_diyafram_acikligi_point;
        if (videoFpsP! > videoMax) {
          videoMax = videoFpsP;
        }
        if (cameraCozunurlukP! > cameraCozunurlukMax) {
          cameraCozunurlukMax = cameraCozunurlukP;
        }
        if (cameraVideoKayitP! > cameraVideoKayitMax) {
          cameraVideoKayitMax = cameraVideoKayitP;
        }
        if (cameraDiyaframP! > cameraDiyaframMax) {
          cameraDiyaframMax = cameraDiyaframP;
        }
        var multiMedia = MultiMedia.fromMap(element.multiMedia!);
        var hoparlorP = multiMedia.hoparlor_point;
        if (hoparlorP! > hoparlorMax) {
          hoparlorMax = hoparlorP;
        }

        if (element.screen != null) {
          var screen = Screen.fromMap(element.screen!);
          var lenght = 0;

          element.screen!.forEach((key, value) {
            lenght = lenght + value.toString().length;
          });
          if (lenght > screenLenght) {
            screenLenght = lenght;
          }
          var lenghtForBasicEq = 0;

          element.basicEquipment!.forEach((key, value) {
            lenghtForBasicEq = lenghtForBasicEq + value.toString().length;
          });
          if (lenghtForBasicEq > basicEqLenght) {
            basicEqLenght = lenghtForBasicEq;
          }
          var lenghtForCamera = 0;

          element.camera!.forEach((key, value) {
            lenghtForCamera = lenghtForCamera + value.toString().length;
          });
          if (lenghtForCamera > cameraLenght) {
            cameraLenght = lenghtForCamera;
          }

          var lenghtFornetWorkConnection = 0;

          element.networkConnections!.forEach((key, value) {
            lenghtFornetWorkConnection =
                lenghtFornetWorkConnection + value.toString().length;
          });
          if (lenghtFornetWorkConnection > networkConLenght) {
            networkConLenght = lenghtFornetWorkConnection;
          }

          var lenghtForWifiConnection = 0;

          element.wirelessConnection!.forEach((key, value) {
            lenghtForWifiConnection =
                lenghtForWifiConnection + value.toString().length;
          });
          if (lenghtForWifiConnection > wifiConnectLenght) {
            wifiConnectLenght = lenghtForWifiConnection;
          }

          var lenghtForFeatures = 0;

          element.feature!.forEach((key, value) {
            lenghtForFeatures = lenghtForFeatures + value.toString().length;
          });
          if (lenghtForFeatures > featuresLenght) {
            featuresLenght = lenghtForFeatures;
          }

          var pixelP = screen.screen_pixel_point;
          var yenielemeP = screen.screen_yenileme_point;
          var screenTeknolojiP = screen.screen_teknoloji_point;
          var screenCozunurlukP = screen.screen_cozunurlugu_point;
          if (pixelP != null) {
            if (pixelP > pixelMax) {
              pixelMax = pixelP;
            }
          }
          if (yenielemeP != null) {
            if (yenielemeP > yenilemeMax) {
              yenilemeMax = yenielemeP;
            }
          }
          if (screenTeknolojiP != null) {
            if (screenTeknolojiP > screenTeknolojiMax) {
              screenTeknolojiMax = screenTeknolojiP;
            }
          }
          if (screenCozunurlukP != null) {
            if (screenCozunurlukP > screenCozunurlukMax) {
              screenCozunurlukMax = screenCozunurlukP;
            }
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getMax();

    return Scaffold(
      backgroundColor: bgColor,
      body: CustomScrollView(
        slivers: <Widget>[
          appBar(context),
          SliverToBoxAdapter(
              child: _allDetails.isNotEmpty
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ..._allDetails.map((item) {
                            return details(item!);
                          }).toList(),
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ))
        ],
      ),
    );
  }

  SliverAppBar appBar(BuildContext context) {
    return SliverAppBar(
      title: FadeAnimation(
        delay: 0.5,
        child: const Text(
          "Karşılaştırma",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: bgColor,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: FadeAnimation(
            delay: 0.5,
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          )),
    );
  }

  getFirebaseData(List id) async {
    for (var currentId in id) {
      DocumentSnapshot _documentSnapshot;
      _documentSnapshot = await FirebaseFirestore.instance
          .collection("phone")
          .doc(currentId.toString())
          .collection("details")
          .doc(currentId.toString())
          .get();
      Details details =
          Details.fromMap(_documentSnapshot.data() as Map<String, dynamic>);
      _allDetails.add(details);
    }
    setState(() {});
  }

  Widget details(Details details) {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    double width = MediaQuery.of(context).size.width / 2;
    Design? design;
    BasicEquipment? basicEquipment;
    Batary? batary;
    Camera? camera;
    Screen? screen;
    NetworkConnection? networkConnection;
    OperationSystem? operationSystem;
    WifiConnection? wifiConnection;
    MultiMedia? multiMedia;
    Features? features;
    OtherFeatures? otherFeatures;
    MainInformation? mainInformation;

    design = Design.fromMap(details.design!);
    basicEquipment = BasicEquipment.fromMap(details.basicEquipment!);
    batary = Batary.fromMap(details.batary!);
    camera = Camera.fromMap(details.camera!);
    screen = Screen.fromMap(details.screen!);
    networkConnection = NetworkConnection.fromMap(details.networkConnections!);
    operationSystem = OperationSystem.fromMap(details.os!);
    wifiConnection = WifiConnection.fromMap(details.wirelessConnection!);
    multiMedia = MultiMedia.fromMap(details.multiMedia!);
    features = Features.fromMap(details.feature!);
    otherFeatures = OtherFeatures.fromMap(details.otherConnections!);
    mainInformation = MainInformation.fromMap(details.basicKnowledge!);

    var decoded = "";
    var minImage1 = "";
    var minImage2 = "";
    var minImage3 = "";
    if (_allDetails.isNotEmpty) {
      if (details.minPicture!.isNotEmpty && details.bigPicture!.isNotEmpty) {
        Codec<String, String> stringToBase64 = utf8.fuse(base64);
        var big = details.bigPicture![current];
        decoded = stringToBase64.decode(big);
        var min1 = details.minPicture![0];
        minImage1 = stringToBase64.decode(min1);

        var min2 = details.minPicture![1];
        minImage2 = stringToBase64.decode(min2);

        var min3 = details.minPicture![2];
        minImage3 = stringToBase64.decode(min3);
      }
    }
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onLongPress: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text(details.title),
                  content: const Text(
                      "Telefonu listeden çıkarmak istediğinize emin misiniz?"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Hayır")),
                    TextButton(
                        onPressed: () {
                          _userModel.removeCompareList = details.id.toString();

                          setState(() {
                            _allDetails.remove(details);
                          });
                          Navigator.pop(context);
                        },
                        child: const Text("Evet")),
                  ],
                ));
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                width: size.width / 2,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: bgColor,
                      width: 0.1,
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                    color: bgColor),
                child: Column(
                  children: [
                    screen != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    const Center(
                                        child: Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.phone_android_outlined,
                                            )),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Ekran",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )),
                                    showListItem("Ekran Boyutu",
                                        screen.screenSize, width, false),
                                    screen.screen_teknoloji_point ==
                                            screenTeknolojiMax
                                        ? showListItem(
                                            "Ekran Teknolojisi",
                                            screen.screenTechnology,
                                            width,
                                            true)
                                        : showListItem(
                                            "Ekran Teknolojisi",
                                            screen.screenTechnology,
                                            width,
                                            false),
                                    screen.screen_cozunurlugu_point ==
                                            screenCozunurlukMax
                                        ? showListItem(
                                            "Ekran Çözünürlüğü",
                                            screen.screenResolition,
                                            width,
                                            true)
                                        : showListItem(
                                            "Ekran Çözünürlüğü",
                                            screen.screenResolition,
                                            width,
                                            false),
                                    showListItem(
                                        "Ekran Çözünürlüğü Standartı",
                                        screen.screenResolitionStandart,
                                        width,
                                        false),
                                    showListItem("Dokunmatik Türü",
                                        screen.touchType, width, false),
                                    screen.screen_yenileme_point == yenilemeMax
                                        ? showListItem(
                                            "Ekran Yenileme Hızı",
                                            screen.screenRefreshSpeed,
                                            width,
                                            true)
                                        : showListItem(
                                            "Ekran Yenileme Hızı",
                                            screen.screenRefreshSpeed,
                                            width,
                                            false),
                                    showListItem("Ekran Oranı",
                                        screen.screenRatio, width, false),
                                    showListItem("Ekran Özellikleri",
                                        screen.screenFeatures, width, false),
                                    showListItem("Ekran Dayanıklılığı",
                                        screen.screenDurabilty, width, false),
                                    showListItem("Ekran/Gövde Oranı",
                                        screen.screenBodyRatio, width, false),
                                    showListItem("Ekran Alanı",
                                        screen.screenArea, width, false),
                                    screen.screen_pixel_point == pixelMax
                                        ? showListItem("Pixel Yoğunluğu",
                                            screen.pixsel, width, true)
                                        : showListItem("Pixel Yoğunluğu",
                                            screen.pixsel, width, false),
                                    showListItem("Renk Sayısı",
                                        screen.nunmberOfColor, width, false),
                                  ],
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 235, 234, 245),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                            ),
                          )
                        : const Center(),
                    basicEquipment != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    const Center(
                                        child: Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.sd_card_outlined,
                                            )),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Donanım",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )),
                                    basicEquipment.yonga_seti_point == yongaMax
                                        ? showListItem(
                                            "Yonga Seti (Chipset)",
                                            basicEquipment.yonga_seti,
                                            width,
                                            true,
                                          )
                                        : showListItem(
                                            "Yonga Seti (Chipset)",
                                            basicEquipment.yonga_seti,
                                            width,
                                            false,
                                          ),
                                    showListItem(
                                        "CPU Frekansı",
                                        basicEquipment.cpu_frekansi,
                                        width,
                                        false),
                                    basicEquipment.cpu_cekirdek_point == cpuMax
                                        ? showListItem(
                                            "CPU Çekirdeği",
                                            basicEquipment.cpu_cekirdek,
                                            width,
                                            true)
                                        : showListItem(
                                            "CPU Çekirdeği",
                                            basicEquipment.cpu_cekirdek,
                                            width,
                                            false),
                                    showListItem(
                                        "Ana İşlemci (CPU)",
                                        basicEquipment.ana_islemci,
                                        width,
                                        false),
                                    showListItem(
                                        "I. Yardımcı İşlemci",
                                        basicEquipment.I_yard_islemci,
                                        width,
                                        false),
                                    showListItem(
                                        "II. Yardımcı İşlemci",
                                        basicEquipment.II_yard_islemci,
                                        width,
                                        false),
                                    showListItem(
                                        "İşlemci Mimarisi",
                                        basicEquipment.islemci_mimarisi,
                                        width,
                                        false),
                                    showListItem(
                                        "Grafik İşlemcisi (GPU)",
                                        basicEquipment.grafik_islemcisi,
                                        width,
                                        false),
                                    basicEquipment
                                                .cpu_uretim_teknolojisi_point ==
                                            teknolojiMax
                                        ? showListItem(
                                            "CPU Üretim Teknolojisi",
                                            basicEquipment
                                                .cpu_uretim_teknolojisi,
                                            width,
                                            true)
                                        : showListItem(
                                            "CPU Üretim Teknolojisi",
                                            basicEquipment
                                                .cpu_uretim_teknolojisi,
                                            width,
                                            false),
                                    basicEquipment.ram_bellek_point == ramMax
                                        ? showListItem(
                                            "Bellek (RAM)",
                                            basicEquipment.bellek_ram,
                                            width,
                                            true)
                                        : showListItem(
                                            "Bellek (RAM)",
                                            basicEquipment.bellek_ram,
                                            width,
                                            false),
                                    showListItem("RAM Tipi",
                                        basicEquipment.ram_tipi, width, false),
                                    showListItem(
                                        "Dahili Depolama",
                                        basicEquipment.dahili_depolama,
                                        width,
                                        false),
                                    showListItem(
                                        "Dahili Depolama Biçimi",
                                        basicEquipment.dahili_depolama_bicimi,
                                        width,
                                        false),
                                    showListItem(
                                        "Hafıza Kartı Desteği",
                                        basicEquipment.hafiza_karti_destegi,
                                        width,
                                        false),
                                    showListItem(
                                        "Diğer Bellek (RAM) Seçenekleri",
                                        basicEquipment
                                            .diger_bellek_ram_secenekleri,
                                        width,
                                        false),
                                    showListItem(
                                        "Diğer Hafıza Seçenekleri",
                                        basicEquipment.diger_hafiza_secenekleri,
                                        width,
                                        false),
                                    showListItem(
                                        "Diğer Chipset Seçenekleri",
                                        basicEquipment
                                            .diger_chipset_secenekleri,
                                        width,
                                        false),
                                    showListItem(
                                        "Antutu puani v7",
                                        basicEquipment.antutu_puani_v7,
                                        width,
                                        false),
                                    showListItem(
                                        "Antutu puani v8",
                                        basicEquipment.antutu_puani_v8,
                                        width,
                                        false),
                                    showListItem(
                                        "Antutu puani v9",
                                        basicEquipment.antutu_puani_v9,
                                        width,
                                        false),
                                  ],
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 235, 234, 245),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                            ),
                          )
                        : const Center(),
                    batary != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    const Center(
                                        child: Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons
                                                  .battery_charging_full_outlined,
                                            )),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Batarya",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )),
                                    showListItem(
                                        "Batarya Kapasitesi",
                                        batary.batarya_kapasitesi,
                                        width,
                                        false),
                                    showListItem(
                                        "Batarya Teknolojisi",
                                        batary.batarya_teknolojisi,
                                        width,
                                        false),
                                    showListItem("Değişir Batarya",
                                        batary.degisir_batarya, width, false),
                                    showListItem("Hızlı Şarj",
                                        batary.hizli_sarj, width, false),
                                    batary.hizli_sarj_gucu_point == bataryMax
                                        ? showListItem("Hızlı Şarj Gücü",
                                            batary.hizli_sarj_gucu, width, true)
                                        : showListItem(
                                            "Hızlı Şarj Gücü",
                                            batary.hizli_sarj_gucu,
                                            width,
                                            false),
                                    showListItem(
                                        "Hızlı Şarj Özellikleri",
                                        batary.hizli_sarj_ozellikleri,
                                        width,
                                        false),
                                    showListItem(
                                        "İnternet Kullanımı 3G",
                                        batary.internet_kullanimi_3g,
                                        width,
                                        false),
                                    showListItem(
                                        "İnternet Kullanımı 4G",
                                        batary.internet_kullanimi_4g,
                                        width,
                                        false),
                                    showListItem(
                                        "İnternet Kullanımı Wifi",
                                        batary.internet_kullanimi_wifi,
                                        width,
                                        false),
                                    showListItem("Kablosuz Şarj",
                                        batary.kablosuz_sarj, width, false),
                                    showListItem(
                                        "Kablosuz Şarj Özellikleri",
                                        batary.kablosuz_sarj_ozellikleri,
                                        width,
                                        false),
                                    showListItem("Konuşma Süresi",
                                        batary.konusma_suresi, width, false),
                                    showListItem(
                                        "Sarj", batary.sarj, width, false),
                                    showListItem("Video Oynatma",
                                        batary.video_oynatma, width, false),
                                  ],
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 235, 234, 245),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                            ),
                          )
                        : const Center(),
                    camera != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    const Center(
                                        child: Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.camera_alt_outlined,
                                            )),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Kamera",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )),
                                    camera.camera_cozunurlugu_point ==
                                            cameraCozunurlukMax
                                        ? showListItem(
                                            "Kamera Çözünürlüğü",
                                            camera.kamera_conuzurlugu,
                                            width,
                                            true)
                                        : showListItem(
                                            "Kamera Çözünürlüğü",
                                            camera.kamera_conuzurlugu,
                                            width,
                                            false),
                                    showListItem(
                                        "Kamera Özellikleri",
                                        camera.kamera_ozellikleri,
                                        width,
                                        false),
                                    showListItem(
                                        "Ağır Çekim Kayıt Seçenekleri",
                                        camera.agir_cekim_kayit_secenekleri,
                                        width,
                                        false),
                                    camera.camera_diyafram_acikligi_point ==
                                            cameraDiyaframMax
                                        ? showListItem(
                                            "Diyafram Açıklığı",
                                            camera.diyafram_acikligi,
                                            width,
                                            true)
                                        : showListItem(
                                            "Diyafram Açıklığı",
                                            camera.diyafram_acikligi,
                                            width,
                                            false),
                                    showListItem(
                                        "Diyafram Açıklığı (MAX)",
                                        camera.diyafram_acikligi_max,
                                        width,
                                        false),
                                    showListItem(
                                        "Flaş", camera.flas, width, false),
                                    showListItem(
                                        "Optik Görüntü Sabitleyici",
                                        camera.optik_goruntu_sabitleyici,
                                        width,
                                        false),
                                    showListItem(
                                        "Ön Kamera Çözünürlüğü",
                                        camera.on_kamera_cozunurlugu,
                                        width,
                                        false),
                                    showListItem(
                                        "Ön Kamera Diyafram",
                                        camera.on_kamera_diyaframi,
                                        width,
                                        false),
                                    showListItem(
                                        "Ön Kamera Fps Değeri",
                                        camera.on_kamera_fps_degeri,
                                        width,
                                        false),
                                    showListItem(
                                        "Ön Kamera Özellikleri",
                                        camera.on_kamera_ozellikleri,
                                        width,
                                        false),
                                    showListItem(
                                        "Ön Kamera Video Çözünürlüğü",
                                        camera.on_kamera_video_cozunurlugu,
                                        width,
                                        false),
                                    showListItem(
                                        "İkinci Arka Kamera",
                                        camera.ikinci_arka_kamera,
                                        width,
                                        false),
                                    showListItem(
                                        "İkinci Arka Kamera Çözünürlüğü",
                                        camera.ikinci_arka_kamera_cozunurlugu,
                                        width,
                                        false),
                                    showListItem(
                                        "İkinci Arka Kamera Diyafram",
                                        camera.ikinci_arka_kamera_diyaframi,
                                        width,
                                        false),
                                    showListItem(
                                        "İkinci Arka Kamera Özellikleri",
                                        camera.ikinci_arka_kamera_ozellikleri,
                                        width,
                                        false),
                                    showListItem("İkinci Ön Kamera",
                                        camera.ikinci_on_kamera, width, false),
                                    showListItem(
                                        "İkinci Ön Kamera Çözünürlüğü",
                                        camera.ikinci_on_kamera_cozunurlugu,
                                        width,
                                        false),
                                    showListItem(
                                        "İkinci Ön Kamera Diyafram",
                                        camera.ikinci_on_kamera_diyaframi,
                                        width,
                                        false),
                                    showListItem(
                                        "İkinci Ön Kamera Özellikleri",
                                        camera.ikinci_on_kamera_ozellikleri,
                                        width,
                                        false),
                                    showListItem(
                                        "Üçüncü Arka Kamera",
                                        camera.ucuncu_arka_kamera,
                                        width,
                                        false),
                                    showListItem(
                                        "Üçüncü Arka Kamera Çözünürlüğü",
                                        camera.ucuncu_arka_kamera_cozunurlugu,
                                        width,
                                        false),
                                    showListItem(
                                        "Üçüncü Arka Kamera Diyafram",
                                        camera.ucuncu_arka_kamera_diyaframi,
                                        width,
                                        false),
                                    showListItem(
                                        "Üçüncü Arka Kamera Özellikleri",
                                        camera.ucuncu_arka_kamera_ozellikleri,
                                        width,
                                        false),
                                    camera.camera_video_fps_point == videoMax
                                        ? showListItem(
                                            "Video FPS değeri",
                                            camera.video_fps_degeri,
                                            width,
                                            true)
                                        : showListItem(
                                            "Video FPS değeri",
                                            camera.video_fps_degeri,
                                            width,
                                            false),
                                    camera.camera_video_kayit_point ==
                                            cameraVideoKayitMax
                                        ? showListItem(
                                            "Video Kayıt Çözünürlüğü",
                                            camera.video_kayit_cozunurlugu,
                                            width,
                                            true)
                                        : showListItem(
                                            "Video Kayıt Çözünürlüğü",
                                            camera.video_kayit_cozunurlugu,
                                            width,
                                            false),
                                    showListItem(
                                        "Video Kayıt Özellikleri",
                                        camera.video_kayit_ozellikleri,
                                        width,
                                        false),
                                    showListItem(
                                        "Video Kayıt Seçenekleri",
                                        camera.video_kayit_secenekleri,
                                        width,
                                        false),
                                    showListItem("Dxomark V2",
                                        camera.dxomark_v2, width, false),
                                    showListItem("Dxomark V3",
                                        camera.dxomark_v3, width, false),
                                    showListItem("Dxomark V4",
                                        camera.dxomark_v4, width, false),
                                  ],
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 235, 234, 245),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                            ),
                          )
                        : const Center(),
                    design != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    const Center(
                                        child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.palette_outlined),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Dizayn",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )),
                                    showListItem(
                                        "En", design.en!, width, false),
                                    showListItem(
                                        "Boy", design.boy!, width, false),
                                    showListItem("Ağırlık", design.agirlik!,
                                        width, false),
                                    showListItem("Kalınlık", design.kalanlik!,
                                        width, false),
                                    showListItem("Renk Seçenekleri",
                                        design.renk_senecekleri!, width, false),
                                    showListItem(
                                        "Gövde Malzemesi (ÇERÇEVE)",
                                        design.govde_malzemesi_cerceve!,
                                        width,
                                        false),
                                    showListItem(
                                        "Gövde Malzemesi (KAPAK)",
                                        design.govde_malzemesi_kapak!,
                                        width,
                                        false),
                                  ],
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 235, 234, 245),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                            ),
                          )
                        : const Center(),
                    networkConnection != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    const Center(
                                        child: Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(
                                                Icons.phonelink_ring_outlined)),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Ağ Bağlantısı",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )),
                                    showListItem("5G", networkConnection.five_g,
                                        width, false),
                                    showListItem("4G", networkConnection.four_g,
                                        width, false),
                                    showListItem(
                                        "4G Frekans Notu",
                                        networkConnection.four_g_frekans_notu,
                                        width,
                                        false),
                                    showListItem(
                                        "4G Frekansları",
                                        networkConnection.four_g_frekanslari,
                                        width,
                                        false),
                                    showListItem(
                                        "4G İndirme",
                                        networkConnection.four_g_indirme,
                                        width,
                                        false),
                                    showListItem(
                                        "4G Karşı Yükleme",
                                        networkConnection.four_g_karsi_yukleme,
                                        width,
                                        false),
                                    showListItem(
                                        "4G Özellikleri",
                                        networkConnection.four_g_ozellikleri,
                                        width,
                                        false),
                                    showListItem(
                                        "4G Teknolojisi",
                                        networkConnection.four_g_teknolojisi,
                                        width,
                                        false),
                                    showListItem(
                                        "4,5G Desteği",
                                        networkConnection.four_half_g_destegi,
                                        width,
                                        false),
                                    showListItem(
                                        "3G",
                                        networkConnection.three_g,
                                        width,
                                        false),
                                    showListItem(
                                        "3G Frekansları",
                                        networkConnection.three_g_frekans,
                                        width,
                                        false),
                                    showListItem(
                                        "3G İndirme",
                                        networkConnection.three_g_indirme,
                                        width,
                                        false),
                                    showListItem(
                                        "3G Karşı Yükleme",
                                        networkConnection.three_g_karsi_yukleme,
                                        width,
                                        false),
                                    showListItem(
                                        "3G Teknolojisi",
                                        networkConnection.three_g_teknolojisi,
                                        width,
                                        false),
                                    showListItem("2G", networkConnection.two_g,
                                        width, false),
                                    showListItem(
                                        "2G Frekansları",
                                        networkConnection.two_g_frekans,
                                        width,
                                        false),
                                    showListItem(
                                        "2G Teknolojisi",
                                        networkConnection.two_g_teknolojisi,
                                        width,
                                        false),
                                  ],
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 235, 234, 245),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                            ),
                          )
                        : const Center(),
                    operationSystem != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    const Center(
                                        child: Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.phonelink_setup_outlined,
                                            )),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "İşletim Sistemi",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )),
                                    showListItem(
                                        "İşletim Sistemi",
                                        operationSystem.isletim_sistemi,
                                        width,
                                        false),
                                    showListItem(
                                        "İşletim Sistemi Versiyonu",
                                        operationSystem
                                            .isletim_sistemi_versiyonu,
                                        width,
                                        false),
                                    showListItem(
                                        "Kullanıcı Arayüzü",
                                        operationSystem.kullanici_arayuzu,
                                        width,
                                        false),
                                    showListItem(
                                        "Kullanıcı Arayüzü Versiyonu",
                                        operationSystem
                                            .kullanici_arayuzu_versiyonu,
                                        width,
                                        false),
                                    showListItem(
                                        "Yükseltilebilir Versiyon",
                                        operationSystem
                                            .yukseltilebilir_versiyon,
                                        width,
                                        false),
                                    showListItem(
                                        "Planlanan Yükseltilebilir Versiyon",
                                        operationSystem
                                            .planlanan_yukseltilebilir_versiyon,
                                        width,
                                        false),
                                  ],
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 235, 234, 245),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                            ),
                          )
                        : const Center(),
                    wifiConnection != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    const Center(
                                        child: Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.wifi_tethering_outlined,
                                            )),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Wifi Bağlantısı",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )),
                                    showListItem(
                                        "Wifi özellikleri",
                                        wifiConnection.wifi_ozellikleri,
                                        width,
                                        false),
                                    showListItem(
                                        "Wifi Kanalları",
                                        wifiConnection.wifi_kanallari,
                                        width,
                                        false),
                                    showListItem(
                                        "Bluetooth Özellikleri",
                                        wifiConnection.bluetooth_ozellikleri,
                                        width,
                                        false),
                                    showListItem(
                                        "Bluetooth Versiyonu",
                                        wifiConnection.bluetooth_versiyonu,
                                        width,
                                        false),
                                    showListItem(
                                        "Kızıl Ötesi",
                                        wifiConnection.kizil_otesi,
                                        width,
                                        false),
                                    showListItem(
                                        "Navigasyon Özellikleri",
                                        wifiConnection.navigasyon_ozellikleri,
                                        width,
                                        false),
                                    showListItem("NFC", wifiConnection.nfc,
                                        width, false),
                                  ],
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 235, 234, 245),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                            ),
                          )
                        : const Center(),
                    multiMedia != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    const Center(
                                        child: Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.music_video_outlined,
                                            )),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Çoklu Ortam",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )),
                                    showListItem("Radyo", multiMedia.radyo,
                                        width, false),
                                    multiMedia.hoparlor_point == hoparlorMax
                                        ? showListItem(
                                            "Hoparlör özellikleri",
                                            multiMedia.hoparlor_ozellikleri,
                                            width,
                                            true)
                                        : showListItem(
                                            "Hoparlör özellikleri",
                                            multiMedia.hoparlor_ozellikleri,
                                            width,
                                            false),
                                    showListItem("Ses Çıkışı",
                                        multiMedia.ses_cikisi, width, false),
                                  ],
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 235, 234, 245),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                            ),
                          )
                        : const Center(),
                    features != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    const Center(
                                        child: Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.fingerprint_outlined,
                                            )),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Özellikler",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )),
                                    showListItem("Bildirim Işığı",
                                        features.bildirim_isigi, width, false),
                                    showListItem(
                                        "Görüntülü Konuşma",
                                        features.goruntulu_konusma,
                                        width,
                                        false),
                                    showListItem("Kutu İçeriği",
                                        features.kutu_icerigi, width, false),
                                    showListItem(
                                        "Parmak İzi Okuyucu",
                                        features.parmak_izi_okuyucu,
                                        width,
                                        false),
                                    showListItem(
                                        "Sar Değeri 10g (BAŞ)",
                                        features.sar_degeri_teng_bas,
                                        width,
                                        false),
                                    showListItem(
                                        "Sar Değeri 10g (VÜCUT)",
                                        features.sar_degeri_teng_vucut,
                                        width,
                                        false),
                                    showListItem("Sensörler",
                                        features.sensorler, width, false),
                                    showListItem(
                                        "Servis Ve Uygulamalar",
                                        features.servis_ve_uygulamalar,
                                        width,
                                        false),
                                    showListItem(
                                        "Suya Dayanıklılık",
                                        features.suya_dayaniklilik,
                                        width,
                                        false),
                                    showListItem(
                                        "Suya Dayanıklılık Seviyesi",
                                        features.suya_dayaniklilik_seviyesi,
                                        width,
                                        false),
                                    showListItem(
                                        "3G Görüntülü Arama Şebeke",
                                        features.three_g_goruntulu_arama_sebeke,
                                        width,
                                        false),
                                    showListItem(
                                        "Toza Dayanıklılık",
                                        features.toza_dayaniklilik,
                                        width,
                                        false),
                                    showListItem(
                                        "Toza Dayanıklılık Seviyesi",
                                        features.toza_dayaniklilik_seviyesi,
                                        width,
                                        false),
                                  ],
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 235, 234, 245),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                            ),
                          )
                        : const Center(),
                    otherFeatures != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    const Center(
                                        child: Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.swap_calls_outlined,
                                            )),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Diğer Bağlantılar",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )),
                                    showListItem("Hat Sayısı",
                                        otherFeatures.hat_sayisi, width, false),
                                    showListItem(
                                        "Sim", otherFeatures.sim, width, false),
                                    showListItem(
                                        "USB Bağlantı Tipi",
                                        otherFeatures.usb_baglanti_tipi,
                                        width,
                                        false),
                                    showListItem(
                                        "USB Özellikleri",
                                        otherFeatures.usb_ozellikleri,
                                        width,
                                        false),
                                    showListItem(
                                        "USB Versiyonu",
                                        otherFeatures.usb_versiyonu,
                                        width,
                                        false),
                                  ],
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 235, 234, 245),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                            ),
                          )
                        : const Center(),
                    mainInformation != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    const Center(
                                        child: Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.import_contacts_outlined,
                                            )),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Temel Bilgiler",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )),
                                    showListItem(
                                        "Çıkış Yılı",
                                        mainInformation.cikis_yili,
                                        width,
                                        false),
                                    showListItem(
                                        "Duyurulma Tarihi",
                                        mainInformation.duyurulma_tarihi,
                                        width,
                                        false),
                                    showListItem(
                                        "Kullanım Klavuzu",
                                        mainInformation.kullanim_kilavuzu,
                                        width,
                                        false),
                                  ],
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 235, 234, 245),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      bottomLeft: Radius.circular(40),
                                      bottomRight: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                            ),
                          )
                        : const Center()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width / 3,
                      child: FadeAnimation(
                        delay: 0.5,
                        child: Text(
                          details.title,
                          maxLines: 2,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ),
                    details.title.length < 20 ? const Text("") : const Center(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeAnimation(
                            delay: 0.7,
                            child: Text("• " + screen.screenSize!,
                                style: TextStyle(color: textColor)),
                          ),
                          FadeAnimation(
                            delay: 1,
                            child: Text("• " + batary.batarya_kapasitesi!,
                                style: TextStyle(color: textColor)),
                          ),
                          FadeAnimation(
                            delay: 1.3,
                            child: Text("• " + basicEquipment.dahili_depolama!,
                                style: TextStyle(color: textColor)),
                          ),
                          FadeAnimation(
                            delay: 1.6,
                            child: Text("• " + basicEquipment.bellek_ram!,
                                style: TextStyle(color: textColor)),
                          ),
                          FadeAnimation(
                            delay: 2,
                            child: Row(
                              children: [
                                details.priceList!.isNotEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                            "₺" +
                                                details.priceList![0]
                                                        ["urun_fiyat"]
                                                    .toString(),
                                            style: const TextStyle(
                                                color: Colors.white)))
                                    : const Opacity(
                                        opacity: 0,
                                        child: Text(
                                          "1234567891012",
                                        ),
                                      ),
                                Image.network(
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                          height: 100,
                                          width: 50,
                                          child: const Center(
                                            child: Icon(
                                                Icons.phone_android_outlined),
                                          )),
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                  decoded,
                                  height: 100,
                                  width: 50,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget showListItem(String s, String? en, double width, bool bool) {
    if (en != null) {
      if (en.isNotEmpty) {
        return FadeAnimation(
          delay: 1,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              color: Colors.grey.shade300,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: width / 2,
                      child: Text(
                        s,
                        style: TextStyle(
                          color: listItemTextColor,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: width / 2,
                      child: Text(
                        en,
                        style: TextStyle(
                            color: listItemTextColor,
                            fontSize: fontSize,
                            fontWeight:
                                bool ? FontWeight.bold : FontWeight.normal),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      } else {
        return const Center();
      }
    } else {
      return const Center();
    }
  }
}
