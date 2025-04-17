import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compare_app/screens/details_page.dart';
import 'package:compare_app/models/silder_model.dart';
import 'package:compare_app/viewmodel/user_model.dart';
import 'package:compare_app/widgets/Slider_menu.dart';
import 'package:compare_app/widgets/fadeanimation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class PhoneHeader extends StatefulWidget {
  const PhoneHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<PhoneHeader> createState() => _PhoneHeaderState();
}

class _PhoneHeaderState extends State<PhoneHeader> {
  int _current = 0;
  var linearBarColor = const Color.fromARGB(255, 61, 61, 59);
  List<SliderModel>? _allPhones;
  List<Widget>? imageSlider;
  var _isloading = true;

  var dataFrom = "popular";

  @override
  void initState() {
    getFirebaseData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: false);

  
    if (_userModel.sliderPhones != dataFrom) {
      dataFrom = _userModel.sliderPhones!;
      getFirebaseData();
    }

    double width = MediaQuery.of(context).size.width;
    _allPhones != null
        ? imageSlider = _allPhones!
            .map((e) => GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: false).push(
                      MaterialPageRoute(
                        builder: ((context) => DetailsPage(
                              id: e.id.toString(),
                            )),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [
                                0,
                                0.3,
                                0.7,
                                1,
                              ],
                              colors: [
                                Color.fromARGB(255, 185, 185, 185),
                                Color.fromARGB(255, 185, 185, 185),
                                Color.fromARGB(255, 185, 185, 185),
                                Color.fromARGB(255, 185, 185, 185),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: [
                            Expanded(
                              child: FadeAnimation(
                                delay: 0.5,
                                child: Image.network(
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.phone_android_outlined),
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: FadeAnimation(
                                        delay: 0.5,
                                        child: CircularProgressIndicator(
                                          value:
                                              loadingProgress.expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                        ),
                                      ),
                                    );
                                  },
                                  e.bigPicture!,
                                  height: 120,
                                  width: 50,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                FadeAnimation(
                                  delay: 0.5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, top: 10),
                                    child: Text(
                                      "${e.title}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    FadeAnimation(
                                      delay: 1,
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(e.internalStorage),
                                              LinearPercentIndicator(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                animation: true,
                                                lineHeight: 5.0,
                                                animationDuration: 2000,
                                                percent: 0.9,
                                                linearStrokeCap:
                                                    LinearStrokeCap.roundAll,
                                                progressColor: linearBarColor,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(e.batteryCapacity),
                                              LinearPercentIndicator(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                animation: true,
                                                lineHeight: 5.0,
                                                animationDuration: 2000,
                                                percent: 0.9,
                                                linearStrokeCap:
                                                    LinearStrokeCap.roundAll,
                                                progressColor: linearBarColor,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    FadeAnimation(
                                      delay: 1.5,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(e.screenSize),
                                                LinearPercentIndicator(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4,
                                                  animation: true,
                                                  lineHeight: 5.0,
                                                  animationDuration: 2000,
                                                  percent: 0.9,
                                                  linearStrokeCap:
                                                      LinearStrokeCap.roundAll,
                                                  progressColor: linearBarColor,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(e.ram),
                                                LinearPercentIndicator(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4,
                                                  animation: true,
                                                  lineHeight: 5.0,
                                                  animationDuration: 2000,
                                                  percent: 0.9,
                                                  linearStrokeCap:
                                                      LinearStrokeCap.roundAll,
                                                  progressColor: linearBarColor,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                e.priceStr.length > 1
                                    ? FadeAnimation(
                                      delay: 2,
                                      child: Padding(
                                          padding: const EdgeInsets.only(top: 30),
                                          child: Text(
                                            "${e.priceStr} ₺",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                    )
                                    : const Text(""),
                              ],
                            )
                          ],
                        )),
                  ),
                ))
            .toList()
        : null;

    return imageSlider != null
        ? _isloading == false
            ? Container(
                child: Column(
                  children: [
                    CarouselSlider(
                      items: imageSlider,
                      options: CarouselOptions(
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          autoPlayInterval: const Duration(seconds: 15),
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _allPhones!.map((e) {
                        int index = _allPhones!.indexOf(e);
                        return Container(
                          width: 8,
                          height: 8,
                          margin:
                              const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? const Color.fromRGBO(0, 0, 0, 0.9)
                                  : const Color.fromRGBO(0, 0, 0, 0.4)),
                        );
                      }).toList(),
                    )
                  ],
                ),
              )
            : const SliderMenu()
        : const SliderMenu();
  }

  getFirebaseData() async {
    _isloading = true;
    _allPhones = [];
    QuerySnapshot _querySnapShot;
    List<SliderModel> _phones = [];

    _querySnapShot = await FirebaseFirestore.instance
        .collection(dataFrom)
        .orderBy("point", descending: true)
        .get();

    for (DocumentSnapshot snap in _querySnapShot.docs) {
      SliderModel onePhone =
          SliderModel.fromMap(snap.data() as Map<String, dynamic>);
      _phones.add(onePhone);
    }

    setState(() {
      _allPhones!.addAll(_phones);
      _isloading = false;
    });
  }
}


   



    /*
    Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 50,
                          right: 50,
                          child: e.priceStr.length > 1
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, top: 10),
                                  child: Text(
                                    "${e.title}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : const Text(""),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          top: 15,
                          child: Container(
                            child: Column(
                              children: [
                                Expanded(
                                  child: CachedNetworkImage(
                                    imageUrl: e.bigPicture!,
                                    fit: BoxFit.fill,
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: CircularProgressIndicator(
                                        value: downloadProgress.progress,
                                      ),
                                    ),
                                  ),
                                ),
                                e.priceStr.length > 1
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Text(
                                          "${e.priceStr} ₺",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    : const Text(""),
                              ],
                            ),
                          ),
                        ),
                     
                        Positioned(
                            left: 25,
                            bottom: 50,
                            top: 50,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Column(
                                    children: [
                                      Text(e.internalStorage),
                                      LinearPercentIndicator(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        animation: true,
                                        lineHeight: 5.0,
                                        animationDuration: 2000,
                                        percent: 0.9,
                                        linearStrokeCap:
                                            LinearStrokeCap.roundAll,
                                        progressColor: linearBarColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Column(
                                    children: [
                                      Text(e.batteryCapacity),
                                      LinearPercentIndicator(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        animation: true,
                                        lineHeight: 5.0,
                                        animationDuration: 2000,
                                        percent: 0.9,
                                        linearStrokeCap:
                                            LinearStrokeCap.roundAll,
                                        progressColor: linearBarColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Column(
                                    children: [
                                      Text(e.screenSize),
                                      LinearPercentIndicator(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        animation: true,
                                        lineHeight: 5.0,
                                        animationDuration: 2000,
                                        percent: 0.9,
                                        linearStrokeCap:
                                            LinearStrokeCap.roundAll,
                                        progressColor: linearBarColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Column(
                                    children: [
                                      Text(e.ram),
                                      LinearPercentIndicator(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        animation: true,
                                        lineHeight: 5.0,
                                        animationDuration: 2000,
                                        percent: 0.9,
                                        linearStrokeCap:
                                            LinearStrokeCap.roundAll,
                                        progressColor: linearBarColor,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
    */