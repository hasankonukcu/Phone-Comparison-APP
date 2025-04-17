import 'dart:convert';
import 'package:compare_app/screens/compare_page.dart';
import 'package:compare_app/models/phone_model.dart';
import 'package:compare_app/screens/profile.dart';
import 'package:compare_app/screens/sign_in/sing_in_page.dart';
import 'package:compare_app/screens/tv_details_page.dart';
import 'package:compare_app/viewmodel/user_model.dart';
import 'package:compare_app/widgets/alert_dialog.dart';
import 'package:compare_app/widgets/current_page_categories.dart';
import 'package:compare_app/widgets/custom_app_bar_TV.dart';
import 'package:compare_app/widgets/fadeanimation.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class TVPage extends StatefulWidget {
  const TVPage({Key? key}) : super(key: key);

  @override
  State<TVPage> createState() => _TVPageState();
}

class _TVPageState extends State<TVPage> {
  List<Map<String, dynamic>> brandList = [
    {"title": "Samsung", "isCheck": false},
    {"title": "LG", "isCheck": false},
    {"title": "Philips", "isCheck": false},
    {"title": "Vestel", "isCheck": false},
    {"title": "Sony", "isCheck": false},
    {"title": "Arçelik", "isCheck": false},
    {"title": "Altus", "isCheck": false},
    {"title": "Awox", "isCheck": false},
    {"title": "Axen", "isCheck": false},
    {"title": "Beko", "isCheck": false},
    {"title": "Digipoll", "isCheck": false},
    {"title": "Finlux", "isCheck": false},
    {"title": "Grundig", "isCheck": false},
    {"title": "Hi-Level", "isCheck": false},
    {"title": "Hitachi", "isCheck": false},
    {"title": "JVC", "isCheck": false},
    {"title": "Regal", "isCheck": false},
    {"title": "SEG", "isCheck": false},
    {"title": "Skytech", "isCheck": false},
    {"title": "Telefunken", "isCheck": false},
    {"title": "Toshiba", "isCheck": false},
    {"title": "Onvo", "isCheck": false},
    {"title": "Weston", "isCheck": false},
    {"title": "Telenova", "isCheck": false},
    {"title": "Xiaomi", "isCheck": false},
  ];

  bool isChecked = false;
  var bgColor = const Color.fromARGB(255, 62, 83, 99);
  var textColor = Colors.black;
  var filterTextColor = Colors.white;

  var cardColor = Colors.white;

  final globalKey = GlobalKey<ScaffoldState>();

  bool show = false;

  List<Phones>? _allPhones;

  TextEditingController minPriceInput = TextEditingController();
  TextEditingController maxPriceInput = TextEditingController();

  int? minPrice;
  int? maxPrice;

  bool _isLoading = false;
  bool _hasMore = true;
  int _pageItemCount = 10;
  String query = "";
  List<String>? brandQueryList;
  Phones? _lastPhones;

  bool filterIsMore = true;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      getPhones();
    });
    //getAll();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isTop = _scrollController.position.pixels == 0;
        if (isTop) {
        } else {
          if (query.length == 0) getPhones();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    final _phoneModel = Provider.of<UserModel>(context);

    if (_phoneModel.state == ViewState.Idle) {
      return Scaffold(
          key: globalKey,
          drawer: Drawer(
            child: Container(
              color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.only(top: 50, left: 40, bottom: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Center(
                        child: Text(
                          "Piaf",
                          style: GoogleFonts.dancingScript(
                            color: Colors.white,
                            fontSize: 80,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        CurrentPageCategories(),
                        const SizedBox(
                          height: 35,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_userModel.user == null) {
                              Navigator.of(context, rootNavigator: false).push(
                                  MaterialPageRoute(
                                      builder: ((context) => SignInPage())));
                            } else {
                              Navigator.of(context, rootNavigator: false).push(
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          EditProfilePage())));
                            }
                          },
                          child: const NewRow(
                            text: 'Profile',
                            icon: Icons.person_outline,
                          ),
                        ),
                      ],
                    ),
                    _userModel.user != null
                        ? Row(
                            children: <Widget>[
                              Icon(
                                Icons.cancel,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                onPressed: () => _exitQuestion(context),
                                child: Text(
                                  'Çıkış Yap',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                ),
                              )
                            ],
                          )
                        : const Center(),
                  ],
                ),
              ),
            ),
          ),
          endDrawer: SafeArea(
            child: Drawer(
              backgroundColor: bgColor,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Fiyat",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: textColor)),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8))),
                                              hintText: 'min Fiyat',
                                              hintStyle:
                                                  TextStyle(color: textColor),
                                            ),
                                            controller: minPriceInput,
                                            inputFormatters: <TextInputFormatter>[
                                              CurrencyTextInputFormatter
                                                  .currency(
                                                locale: 'tr',
                                                decimalDigits: 0,
                                                symbol: '₺',
                                              )
                                            ],
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: 'max Fiyat',
                                              hintStyle:
                                                  TextStyle(color: textColor),
                                              border: const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8))),
                                            ),
                                            controller: maxPriceInput,
                                            inputFormatters: <TextInputFormatter>[
                                              CurrencyTextInputFormatter
                                                  .currency(
                                                locale: 'tr',
                                                decimalDigits: 0,
                                                symbol: '₺',
                                              )
                                            ],
                                            keyboardType: TextInputType.number,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Marka",
                                      style: TextStyle(
                                          color: textColor,
                                          fontWeight: FontWeight.bold)),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: brandList.length,
                                  itemBuilder: (context, index) {
                                    return makeCheckhBoxListTile(index);
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: bgColor,
                          ),
                          child: Text("UYGULA",
                              style: TextStyle(color: filterTextColor)),
                          onPressed: () {
                            _lastPhones = null;
                            _allPhones = [];

                            if (minPriceInput.text.isNotEmpty) {
                              minPrice = int.parse(minPriceInput.text
                                  .replaceAll("₺", "")
                                  .replaceAll(".", "")
                                  .replaceAll(",", ""));
                            } else {
                              minPrice = null;
                            }
                            if (maxPriceInput.text.isNotEmpty) {
                              maxPrice = int.parse(maxPriceInput.text
                                  .replaceAll("₺", "")
                                  .replaceAll(".", "")
                                  .replaceAll(",", ""));
                            } else {
                              maxPrice = null;
                            }
                            if (maxPrice != null && minPrice == null) {
                              minPrice = 1;
                            }
                            if (minPrice != null) {
                              if (maxPrice == null) {
                                maxPrice = 5000000;
                              } else {
                                if (maxPrice! < minPrice!) {
                                  maxPrice = 5000000;
                                }
                              }
                            }
                            if (minPrice == 0) {
                              minPrice = 1;
                            }

                            brandQueryList = [];
                            if (brandQueryList != null) {
                              for (var queryForBrand in brandList) {
                                if (queryForBrand["isCheck"] == true) {
                                  brandQueryList!.add(queryForBrand["title"]);
                                }
                              }
                              if (brandQueryList!.length > 0) {
                              } else {
                                brandQueryList = null;
                              }
                            }

                            getPhones();
                            globalKey.currentState!.closeEndDrawer();
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: _userModel.compareList.isNotEmpty
              ? Stack(
                  children: [
                    Positioned(
                        child: Container(
                      width: 12.0,
                      height: 12.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.0)),
                      child: Text(
                        _userModel.compareList.length.toString(),
                        style: const TextStyle(
                            fontSize: 8.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    )),
                    FloatingActionButton(
                      onPressed: () {
                        if (_userModel.compareList.length > 1) {
                          var result =
                              Navigator.of(context, rootNavigator: false).push(
                            MaterialPageRoute(
                              builder: ((context) => const ComparePage()),
                            ),
                          );
                        }
                      },
                      backgroundColor: Colors.cyan,
                      child: Stack(
                        children: [
                          _userModel.compareList.isNotEmpty
                              ? const Icon(
                                  Icons.swap_horiz_outlined,
                                )
                              : const Center()
                        ],
                      ),
                    ),
                  ],
                )
              : const Center(),
          backgroundColor: bgColor,
          body: _allPhones != null
              ? SingleChildScrollView(
                  controller: _scrollController,
                  child: SafeArea(
                      child: Column(
                    children: [
                      FadeAnimation(
                        delay: 0.5,
                        child: CustomAppBarTV(user: _userModel.user),
                      ),
                      //FadeAnimation(delay: 1, child: Categories()),
                      /*FadeAnimation(delay: 1.5, child: PhoneHeader()),*/
                      filterIsMore == false
                          ? const Center(
                              child: Text("Hiç sonuç bulunamadı",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            )
                          : _allPhones!.isNotEmpty
                              ? FadeAnimation(
                                  delay: 2,
                                  child: Container(
                                    color: bgColor,
                                    child: StaggeredGrid.count(
                                      crossAxisCount: 2,
                                      children: _allPhones!.map<Widget>((item) {
                                        //Do you need to go somewhere when you tap on this card, wrap using InkWell and add your route
                                        item.priceStr = item.priceStr
                                            .replaceAll(RegExp(r'TL.*$'), '');
                                        var nowPhone = item;

                                        Codec<String, String> stringToBase64 =
                                            utf8.fuse(base64);
                                        var image = item.bigPicture;
                                        String decoded = image;
                                        String decoded2 = decoded;

                                        return FadeAnimation(
                                          delay: 0.5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context,
                                                        rootNavigator: false)
                                                    .push(
                                                  MaterialPageRoute(
                                                    builder: ((context) =>
                                                        TVDetailsPage(
                                                            id: nowPhone.id
                                                                .toString())),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                    color: Color.fromARGB(
                                                        255, 241, 241, 241)),
                                                child: Column(
                                                  children: [
                                                    FadeAnimation(
                                                      delay: 1,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Text(
                                                            nowPhone.title,
                                                            maxLines: 1),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          FadeAnimation(
                                                            delay: 1.5,
                                                            child:
                                                                Image.network(
                                                              errorBuilder:
                                                                  (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Container(
                                                                height: 50,
                                                                width: 130,
                                                                child:
                                                                    const Center(
                                                                  child: Icon(Icons
                                                                      .phone_android_outlined),
                                                                ),
                                                              ),
                                                              loadingBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      Widget
                                                                          child,
                                                                      ImageChunkEvent?
                                                                          loadingProgress) {
                                                                if (loadingProgress ==
                                                                    null) {
                                                                  return child;
                                                                }
                                                                return FadeAnimation(
                                                                  delay: 1.5,
                                                                  child: Center(
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          50,
                                                                      width:
                                                                          100,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          value: loadingProgress.expectedTotalBytes != null
                                                                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                                              : null,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              decoded2,
                                                              height: 50,
                                                              width: 130,
                                                            ),
                                                          ),
                                                          FadeAnimation(
                                                            delay: 1.5,
                                                            child: Column(
                                                              children: [
                                                                Text(nowPhone
                                                                    .internalStorage),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              5,
                                                                          bottom:
                                                                              5),
                                                                  child: Text(
                                                                      nowPhone
                                                                          .batteryCapacity),
                                                                ),
                                                                Text(nowPhone
                                                                    .screenSize),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              5),
                                                                  child: Text(
                                                                      nowPhone
                                                                          .ram),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    FadeAnimation(
                                                      delay: 2,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          CircularPercentIndicator(
                                                            radius: 25.0,
                                                            lineWidth: 3.0,
                                                            animation: true,
                                                            animationDuration:
                                                                1200,
                                                            percent:
                                                                nowPhone.point /
                                                                    100,
                                                            center: Text(
                                                              "${nowPhone.point}%",
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          11),
                                                            ),
                                                            circularStrokeCap:
                                                                CircularStrokeCap
                                                                    .round,
                                                            progressColor:
                                                                Colors.red,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    item.priceStr != ""
                                                        ? FadeAnimation(
                                                            delay: 2.5,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                "₺" +
                                                                    item.priceStr,
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          )
                                                        : const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text(""),
                                                          )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),

                                      mainAxisSpacing: 3.0,
                                      crossAxisSpacing: 4.0, // add some space
                                    ),
                                  ),
                                )
                              : const Center(child: CircularProgressIndicator())
                    ],
                  )),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ));
    } else {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
  }

  getPhones() async {
    try {
      final _userModel = Provider.of<UserModel>(context, listen: false);

      if (!_hasMore) {
        return;
      }
      if (_isLoading) {
        return;
      }

      setState(() {
        _isLoading = true;
      });

      List<Phones> _dreams = await _userModel.getAllTVPagination(
          _lastPhones, _pageItemCount, brandQueryList, minPrice, maxPrice);

      if (_lastPhones == null) {
        _allPhones = [];
        _allPhones?.addAll(_dreams);
      } else {
        if (brandQueryList != null) {
          _allPhones?.addAll(_dreams);
        }
        _allPhones!.addAll(_dreams);
      }

      if (_dreams.length < _pageItemCount) {
        //_hasMore = false;
      }
      if (_allPhones!.isNotEmpty) {
        _lastPhones = _allPhones!.last;
      }
      if (_allPhones!.isEmpty) {
        filterIsMore = false;
      } else {
        filterIsMore = true;
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print("HATA VAR: " + e.toString());
    } finally {
      print("Veri çekme işlemi tamamlandı");
    }
  }

  _listItemDownloadIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
          child: Opacity(
        opacity: _isLoading ? 1 : 0,
        child: _isLoading ? const CircularProgressIndicator() : null,
      )),
    );
  }

  Widget makeCheckhBoxListTile(int index) {
    return CheckboxListTile(
      checkColor: Colors.white,
      tileColor: const Color.fromARGB(255, 185, 185, 185),
      value: brandList[index]["isCheck"],
      title: Text(brandList[index]["title"]),
      onChanged: (bool? value) {
        setState(() {
          brandList[index]["isCheck"] = value!;
        });
      },
    );
  }

  Future _exitQuestion(BuildContext context) async {
    final sonuc = await PlatformSensAlertDialog(
      title: "Emin misiniz?",
      content: "Çıkmak istediğinizden emin misiniz",
      mainButtonText: "Evet",
      cancelButtonText: "Vazgeç",
    ).show(context);
    if (sonuc == true) {
      _cikisYap(context);
    }
  }

  Future<bool> _cikisYap(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);

    bool sonuc = await _userModel.signOut();
    return sonuc;
  }
}

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const NewRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
