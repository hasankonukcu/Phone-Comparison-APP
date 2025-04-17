import 'package:carousel_slider/carousel_slider.dart';
import 'package:compare_app/models/comment.dart';
import 'package:compare_app/widgets/header_widget.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compare_app/models/price_details.dart';
import 'package:flutter/material.dart';
import 'package:compare_app/screens/comment.dart';
import 'package:compare_app/widgets/fadeanimation.dart';

class TVDetailsPage extends StatefulWidget {
  final String id;

  const TVDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  State<TVDetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<TVDetailsPage> {
  var _allDetails;
  var _phone;
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
    if (_phone != null) {
      _phone['priceStr'] = _phone['priceStr'].replaceAll(RegExp(r'TL.*$'), '');
    }
    double width = MediaQuery.of(context).size.width;
    var _height = 300.0;
    var title = "";
    var decoded_1 = "";
    var decoded_2 = "";
    var decoded_3 = "";
    if (_allDetails != null) {
      decoded_1 = _allDetails['bigPicture'][0];
      decoded_2 = _allDetails['bigPicture'][1];
      decoded_3 = _allDetails['bigPicture'][2];
    }

    myBackgrounColor = Theme.of(context).primaryColor;
    myButtonColor = Theme.of(context).colorScheme.secondary;
    myTextColor = Theme.of(context).focusColor;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: false).push(
            MaterialPageRoute(
              builder: ((context) => CommentPage(
                    id: _allDetails["id"],
                    phoneName: _allDetails["title"],
                    type: "televizyon",
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
                    backgroundColor: Colors.white,
                    expandedHeight: 325,
                    flexibleSpace: FlexibleSpaceBar(
                        title: title.isNotEmpty
                            ? FadeAnimation(
                                delay: 1,
                                child: Text(
                                  _allDetails["title"].length > 30
                                      ? _allDetails['title'].substring(0, 30) +
                                          '...'
                                      : _allDetails['title'],
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
                                    left: 40,
                                    bottom: 50,
                                    top: 90,
                                    child: FadeAnimation(
                                      delay: 0.5,
                                      child: Container(
                                        width: 150,
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
                                              height: 105,
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
                                            child: Text(
                                                _phone['batteryCapacity'])),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          child: FadeAnimation(
                                              delay: 1,
                                              child: Text(_phone['ram'])),
                                        ),
                                        FadeAnimation(
                                            delay: 1.5,
                                            child: Text(
                                                _phone['internalStorage'])),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: FadeAnimation(
                                              delay: 2,
                                              child: Text(
                                                  _phone['batteryCapacity'])),
                                        ),
                                        _phone['priceStr'].length > 1
                                            ? FadeAnimation(
                                                delay: 2.5,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30),
                                                  child: Text(
                                                    "${_phone['priceStr']} ₺",
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 235, 234, 245),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return FadeAnimation(
                                    delay: 0.5, child: priceListItems(index));
                              },
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _allDetails['prices'].length > 6
                                  ? 6
                                  : _allDetails['prices'].length,
                            ),
                          ),
                        ),
                        if (_isBannerAdReady)
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: Container(
                                height: _bannerAd.size.height.toDouble(),
                                child: AdWidget(ad: _bannerAd),
                              ),
                            ),
                          ),
                        const Center(
                            child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.monitor_outlined,
                                )),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "EKRAN",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Map<String, dynamic> text =
                                _allDetails['ozellikler'][0]['EKRAN'][index];
                            return showListItem(
                                text.keys.first, text.values.first, width);
                          },
                          itemCount:
                              _allDetails['ozellikler'][0]['EKRAN'].length,
                          shrinkWrap: true,
                        ),
                        const Center(
                            child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.surround_sound_outlined,
                                )),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "SES",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Map<String, dynamic> text =
                                _allDetails['ozellikler'][1]['SES'][index];
                            return showListItem(
                                text.keys.first, text.values.first, width);
                          },
                          itemCount: _allDetails['ozellikler'][1]['SES'].length,
                          shrinkWrap: true,
                        ),
                        const Center(
                            child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.network_check_outlined,
                                )),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "ALICILAR",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Map<String, dynamic> text =
                                _allDetails['ozellikler'][2]['ALICILAR'][index];
                            return showListItem(
                                text.keys.first, text.values.first, width);
                          },
                          itemCount:
                              _allDetails['ozellikler'][2]['ALICILAR'].length,
                          shrinkWrap: true,
                        ),
                        const Center(
                            child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.usb_outlined,
                                )),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "BAĞLANTILAR",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Map<String, dynamic> text =
                                _allDetails['ozellikler'][3]['BAĞLANTILAR']
                                    [index];
                            return showListItem(
                                text.keys.first, text.values.first, width);
                          },
                          itemCount: _allDetails['ozellikler'][3]['BAĞLANTILAR']
                              .length,
                          shrinkWrap: true,
                        ),
                        const Center(
                            child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.play_circle_outline,
                                )),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "MULTİMEDYA ÖZELLİKLERİ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Map<String, dynamic> text =
                                _allDetails['ozellikler'][4]
                                    ['MULTİMEDYA ÖZELLİKLERİ'][index];
                            return showListItem(
                                text.keys.first, text.values.first, width);
                          },
                          itemCount: _allDetails['ozellikler'][4]
                                  ['MULTİMEDYA ÖZELLİKLERİ']
                              .length,
                          shrinkWrap: true,
                        ),
                        const Center(
                            child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.palette_outlined,
                                )),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "ENERJİ VE TASARIM",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Map<String, dynamic> text =
                                _allDetails['ozellikler'][5]
                                    ['ENERJİ ve TASARIM'][index];
                            return showListItem(
                                text.keys.first, text.values.first, width);
                          },
                          itemCount: _allDetails['ozellikler'][5]
                                  ['ENERJİ ve TASARIM']
                              .length,
                          shrinkWrap: true,
                        ),
                        const Center(
                            child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.assignment_return_outlined,
                                )),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "EBAT & AĞIRLIK",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Map<String, dynamic> text =
                                _allDetails['ozellikler'][6]['EBAT & AĞIRLIK']
                                    [index];
                            return showListItem(
                                text.keys.first, text.values.first, width);
                          },
                          itemCount: _allDetails['ozellikler'][6]
                                  ['EBAT & AĞIRLIK']
                              .length,
                          shrinkWrap: true,
                        ),
                        const Center(
                            child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.assessment_outlined,
                                )),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "GENEL ÖZELLİKLER",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Map<String, dynamic> text =
                                _allDetails['ozellikler'][7]['GENEL ÖZELLİKLER']
                                    [index];
                            return showListItem(
                                text.keys.first, text.values.first, width);
                          },
                          itemCount: _allDetails['ozellikler'][7]
                                  ['GENEL ÖZELLİKLER']
                              .length,
                          shrinkWrap: true,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget priceListItems(int index) {
    String image = "";
    final Uri _url = Uri.parse(_allDetails['prices'][index]["link"]);
    String url = _allDetails['prices'][index]["link"];
    String name = _allDetails['prices'][index]["name"];
    String price = _allDetails['prices'][index]["priceInt"];
    String kargoPrice = _allDetails['prices'][index]["priceString"];
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
                        "Fiyat: $price",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    : Text(
                        "Kargo Dahil: $kargoPrice",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                price.replaceAll(".", "").replaceAll(",", "") !=
                        kargoPrice.replaceAll(".", "").replaceAll(",", "")
                    ? Text(
                        "Kargo Dahil: $kargoPrice",
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
        .collection("televizyon")
        .doc(id.toString())
        .collection("details")
        .doc(id.toString())
        .get();

    var details = _documentSnapshot.data() as Map<String, dynamic>;
    print(details);

    setState(() {
      _allDetails = details;
    });
  }

  getPhones(String id) async {
    DocumentSnapshot _documentSnapshot;
    _documentSnapshot = await FirebaseFirestore.instance
        .collection("televizyon")
        .doc(id.toString())
        .get();

    var details = _documentSnapshot.data() as Map<String, dynamic>;

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
