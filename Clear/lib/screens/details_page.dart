import 'dart:convert';
import 'package:compare_app/models/comment.dart';
import 'package:compare_app/screens/comment.dart';
import 'package:compare_app/widgets/fadeanimation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
import 'package:compare_app/models/phone_model.dart';
import 'package:compare_app/models/price_details.dart';
import 'package:compare_app/models/screen_details.dart';
import 'package:compare_app/models/wifi_connection.dart';
import 'package:compare_app/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String id;

  const DetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Details? _allDetails;
  Phones? _phone;
  List<CommentModel> data = [];
  List<PriceDetails> priceList = [];
  List bigPictureList = [];
  final textColor = Colors.black;
  final fontSize = 15.0;

  var myBackgrounColor;
  var myButtonColor;
  var myTextColor;
  //ads
  late BannerAd _bannerAd;
  var _messageController = TextEditingController();
  bool _isLoading = false;
  String? message;

  bool _isBannerAdReady = false;

  int current = 0;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    getFirebaseData(widget.id);
    getPhones(widget.id);
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-9241755428967871/7646811685',
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          print("Failed to load Ad banner: " + error.toString());
          _isBannerAdReady = false;
          ad.dispose();
        }),
        request: const AdRequest())
      ..load();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var _height = 300.0;
    var title = "";
    var decoded_1 = "";
    var decoded_2 = "";
    var decoded_3 = "";
    var minImage1 = "";
    var minImage2 = "";
    var minImage3 = "";
    myBackgrounColor = Theme.of(context).primaryColor;
    myButtonColor = Theme.of(context).colorScheme.secondary;
    myTextColor = Theme.of(context).focusColor;
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
    if (_allDetails != null) {
      design = Design.fromMap(_allDetails!.design!);
      basicEquipment = BasicEquipment.fromMap(_allDetails!.basicEquipment!);
      batary = Batary.fromMap(_allDetails!.batary!);
      camera = Camera.fromMap(_allDetails!.camera!);
      screen = Screen.fromMap(_allDetails!.screen!);
      networkConnection =
          NetworkConnection.fromMap(_allDetails!.networkConnections!);
      operationSystem = OperationSystem.fromMap(_allDetails!.os!);
      wifiConnection = WifiConnection.fromMap(_allDetails!.wirelessConnection!);
      multiMedia = MultiMedia.fromMap(_allDetails!.multiMedia!);
      features = Features.fromMap(_allDetails!.feature!);
      otherFeatures = OtherFeatures.fromMap(_allDetails!.otherConnections!);
      mainInformation = MainInformation.fromMap(_allDetails!.basicKnowledge!);

      title = _allDetails!.title;
      if (_allDetails!.minPicture!.isNotEmpty &&
          _allDetails!.bigPicture!.isNotEmpty) {
        Codec<String, String> stringToBase64 = utf8.fuse(base64);

        var big_1 = _allDetails!.bigPicture![0];
        var big_2 = _allDetails!.bigPicture![1];
        var big_3 = _allDetails!.bigPicture![2];
        decoded_1 = stringToBase64.decode(big_1);
        decoded_2 = stringToBase64.decode(big_2);
        decoded_3 = stringToBase64.decode(big_3);
        var bigPictureList = [decoded_1 + decoded_2 + decoded_3];

        var min1 = _allDetails!.minPicture![0];
        minImage1 = stringToBase64.decode(min1);

        var min2 = _allDetails!.minPicture![1];
        minImage2 = stringToBase64.decode(min2);

        var min3 = _allDetails!.minPicture![2];
        minImage3 = stringToBase64.decode(min3);
      }
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: false).push(
            MaterialPageRoute(
              builder: ((context) => CommentPage(
                    id: _allDetails!.id,
                    phoneName: _allDetails!.title,
                    type: "phone",
                  )),
            ),
          );
        },
        child: Icon(Icons.chat_outlined),
      ),
      body: _allDetails != null
          ? CustomScrollView(
              slivers: [
                SliverAppBar(
                    pinned: true,
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    expandedHeight: 325,
                    flexibleSpace: FlexibleSpaceBar(
                        title: title.isNotEmpty
                            ? FadeAnimation(
                                delay: 1,
                                child: Text(
                                  _allDetails!.title.length > 30
                                      ? _allDetails!.title.substring(0, 30) +
                                          '...'
                                      : _allDetails!.title,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 2, 1, 2),
                                      fontSize: 15),
                                ),
                              )
                            : const Text(""),
                        centerTitle: true,
                        background: _phone != null
                            ? Stack(
                                children: [
                                  ClipPath(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.4),
                                              Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ],
                                            begin: const FractionalOffset(
                                                0.0, 0.0),
                                            end: const FractionalOffset(
                                                1.0, 0.0),
                                            stops: const [0.0, 1.0],
                                            tileMode: TileMode.clamp),
                                      ),
                                    ),
                                    clipper: ShapeClipper([
                                      Offset(width / 5, _height - 500),
                                      Offset(width / 1.5, _height - 30),
                                      Offset(width / 5 * 4, _height + 20),
                                      Offset(width, _height - 18)
                                    ]),
                                  ),
                                  ClipPath(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              const Color.fromARGB(
                                                      255, 51, 6, 173)
                                                  .withOpacity(0.4),
                                              const Color.fromARGB(
                                                      255, 223, 232, 245)
                                                  .withOpacity(0.4),
                                            ],
                                            begin: const FractionalOffset(
                                                0.0, 0.0),
                                            end: const FractionalOffset(
                                                1.0, 0.0),
                                            stops: const [0.0, 1.0],
                                            tileMode: TileMode.clamp),
                                      ),
                                    ),
                                    clipper: ShapeClipper([
                                      Offset(width / 5, _height - 490),
                                      Offset(width / 1.5, _height - 30),
                                      Offset(width / 5 * 4, _height + 30),
                                      Offset(width, _height)
                                    ]),
                                  ),
                                  ClipPath(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(255, 105, 59, 165),
                                              Color.fromARGB(
                                                  255, 238, 240, 243),
                                            ],
                                            begin: FractionalOffset(0.0, 0.0),
                                            end: FractionalOffset(1.0, 0.0),
                                            stops: [0.0, 1.0],
                                            tileMode: TileMode.clamp),
                                      ),
                                    ),
                                    clipper: ShapeClipper([
                                      Offset(width / 10, _height - 490),
                                      Offset(width / 1.5, _height - 80),
                                      Offset(width / 5 * 4, _height + 20),
                                      Offset(width, _height - 18)
                                    ]),
                                  ),
                                  Positioned(
                                    left: 70,
                                    bottom: 50,
                                    top: 90,
                                    child: FadeAnimation(
                                      delay: 0.5,
                                      child: Container(
                                        width: 100,
                                        child: CarouselSlider(
                                          items: [
                                            decoded_1.isNotEmpty
                                                ? Image.network(
                                                    decoded_1,
                                                    fit: BoxFit.cover,
                                                  )
                                                : const CircularProgressIndicator(),
                                            decoded_2.isNotEmpty
                                                ? Image.network(
                                                    decoded_2,
                                                    fit: BoxFit.cover,
                                                  )
                                                : const CircularProgressIndicator(),
                                            decoded_3.isNotEmpty
                                                ? Image.network(
                                                    decoded_3,
                                                    fit: BoxFit.cover,
                                                  )
                                                : const CircularProgressIndicator()
                                          ],
                                          options: CarouselOptions(
                                              height: 125,
                                              autoPlay: true,
                                              enlargeCenterPage: true,
                                              enableInfiniteScroll: false,
                                              enlargeStrategy:
                                                  CenterPageEnlargeStrategy
                                                      .height,
                                              autoPlayInterval:
                                                  const Duration(seconds: 2)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 50,
                                    bottom: 50,
                                    top: 130,
                                    child: Column(
                                      children: [
                                        FadeAnimation(
                                            delay: 0.5,
                                            child: Text(_phone!.screenSize)),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          child: FadeAnimation(
                                              delay: 1,
                                              child: Text(_phone!.ram)),
                                        ),
                                        FadeAnimation(
                                            delay: 1.5,
                                            child:
                                                Text(_phone!.internalStorage)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: FadeAnimation(
                                              delay: 2,
                                              child: Text(
                                                  _phone!.batteryCapacity)),
                                        ),
                                        _phone!.priceStr.length > 1
                                            ? FadeAnimation(
                                                delay: 2.5,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30),
                                                  child: Text(
                                                    "${_phone!.priceStr} ₺",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            : const Text(""),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : const Center(
                                child: CircularProgressIndicator()))),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: _allDetails != null
                          ? FadeAnimation(
                              delay: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _allDetails!.priceList!.isNotEmpty
                                      ? Container(
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 235, 234, 245),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(40),
                                                  bottomLeft:
                                                      Radius.circular(40),
                                                  bottomRight:
                                                      Radius.circular(40),
                                                  topRight:
                                                      Radius.circular(40))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: ListView.builder(
                                              itemBuilder: (context, index) {
                                                return FadeAnimation(
                                                    delay: 0.5,
                                                    child:
                                                        priceListItems(index));
                                              },
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: _allDetails!
                                                          .priceList!.length >
                                                      6
                                                  ? 6
                                                  : _allDetails!
                                                      .priceList!.length,
                                            ),
                                          ),
                                        )
                                      : const Center(),
                                  if (_isBannerAdReady)
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Center(
                                        child: Container(
                                          height:
                                              _bannerAd.size.height.toDouble(),
                                          child: AdWidget(ad: _bannerAd),
                                        ),
                                      ),
                                    ),
                                  screen != null
                                      ? FadeAnimation(
                                          delay: 1.5,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  children: [
                                                    const Center(
                                                        child: Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Icon(
                                                              Icons
                                                                  .phone_android_outlined,
                                                            )),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            "Ekran",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                                    showListItem(
                                                        "Ekran Boyutu",
                                                        screen.screenSize,
                                                        width),
                                                    showListItem(
                                                        "Ekran Teknolojisi",
                                                        screen.screenTechnology,
                                                        width),
                                                    showListItem(
                                                        "Ekran Çözünürlüğü",
                                                        screen.screenResolition,
                                                        width),
                                                    showListItem(
                                                        "Ekran Çözünürlüğü Standartı",
                                                        screen
                                                            .screenResolitionStandart,
                                                        width),
                                                    showListItem(
                                                        "Dokunmatik Türü",
                                                        screen.touchType,
                                                        width),
                                                    showListItem(
                                                        "Ekran Yenileme Hızı",
                                                        screen
                                                            .screenRefreshSpeed,
                                                        width),
                                                    showListItem(
                                                        "Ekran Oranı",
                                                        screen.screenRatio,
                                                        width),
                                                    showListItem(
                                                        "Ekran Özellikleri",
                                                        screen.screenFeatures,
                                                        width),
                                                    showListItem(
                                                        "Ekran Dayanıklılığı",
                                                        screen.screenDurabilty,
                                                        width),
                                                    showListItem(
                                                        "Ekran/Gövde Oranı",
                                                        screen.screenBodyRatio,
                                                        width),
                                                    showListItem(
                                                        "Ekran Alanı",
                                                        screen.screenArea,
                                                        width),
                                                    showListItem(
                                                        "Pixel Yoğunluğu",
                                                        screen.pixsel,
                                                        width),
                                                    showListItem(
                                                        "Renk Sayısı",
                                                        screen.nunmberOfColor,
                                                        width),
                                                  ],
                                                ),
                                              ),
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 235, 234, 245),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(40),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  40),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  40),
                                                          topRight:
                                                              Radius.circular(
                                                                  40))),
                                            ),
                                          ),
                                        )
                                      : const Center(),
                                  basicEquipment != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  const Center(
                                                      child: Row(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Icon(
                                                            Icons
                                                                .sd_card_outlined,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "Donanım",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                                  showListItem(
                                                      "Yonga Seti (Chipset)",
                                                      basicEquipment.yonga_seti,
                                                      width),
                                                  showListItem(
                                                      "CPU Frekansı",
                                                      basicEquipment
                                                          .cpu_frekansi,
                                                      width),
                                                  showListItem(
                                                      "CPU Çekirdeği",
                                                      basicEquipment
                                                          .cpu_cekirdek,
                                                      width),
                                                  showListItem(
                                                      "Ana İşlemci (CPU)",
                                                      basicEquipment
                                                          .ana_islemci,
                                                      width),
                                                  showListItem(
                                                      "I. Yardımcı İşlemci",
                                                      basicEquipment
                                                          .I_yard_islemci,
                                                      width),
                                                  showListItem(
                                                      "II. Yardımcı İşlemci",
                                                      basicEquipment
                                                          .II_yard_islemci,
                                                      width),
                                                  showListItem(
                                                      "İşlemci Mimarisi",
                                                      basicEquipment
                                                          .islemci_mimarisi,
                                                      width),
                                                  showListItem(
                                                      "Grafik İşlemcisi (GPU)",
                                                      basicEquipment
                                                          .grafik_islemcisi,
                                                      width),
                                                  showListItem(
                                                      "CPU Üretim Teknolojisi",
                                                      basicEquipment
                                                          .cpu_uretim_teknolojisi,
                                                      width),
                                                  showListItem(
                                                      "Bellek (RAM)",
                                                      basicEquipment.bellek_ram,
                                                      width),
                                                  showListItem(
                                                      "RAM Tipi",
                                                      basicEquipment.ram_tipi,
                                                      width),
                                                  showListItem(
                                                      "Dahili Depolama",
                                                      basicEquipment
                                                          .dahili_depolama,
                                                      width),
                                                  showListItem(
                                                      "Dahili Depolama Biçimi",
                                                      basicEquipment
                                                          .dahili_depolama_bicimi,
                                                      width),
                                                  showListItem(
                                                      "Hafıza Kartı Desteği",
                                                      basicEquipment
                                                          .hafiza_karti_destegi,
                                                      width),
                                                  showListItem(
                                                      "Diğer Bellek (RAM) Seçenekleri",
                                                      basicEquipment
                                                          .diger_bellek_ram_secenekleri,
                                                      width),
                                                  showListItem(
                                                      "Diğer Hafıza Seçenekleri",
                                                      basicEquipment
                                                          .diger_hafiza_secenekleri,
                                                      width),
                                                  showListItem(
                                                      "Diğer Chipset Seçenekleri",
                                                      basicEquipment
                                                          .diger_chipset_secenekleri,
                                                      width),
                                                  showListItem(
                                                      "Antutu puani v7",
                                                      basicEquipment
                                                          .antutu_puani_v7,
                                                      width),
                                                  showListItem(
                                                      "Antutu puani v8",
                                                      basicEquipment
                                                          .antutu_puani_v8,
                                                      width),
                                                  showListItem(
                                                      "Antutu puani v9",
                                                      basicEquipment
                                                          .antutu_puani_v9,
                                                      width),
                                                ],
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 234, 245),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    bottomLeft:
                                                        Radius.circular(40),
                                                    bottomRight:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(40))),
                                          ),
                                        )
                                      : const Center(),
                                  batary != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  const Center(
                                                      child: Row(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Icon(
                                                            Icons
                                                                .battery_charging_full_outlined,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "Batarya",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                                  showListItem(
                                                      "Batarya Kapasitesi",
                                                      batary.batarya_kapasitesi,
                                                      width),
                                                  showListItem(
                                                      "Batarya Teknolojisi",
                                                      batary
                                                          .batarya_teknolojisi,
                                                      width),
                                                  showListItem(
                                                      "Değişir Batarya",
                                                      batary.degisir_batarya,
                                                      width),
                                                  showListItem("Hızlı Şarj",
                                                      batary.hizli_sarj, width),
                                                  showListItem(
                                                      "Hızlı Şarj Gücü",
                                                      batary.hizli_sarj_gucu,
                                                      width),
                                                  showListItem(
                                                      "Hızlı Şarj Özellikleri",
                                                      batary
                                                          .hizli_sarj_ozellikleri,
                                                      width),
                                                  showListItem(
                                                      "İnternet Kullanımı 3G",
                                                      batary
                                                          .internet_kullanimi_3g,
                                                      width),
                                                  showListItem(
                                                      "İnternet Kullanımı 4G",
                                                      batary
                                                          .internet_kullanimi_4g,
                                                      width),
                                                  showListItem(
                                                      "İnternet Kullanımı Wifi",
                                                      batary
                                                          .internet_kullanimi_wifi,
                                                      width),
                                                  showListItem(
                                                      "Kablosuz Şarj",
                                                      batary.kablosuz_sarj,
                                                      width),
                                                  showListItem(
                                                      "Kablosuz Şarj Özellikleri",
                                                      batary
                                                          .kablosuz_sarj_ozellikleri,
                                                      width),
                                                  showListItem(
                                                      "Konuşma Süresi",
                                                      batary.konusma_suresi,
                                                      width),
                                                  showListItem("Sarj",
                                                      batary.sarj, width),
                                                  showListItem(
                                                      "Video Oynatma",
                                                      batary.video_oynatma,
                                                      width),
                                                ],
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 234, 245),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    bottomLeft:
                                                        Radius.circular(40),
                                                    bottomRight:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(40))),
                                          ),
                                        )
                                      : const Center(),
                                  camera != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  const Center(
                                                      child: Row(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Icon(
                                                            Icons
                                                                .camera_alt_outlined,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "Kamera",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                                  showListItem(
                                                      "Kamera Çözünürlüğü",
                                                      camera.kamera_conuzurlugu,
                                                      width),
                                                  showListItem(
                                                      "Kamera Özellikleri",
                                                      camera.kamera_ozellikleri,
                                                      width),
                                                  showListItem(
                                                      "Ağır Çekim Kayıt Seçenekleri",
                                                      camera
                                                          .agir_cekim_kayit_secenekleri,
                                                      width),
                                                  showListItem(
                                                      "Diyafram Açıklığı",
                                                      camera.diyafram_acikligi,
                                                      width),
                                                  showListItem(
                                                      "Diyafram Açıklığı (MAX)",
                                                      camera
                                                          .diyafram_acikligi_max,
                                                      width),
                                                  showListItem("Flaş",
                                                      camera.flas, width),
                                                  showListItem(
                                                      "Optik Görüntü Sabitleyici",
                                                      camera
                                                          .optik_goruntu_sabitleyici,
                                                      width),
                                                  showListItem(
                                                      "Ön Kamera Çözünürlüğü",
                                                      camera
                                                          .on_kamera_cozunurlugu,
                                                      width),
                                                  showListItem(
                                                      "Ön Kamera Diyafram",
                                                      camera
                                                          .on_kamera_diyaframi,
                                                      width),
                                                  showListItem(
                                                      "Ön Kamera Fps Değeri",
                                                      camera
                                                          .on_kamera_fps_degeri,
                                                      width),
                                                  showListItem(
                                                      "Ön Kamera Özellikleri",
                                                      camera
                                                          .on_kamera_ozellikleri,
                                                      width),
                                                  showListItem(
                                                      "Ön Kamera Video Çözünürlüğü",
                                                      camera
                                                          .on_kamera_video_cozunurlugu,
                                                      width),
                                                  showListItem(
                                                      "İkinci Arka Kamera",
                                                      camera.ikinci_arka_kamera,
                                                      width),
                                                  showListItem(
                                                      "İkinci Arka Kamera Çözünürlüğü",
                                                      camera
                                                          .ikinci_arka_kamera_cozunurlugu,
                                                      width),
                                                  showListItem(
                                                      "İkinci Arka Kamera Diyafram",
                                                      camera
                                                          .ikinci_arka_kamera_diyaframi,
                                                      width),
                                                  showListItem(
                                                      "İkinci Arka Kamera Özellikleri",
                                                      camera
                                                          .ikinci_arka_kamera_ozellikleri,
                                                      width),
                                                  showListItem(
                                                      "İkinci Ön Kamera",
                                                      camera.ikinci_on_kamera,
                                                      width),
                                                  showListItem(
                                                      "İkinci Ön Kamera Çözünürlüğü",
                                                      camera
                                                          .ikinci_on_kamera_cozunurlugu,
                                                      width),
                                                  showListItem(
                                                      "İkinci Ön Kamera Diyafram",
                                                      camera
                                                          .ikinci_on_kamera_diyaframi,
                                                      width),
                                                  showListItem(
                                                      "İkinci Ön Kamera Özellikleri",
                                                      camera
                                                          .ikinci_on_kamera_ozellikleri,
                                                      width),
                                                  showListItem(
                                                      "Üçüncü Arka Kamera",
                                                      camera.ucuncu_arka_kamera,
                                                      width),
                                                  showListItem(
                                                      "Üçüncü Arka Kamera Çözünürlüğü",
                                                      camera
                                                          .ucuncu_arka_kamera_cozunurlugu,
                                                      width),
                                                  showListItem(
                                                      "Üçüncü Arka Kamera Diyafram",
                                                      camera
                                                          .ucuncu_arka_kamera_diyaframi,
                                                      width),
                                                  showListItem(
                                                      "Üçüncü Arka Kamera Özellikleri",
                                                      camera
                                                          .ucuncu_arka_kamera_ozellikleri,
                                                      width),
                                                  showListItem(
                                                      "Video FPS değeri",
                                                      camera.video_fps_degeri,
                                                      width),
                                                  showListItem(
                                                      "Video Kayıt Çözünürlüğü",
                                                      camera
                                                          .video_kayit_cozunurlugu,
                                                      width),
                                                  showListItem(
                                                      "Video Kayıt Özellikleri",
                                                      camera
                                                          .video_kayit_ozellikleri,
                                                      width),
                                                  showListItem(
                                                      "Video Kayıt Seçenekleri",
                                                      camera
                                                          .video_kayit_secenekleri,
                                                      width),
                                                  showListItem("Dxomark V2",
                                                      camera.dxomark_v2, width),
                                                  showListItem("Dxomark V3",
                                                      camera.dxomark_v3, width),
                                                  showListItem("Dxomark V4",
                                                      camera.dxomark_v4, width),
                                                ],
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 234, 245),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    bottomLeft:
                                                        Radius.circular(40),
                                                    bottomRight:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(40))),
                                          ),
                                        )
                                      : const Center(),
                                  design != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  const Center(
                                                      child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Icon(Icons
                                                            .palette_outlined),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "Dizayn",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                                  showListItem(
                                                      "En", design.en!, width),
                                                  showListItem("Boy",
                                                      design.boy!, width),
                                                  showListItem("Ağırlık",
                                                      design.agirlik!, width),
                                                  showListItem("Kalınlık",
                                                      design.kalanlik!, width),
                                                  showListItem(
                                                      "Renk Seçenekleri",
                                                      design.renk_senecekleri!,
                                                      width),
                                                  showListItem(
                                                      "Gövde Malzemesi (ÇERÇEVE)",
                                                      design
                                                          .govde_malzemesi_cerceve!,
                                                      width),
                                                  showListItem(
                                                      "Gövde Malzemesi (KAPAK)",
                                                      design
                                                          .govde_malzemesi_kapak!,
                                                      width),
                                                ],
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 234, 245),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    bottomLeft:
                                                        Radius.circular(40),
                                                    bottomRight:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(40))),
                                          ),
                                        )
                                      : const Center(),
                                  networkConnection != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  const Center(
                                                      child: Row(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Icon(Icons
                                                              .phonelink_ring_outlined)),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "Ağ Bağlantısı",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                                  showListItem(
                                                      "5G",
                                                      networkConnection.five_g,
                                                      width),
                                                  showListItem(
                                                      "4G",
                                                      networkConnection.four_g,
                                                      width),
                                                  showListItem(
                                                      "4G Frekans Notu",
                                                      networkConnection
                                                          .four_g_frekans_notu,
                                                      width),
                                                  showListItem(
                                                      "4G Frekansları",
                                                      networkConnection
                                                          .four_g_frekanslari,
                                                      width),
                                                  showListItem(
                                                      "4G İndirme",
                                                      networkConnection
                                                          .four_g_indirme,
                                                      width),
                                                  showListItem(
                                                      "4G Karşı Yükleme",
                                                      networkConnection
                                                          .four_g_karsi_yukleme,
                                                      width),
                                                  showListItem(
                                                      "4G Özellikleri",
                                                      networkConnection
                                                          .four_g_ozellikleri,
                                                      width),
                                                  showListItem(
                                                      "4G Teknolojisi",
                                                      networkConnection
                                                          .four_g_teknolojisi,
                                                      width),
                                                  showListItem(
                                                      "4,5G Desteği",
                                                      networkConnection
                                                          .four_half_g_destegi,
                                                      width),
                                                  showListItem(
                                                      "3G",
                                                      networkConnection.three_g,
                                                      width),
                                                  showListItem(
                                                      "3G Frekansları",
                                                      networkConnection
                                                          .three_g_frekans,
                                                      width),
                                                  showListItem(
                                                      "3G İndirme",
                                                      networkConnection
                                                          .three_g_indirme,
                                                      width),
                                                  showListItem(
                                                      "3G Karşı Yükleme",
                                                      networkConnection
                                                          .three_g_karsi_yukleme,
                                                      width),
                                                  showListItem(
                                                      "3G Teknolojisi",
                                                      networkConnection
                                                          .three_g_teknolojisi,
                                                      width),
                                                  showListItem(
                                                      "2G",
                                                      networkConnection.two_g,
                                                      width),
                                                  showListItem(
                                                      "2G Frekansları",
                                                      networkConnection
                                                          .two_g_frekans,
                                                      width),
                                                  showListItem(
                                                      "2G Teknolojisi",
                                                      networkConnection
                                                          .two_g_teknolojisi,
                                                      width),
                                                ],
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 234, 245),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    bottomLeft:
                                                        Radius.circular(40),
                                                    bottomRight:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(40))),
                                          ),
                                        )
                                      : const Center(),
                                  operationSystem != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  const Center(
                                                      child: Row(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Icon(
                                                            Icons
                                                                .phonelink_setup_outlined,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "İşletim Sistemi",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                                  showListItem(
                                                      "İşletim Sistemi",
                                                      operationSystem
                                                          .isletim_sistemi,
                                                      width),
                                                  showListItem(
                                                      "İşletim Sistemi Versiyonu",
                                                      operationSystem
                                                          .isletim_sistemi_versiyonu,
                                                      width),
                                                  showListItem(
                                                      "Kullanıcı Arayüzü",
                                                      operationSystem
                                                          .kullanici_arayuzu,
                                                      width),
                                                  showListItem(
                                                      "Kullanıcı Arayüzü Versiyonu",
                                                      operationSystem
                                                          .kullanici_arayuzu_versiyonu,
                                                      width),
                                                  showListItem(
                                                      "Yükseltilebilir Versiyon",
                                                      operationSystem
                                                          .yukseltilebilir_versiyon,
                                                      width),
                                                  showListItem(
                                                      "Planlanan Yükseltilebilir Versiyon",
                                                      operationSystem
                                                          .planlanan_yukseltilebilir_versiyon,
                                                      width),
                                                ],
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 234, 245),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    bottomLeft:
                                                        Radius.circular(40),
                                                    bottomRight:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(40))),
                                          ),
                                        )
                                      : const Center(),
                                  wifiConnection != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  const Center(
                                                      child: Row(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Icon(
                                                            Icons
                                                                .wifi_tethering_outlined,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "Wifi Bağlantısı",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                                  showListItem(
                                                      "Wifi özellikleri",
                                                      wifiConnection
                                                          .wifi_ozellikleri,
                                                      width),
                                                  showListItem(
                                                      "Wifi Kanalları",
                                                      wifiConnection
                                                          .wifi_kanallari,
                                                      width),
                                                  showListItem(
                                                      "Bluetooth Özellikleri",
                                                      wifiConnection
                                                          .bluetooth_ozellikleri,
                                                      width),
                                                  showListItem(
                                                      "Bluetooth Versiyonu",
                                                      wifiConnection
                                                          .bluetooth_versiyonu,
                                                      width),
                                                  showListItem(
                                                      "Kızıl Ötesi",
                                                      wifiConnection
                                                          .kizil_otesi,
                                                      width),
                                                  showListItem(
                                                      "Navigasyon Özellikleri",
                                                      wifiConnection
                                                          .navigasyon_ozellikleri,
                                                      width),
                                                  showListItem(
                                                      "NFC",
                                                      wifiConnection.nfc,
                                                      width),
                                                ],
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 234, 245),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    bottomLeft:
                                                        Radius.circular(40),
                                                    bottomRight:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(40))),
                                          ),
                                        )
                                      : const Center(),
                                  multiMedia != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  const Center(
                                                      child: Row(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Icon(
                                                            Icons
                                                                .music_video_outlined,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "Çoklu Ortam",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                                  showListItem("Radyo",
                                                      multiMedia.radyo, width),
                                                  showListItem(
                                                      "Hoparlör özellikleri",
                                                      multiMedia
                                                          .hoparlor_ozellikleri,
                                                      width),
                                                  showListItem(
                                                      "Ses Çıkışı",
                                                      multiMedia.ses_cikisi,
                                                      width),
                                                ],
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 234, 245),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    bottomLeft:
                                                        Radius.circular(40),
                                                    bottomRight:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(40))),
                                          ),
                                        )
                                      : const Center(),
                                  features != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  const Center(
                                                      child: Row(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Icon(
                                                            Icons
                                                                .fingerprint_outlined,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "Özellikler",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                                  showListItem(
                                                      "Bildirim Işığı",
                                                      features.bildirim_isigi,
                                                      width),
                                                  showListItem(
                                                      "Görüntülü Konuşma",
                                                      features
                                                          .goruntulu_konusma,
                                                      width),
                                                  showListItem(
                                                      "Kutu İçeriği",
                                                      features.kutu_icerigi,
                                                      width),
                                                  showListItem(
                                                      "Parmak İzi Okuyucu",
                                                      features
                                                          .parmak_izi_okuyucu,
                                                      width),
                                                  showListItem(
                                                      "Sar Değeri 10g (BAŞ)",
                                                      features
                                                          .sar_degeri_teng_bas,
                                                      width),
                                                  showListItem(
                                                      "Sar Değeri 10g (VÜCUT)",
                                                      features
                                                          .sar_degeri_teng_vucut,
                                                      width),
                                                  showListItem(
                                                      "Sensörler",
                                                      features.sensorler,
                                                      width),
                                                  showListItem(
                                                      "Servis Ve Uygulamalar",
                                                      features
                                                          .servis_ve_uygulamalar,
                                                      width),
                                                  showListItem(
                                                      "Suya Dayanıklılık",
                                                      features
                                                          .suya_dayaniklilik,
                                                      width),
                                                  showListItem(
                                                      "Suya Dayanıklılık Seviyesi",
                                                      features
                                                          .suya_dayaniklilik_seviyesi,
                                                      width),
                                                  showListItem(
                                                      "3G Görüntülü Arama Şebeke",
                                                      features
                                                          .three_g_goruntulu_arama_sebeke,
                                                      width),
                                                  showListItem(
                                                      "Toza Dayanıklılık",
                                                      features
                                                          .toza_dayaniklilik,
                                                      width),
                                                  showListItem(
                                                      "Toza Dayanıklılık Seviyesi",
                                                      features
                                                          .toza_dayaniklilik_seviyesi,
                                                      width),
                                                ],
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 234, 245),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    bottomLeft:
                                                        Radius.circular(40),
                                                    bottomRight:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(40))),
                                          ),
                                        )
                                      : const Center(),
                                  otherFeatures != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  const Center(
                                                      child: Row(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Icon(
                                                            Icons
                                                                .swap_calls_outlined,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "Diğer Bağlantılar",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                                  showListItem(
                                                      "Hat Sayısı",
                                                      otherFeatures.hat_sayisi,
                                                      width),
                                                  showListItem("Sim",
                                                      otherFeatures.sim, width),
                                                  showListItem(
                                                      "USB Bağlantı Tipi",
                                                      otherFeatures
                                                          .usb_baglanti_tipi,
                                                      width),
                                                  showListItem(
                                                      "USB Özellikleri",
                                                      otherFeatures
                                                          .usb_ozellikleri,
                                                      width),
                                                  showListItem(
                                                      "USB Versiyonu",
                                                      otherFeatures
                                                          .usb_versiyonu,
                                                      width),
                                                ],
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 234, 245),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    bottomLeft:
                                                        Radius.circular(40),
                                                    bottomRight:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(40))),
                                          ),
                                        )
                                      : const Center(),
                                  mainInformation != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  const Center(
                                                      child: Row(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Icon(
                                                            Icons
                                                                .import_contacts_outlined,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          "Temel Bilgiler",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                                  showListItem(
                                                      "Çıkış Yılı",
                                                      mainInformation
                                                          .cikis_yili,
                                                      width),
                                                  showListItem(
                                                      "Duyurulma Tarihi",
                                                      mainInformation
                                                          .duyurulma_tarihi,
                                                      width),
                                                  showListItem(
                                                      "Kullanım Klavuzu",
                                                      mainInformation
                                                          .kullanim_kilavuzu,
                                                      width),
                                                ],
                                              ),
                                            ),
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 234, 245),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40),
                                                    bottomLeft:
                                                        Radius.circular(40),
                                                    bottomRight:
                                                        Radius.circular(40),
                                                    topRight:
                                                        Radius.circular(40))),
                                          ),
                                        )
                                      : const Center(),
                                ],
                              ),
                            )
                          : const CircularProgressIndicator()),
                )
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget priceListItems(int index) {
    String image = "";
    final Uri _url = Uri.parse(_allDetails!.priceList![index]["site_url"]);
    String url = _allDetails!.priceList![index]["site_url"];
    String name = _allDetails!.priceList![index]["urun_adi"];
    String price = _allDetails!.priceList![index]["urun_fiyat"];
    String kargoPrice = _allDetails!.priceList![index]["kargo_dahil"];
    if (url.toString().contains("trendyol")) {
      image = "assets/trendyol.png";
    } else if (url.toString().contains("amazon")) {
      image = "assets/amazon.png";
    } else if (url.toString().contains("arcelik")) {
      image = "assets/arcelik.png";
    } else if (url.toString().contains("beko")) {
      image = "assets/beko.png";
    } else if (url.toString().contains("ciceksepeti")) {
      image = "assets/ciceksepeti.png";
    } else if (url.toString().contains("dr.com.tr")) {
      image = "assets/dr.png";
    } else if (url.toString().contains("hepsiburada")) {
      image = "assets/hepsiburada.png";
    } else if (url.toString().contains("idefix")) {
      image = "assets/idefix.png";
    } else if (url.toString().contains("mediamark")) {
      image = "assets/mediamark.png";
    } else if (url.toString().contains("n11")) {
      image = "assets/n11.png";
    } else if (url.toString().contains("pttavm")) {
      image = "assets/pttavm.png";
    } else if (url.toString().contains("turkcell")) {
      image = "assets/turkcell.png";
    } else if (url.toString().contains("vatanbilgisayar")) {
      image = "assets/vatanbilgisayar.png";
    } else if (url.toString().contains("teknosa")) {
      image = "assets/teknosa.png";
    } else {
      image = "assets/teknosa.png";
    }
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: () => _launchUrl(_url),
        child: Container(
          color: const Color.fromARGB(255, 224, 227, 235),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 90,
                  height: 40,
                  child: Image(image: AssetImage(image), fit: BoxFit.fill),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(name),
                ),
                price.replaceAll(".", "").replaceAll(",", "") !=
                        kargoPrice.replaceAll(".", "").replaceAll(",", "")
                    ? Text(
                        "Fiyat: " + price,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    : Text(
                        "Kargo Dahil: " + kargoPrice,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                price.replaceAll(".", "").replaceAll(",", "") !=
                        kargoPrice.replaceAll(".", "").replaceAll(",", "")
                    ? Text(
                        "Kargo Dahil: " + kargoPrice,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    : const Center(),
              ],
            ),
          ),
        ),
      ),
    );
    //return Text(_allDetails!.priceList![index]["urun_adi"]);
  }

  void _launchUrl(Uri url) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  getFirebaseData(String id) async {
    DocumentSnapshot _documentSnapshot;
    _documentSnapshot = await FirebaseFirestore.instance
        .collection("phone")
        .doc(id.toString())
        .collection("details")
        .doc(id.toString())
        .get();

    Details details =
        Details.fromMap(_documentSnapshot.data() as Map<String, dynamic>);

    setState(() {
      _allDetails = details;
    });
  }

  getPhones(String id) async {
    DocumentSnapshot _documentSnapshot;
    _documentSnapshot = await FirebaseFirestore.instance
        .collection("phone")
        .doc(id.toString())
        .get();

    Phones details =
        Phones.fromMap(_documentSnapshot.data() as Map<String, dynamic>);

    setState(() {
      _phone = details;
    });
  }

  Widget showListItem(String s, String? en, double width) {
    if (en != null) {
      if (en.isNotEmpty) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            color: const Color.fromARGB(255, 224, 227, 235),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: width / 2,
                    child: Text(
                      s,
                      style: TextStyle(
                        color: textColor,
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
                        color: textColor,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                )
              ],
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
