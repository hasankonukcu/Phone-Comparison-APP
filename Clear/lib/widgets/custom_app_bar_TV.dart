import 'package:compare_app/models/user.dart';
import 'package:compare_app/screens/details_page.dart';
import 'package:flutter/material.dart';

class CustomAppBarTV extends StatefulWidget {
  CustomAppBarTV({Key? key, required this.user}) : super(key: key);
  Users? user;
  @override
  State<CustomAppBarTV> createState() => _CustomAppBarTVState();
}

class _CustomAppBarTVState extends State<CustomAppBarTV> {
  var iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.format_list_bulleted,
                    size: 25,
                    color: Colors.white,
                  )),
              const Text(
                "Televizyonlar",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: const Icon(
                        Icons.tune,
                        size: 25,
                        color: Colors.white,
                      )),
                ],
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            child: Container(
              height: 38,
              child: TextField(
                autocorrect: false,
                enableSuggestions: false,
                autofocus: false,
                enabled: false,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[400],
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.shade500),
                    hintText: "Ara"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<Map<String, dynamic>> _allDream = [
    {'id': 110295, 'title': 'LG OLED65E8PLA Ultra HD (4K) TV'}, {'id': 110303, 'title': 'LG OLED65C8PLA Ultra HD (4K) TV'}, {'id': 110333, 'title': 'LG OLED55B8PLA Ultra HD (4K) TV'}, {'id': 166690, 'title': 'LG OLED65E9PLA Ultra HD (4K) TV'}, {'id': 344017, 'title': 'LG 55SM8000PLA Ultra HD (4K) TV'}, {'id': 558970, 'title': 'Samsung 50Q60T Ultra HD (4K) TV (QE50Q60TAUXTK)'}, {'id': 565582, 'title': 'Samsung 55Q80T Ultra HD (4K) TV (QE55Q80TAT)'}, {'id': 567184, 'title': 'Vestel 65O9900 Ultra HD (4K) TV (20275310)'}, {'id': 577904, 'title': 'LG OLED77GX6LA Ultra HD (4K) TV'}, {'id': 585307, 'title': 'Philips 50PUS7805 Ultra HD (4K) TV (50PUS7805/62)'}, {'id': 591412, 'title': 'Samsung 70TU7100 Ultra HD (4K) TV (UE70TU7100U)'}, {'id': 610108, 'title': 'Vestel 65UA9800 Ultra HD (4K) TV (20275543)'}, {'id': 628702, 'title': 'Toshiba 65UA3A63DT Ultra HD (4K) TV'}, {'id': 628708, 'title': 'Beko B65 OLED A 950 B Ultra HD (4K) TV'}, {'id': 647567, 'title': 'Regal 65R754UA9 Ultra HD (4K) TV (20275825)'}, {'id': 650903, 'title': 'Samsung 55Q700T Ultra HD (8K) TV (QE55Q700TAT)'}, {'id': 677456, 'title': 'Vestel 65Q9900 Ultra HD (4K) TV (20275970)'}, {'id': 680833, 'title': 'Regal 75R754U Ultra HD (4K) TV (20276032, 20276180)'}, {'id': 689249, 'title': 'Samsung 85QN85A Ultra HD (4K) TV (QE85QN85A)'}, {'id': 695491, 'title': 'LG OLED55A16LA Ultra HD (4K) TV'}, {'id': 695493, 'title': 'LG OLED77G16LA Ultra HD (4K) TV'}, {'id': 696674, 'title': 'Samsung 55AU8000 Ultra HD (4K) TV (UE55AU8000UXTK)'}, {'id': 697065, 'title': 'Samsung 70AU7100 Ultra HD (4K) TV (UE70AU7100UXTK)'}, {'id': 702887, 'title': 'Samsung 65AU7000 Ultra HD (4K) TV (UE65AU7000UXTK)'}, {'id': 704148, 'title': 'LG OLED48C14LB Ultra HD (4K) TV'}, {'id': 704859, 'title': 'Philips 50PUS8506 Ultra HD (4K) TV (50PUS8506/62)'}, {'id': 704877, 'title': 'Philips 58PUS8506 Ultra HD (4K) TV (58PUS8506/62)'}, {'id': 705031, 'title': 'Samsung 58AU7000 Ultra HD (4K) TV'}, {'id': 705110, 'title': 'Philips 55PUS7906 Ultra HD (4K) TV (55PUS7906/62)'}, {'id': 705111, 'title': 'Philips 50PUS7906 Ultra HD (4K) TV (50PUS7906/12)'}, {'id': 705977, 'title': 'LG 50NANO866PA Ultra HD (4K) TV'}, {'id': 709323, 'title': 'Samsung 65TU8300 Ultra HD (4K) TV (UE65TU8300UXTK)'}, {'id': 711806, 'title': 'Samsung 50Q60A Ultra HD (4K) TV (QE50Q60AAUXTK)'}, {'id': 711807, 'title': 'LG OLED48A16LA Ultra HD (4K) TV'}, {'id': 715152, 'title': 'TCL 50C725 Ultra HD (4K) TV'}, {'id': 719317, 'title': 'LG 65QNED916PA Ultra HD (4K) TV'}, {'id': 719318, 'title': 'LG 75QNED916PA Ultra HD (4K) TV'}, {'id': 725863, 'title': 'Vestel 55O9900 Ultra HD (4K) TV (20276223)'}, {'id': 727486, 'title': 'Vestel 75U9520 Ultra HD (4K) TV (20276161)'}, {'id': 728736, 'title': 'Philips 75PML9506 Ultra HD (4K) TV (75PML9506/12)'}, {'id': 728815, 'title': 'TCL 65P725 Ultra HD (4K) TV'}, {'id': 729605, 'title': 'Onvo OV85500 Ultra HD (4K) TV'}, {'id': 750706, 'title': 'Beko B65 C 890 A Ultra HD (4K) TV'}, {'id': 756733, 'title': 'Vestel 65UA9600 Ultra HD (4K) TV (20276469)'}, {'id': 758498, 'title': 'Grundig 65 GGU 9760 A Ultra HD (4K) TV'}, {'id': 758507, 'title': 'Grundig 55 GGU 9760 A Ultra HD (4K) TV'}, {'id': 758989, 'title': 'Beko Crystal Pro B65 C 985 B Ultra HD (4K) TV'}, {'id': 758991, 'title': 'Ar elik A65 C 985 B Ultra HD (4K) TV'}, {'id': 765518, 'title': 'Vestel 65UM9900 Ultra HD (4K) TV (20276096)'}, {'id': 776593, 'title': 'LG 75QNED816QA Ultra HD (4K) TV'}, {'id': 776595, 'title': 'LG OLED55C24LA Ultra HD (4K) TV'}, {'id': 776596, 'title': 'LG 65QNED816QA Ultra HD (4K) TV'}, {'id': 776600, 'title': 'LG 55QNED816QA Ultra HD (4K) TV'}, {'id': 776684, 'title': 'LG 50QNED816QA Ultra HD (4K) TV'}, {'id': 776900, 'title': 'LG OLED77C24LA Ultra HD (4K) TV'}, {'id': 776907, 'title': 'LG OLED83C24LA Ultra HD (4K) TV'}, {'id': 780206, 'title': 'Philips 65PUS8507 Ultra HD (4K) TV (65PUS8507/12)'}, {'id': 780259, 'title': 'Philips 58PUS8507 Ultra HD (4K) TV (58PUS8507/12/, 58PUS8507/62)'}, {'id': 780263, 'title': 'Philips 50PUS8507 Ultra HD (4K) TV (50PUS8507/12)'}, {'id': 783499, 'title': 'Samsung 50Q67B Ultra HD (4K) TV (QE50Q67BAUXTK)'}, {'id': 783626, 'title': 'Samsung 65QN85B Ultra HD (4K) TV (QE65QN85BATXTK)'}, {'id': 783654, 'title': 'Samsung 55QN85B Ultra HD (4K) TV (QE55QN85BATXTK)'}, {'id': 783672, 'title': 'Samsung 85QN85B Ultra HD (4K) TV (QE85QN85BATXTK)'}, {'id': 783733, 'title': 'Samsung 65QN800B Ultra HD (8K) TV (QE65QN800BTXTK)'}, {'id': 783745, 'title': 'Samsung 75QN800B Ultra HD (8K) TV (QE75QN800BTXTK)'}, {'id': 783830, 'title': 'Samsung 75QN95B Ultra HD (4K) TV (QE75QN95BATXTK)'}, {'id': 783837, 'title': 'Samsung 65Q60B Ultra HD (4K) TV (QE65Q60BAUXTK)'}, {'id': 783842, 'title': 'Samsung 55Q60B Ultra HD (4K) TV (QE55Q60BAUXTK)'}, {'id': 783845, 'title': 'Samsung 75Q60B Ultra HD (4K) TV (QE75Q60BAUXTK)'}, {'id': 784043, 'title': 'Samsung 65LS03B Ultra HD (4K) TV (QE65LS03BAUXTK)'}, {'id': 784044, 'title': 'Samsung 55LS03B Ultra HD (4K) TV (QE55LS03BAUXTK)'}, {'id': 784045, 'title': 'Samsung 43LS05B (The Sero) Ultra HD (4K) TV (QE43LS05BAUXTK)'}, {'id': 784053, 'title': 'Samsung 75LS03B Ultra HD (4K) TV (QE75LS03BAUXTK)'}, {'id': 784056, 'title': 'Samsung 85BU8000 Ultra HD (4K) TV (UE85BU8000UXTK)'}, {'id': 784099, 'title': 'Samsung 55Q70B Ultra HD (4K) TV (QE55Q70BATXTK)'}, {'id': 784153, 'title': 'Samsung 75BU8000 Ultra HD (4K) TV (UE75BU8000UXTK)'}, {'id': 784182, 'title': 'Samsung 55BU8000 Ultra HD (4K) TV (UE55BU8000UXTK)'}, {'id': 784259, 'title': 'Samsung 85LS03B Ultra HD (4K) TV (QE85LS03BAUXTK)'}, {'id': 784750, 'title': 'LG OLED55A26LA Ultra HD (4K) TV'}, {'id': 784758, 'title': 'LG 65UQ91006LA Ultra HD (4K) TV'}, {'id': 784760, 'title': 'LG 86UQ91006LA Ultra HD (4K) TV'}, {'id': 785443, 'title': 'Vestel 65UA9090 Ultra HD (4K) TV (20276563)'}, {'id': 785461, 'title': 'Samsung 55Q80B Ultra HD (4K) TV (QE55Q80BATXTK)'}, {'id': 785464, 'title': 'Grundig 55 GGO 9900 B Ultra HD (4K) TV'}, {'id': 785466, 'title': 'Philips 65PUS7506 Ultra HD (4K) TV (65PUS7506/12)'}, {'id': 785804, 'title': 'Grundig 65 GGO 9900 B Ultra HD (4K) TV'}, {'id': 786765, 'title': 'Samsung 75QN90B Ultra HD (4K) TV (QE75QN90BATXTK)'}, {'id': 786767, 'title': 'Samsung 55QN90B Ultra HD (4K) TV (QE55QN90BATXTK)'}, {'id': 786768, 'title': 'Samsung 50QN90B Ultra HD (4K) TV (QE50QN90BATXTK)'}, {'id': 786773, 'title': 'Samsung 65BU8500 Ultra HD (4K) TV (UE65BU8500UXTK)'}, {'id': 786774, 'title': 'Samsung 55BU8500 Ultra HD (4K) TV (UE55BU8500UXTK)'}, {'id': 786952, 'title': 'Samsung 85QN900B Ultra HD (8K) TV (QE85QN900BTXTK)'}, {'id': 786962, 'title': 'Samsung 75QN900B Ultra HD (8K) TV (QE75QN900BTXTK)'}, {'id': 786963, 'title': 'Samsung 55QN700B Ultra HD (8K) TV (QE55QN700BTXTK)'}, {'id': 786965, 'title': 'Samsung 55LS01B Ultra HD (4K) TV (QE55LS01BAUXTK)'}, {'id': 786978, 'title': 'Samsung 65QN900B Ultra HD (8K) TV (QE65QN900BTXTK)'}, {'id': 787034, 'title': 'Samsung 65QN700B Ultra HD (8K) TV (QE65QN700BTXTK)'}, {'id': 787714, 'title': 'LG 65UQ75006LF Ultra HD (4K) TV'}, {'id': 787890, 'title': 'LG 86NANO766QA Ultra HD (4K) TV'}, {'id': 788864, 'title': 'Grundig Atlanta 65 GGU 8965 B Ultra HD (4K) TV'}, {'id': 789231, 'title': 'Ar elik A55 OLED C 970 B Ultra HD (4K) TV'}, {'id': 789256, 'title': 'Ar elik A65 OLED C 970 B Ultra HD (4K) TV'}, {'id': 791481, 'title': 'Onvo OV98500 Ultra HD (4K) TV'}, {'id': 793666, 'title': 'Samsung 55S95B Ultra HD (4K) TV (QE55S95BATXTK)'}, {'id': 793687, 'title': 'Samsung 65S95B Ultra HD (4K) TV (QE65S95BATXTK)'}, {'id': 797808, 'title': 'Philips 50PUS8807 Ultra HD (4K) TV (50PUS8807/62)'}, {'id': 798738, 'title': 'Philips 75PUS8807 Ultra HD (4K) TV (75PUS8807/12)'}, {'id': 798740, 'title': 'Philips 50PUS8007 Ultra HD (4K) TV (50PUS8007/62)'}, {'id': 801622, 'title': 'Philips 55PUS8007 Ultra HD (4K) TV (55PUS8007/62)'}, {'id': 801623, 'title': 'Philips 65PUS8007 Ultra HD (4K) TV (65PUS8007/62)'}, {'id': 801753, 'title': 'Philips 55PUS8807 Ultra HD (4K) TV (55PUS8807/62)'}, {'id': 801758, 'title': 'Philips 65PUS8807 Ultra HD (4K) TV (65PUS8807/62)'}, {'id': 801769, 'title': 'Philips 86PUS8807 Ultra HD (4K) TV (86PUS8807/12)'}, {'id': 801984, 'title': 'Samsung 55BU8100 Ultra HD (4K) TV (UE55BU8100UXTK)'}, {'id': 802559, 'title': 'Grundig Miami 65 GGU 9765 A Ultra HD (4K) TV'}, {'id': 804165, 'title': 'Sony XR-65A75K Ultra HD (4K) TV'}, {'id': 804652, 'title': 'Philips 55OLED807 Ultra HD (4K) TV (55OLED807/12)'}, {'id': 804655, 'title': 'Philips 55OLED707 Ultra HD (4K) TV (55OLED707/12)'}, {'id': 804924, 'title': 'Philips 65OLED807 Ultra HD (4K) TV (65OLED807/12)'}, {'id': 805102, 'title': 'Philips 65OLED707 Ultra HD (4K) TV (65OLED707/12)'}, {'id': 805337, 'title': 'Philips 65PML9507 Ultra HD (4K) TV (65PML9507/12)'}, {'id': 805359, 'title': 'Philips 55PML9507 Ultra HD (4K) TV (55PML9507/12)'}, {'id': 808226, 'title': 'Philips 50PUS7956 Ultra HD (4K) TV (50PUS7956/62)'}, {'id': 808869, 'title': 'TCL 55C735 Ultra HD (4K) TV'}, {'id': 808873, 'title': 'TCL 65C635 Ultra HD (4K) TV'}, {'id': 808896, 'title': 'TCL 55C635 Ultra HD (4K) TV'}, {'id': 808905, 'title': 'TCL 50C635 Ultra HD (4K) TV'}, {'id': 810819, 'title': 'Ar elik A65 C 885 A Ultra HD (4K) TV'}, {'id': 812273, 'title': 'LG OLED48A26LA Ultra HD (4K) TV'}, {'id': 812496, 'title': 'Philips 55OLED907 Ultra HD (4K) TV (55OLED907/12)'}, {'id': 812507, 'title': 'LG OLED77Z29LA Ultra HD (8K) TV'}, {'id': 812509, 'title': 'Philips 65OLED937 Ultra HD (4K) TV (65OLED937/12)'}, {'id': 812510, 'title': 'Philips 65OLED907 Ultra HD (4K) TV (65OLED907/12)'}, {'id': 813176, 'title': 'Onvo OV110500 Ultra HD (4K) TV'}, {'id': 813177, 'title': 'Toshiba 55XA9D63DT Ultra HD (4K) TV (20277104)'}, {'id': 813178, 'title': 'Toshiba 65QA7D63DT Ultra HD (4K) TV (20277128)'}, {'id': 813179, 'title': 'Toshiba 65UA5D63DT Ultra HD (4K) TV (20277125)'}, {'id': 813180, 'title': 'Toshiba 55QA7D63DT Ultra HD (4K) TV (20277127)'}, {'id': 813181, 'title': 'Toshiba 55UA5D63DT Ultra HD (4K) TV (20277124)'}, {'id': 814033, 'title': 'Toshiba 50QA7D63DT Ultra HD (4K) TV (20277126)'}, {'id': 814038, 'title': 'Toshiba 65XA9D63DT Ultra HD (4K) TV (20277105)'}, {'id': 814222, 'title': 'Vestel 55QA9700 Ultra HD (4K) TV (20277113)'}, {'id': 814224, 'title': 'Vestel 50QA9700 Ultra HD (4K) TV (20277112)'}, {'id': 814227, 'title': 'Philips 70PUS7607 Ultra HD (4K) TV (70PUS7607/12)'}, {'id': 814257, 'title': 'Vestel 65QA9700 Ultra HD (4K) TV (20277114)'}, {'id': 815785, 'title': 'Beko B65 C 885 A Ultra HD (4K) TV'}, {'id': 818217, 'title': 'TCL 55C835 Ultra HD (4K) TV'}, {'id': 828517, 'title': 'LG OLED55CS6LA Ultra HD (4K) TV'}, {'id': 828519, 'title': 'LG OLED65CS6LA Ultra HD (4K) TV'}, {'id': 828521, 'title': 'LG 48LX1Q6LA Ultra HD (4K) TV'}, {'id': 828522, 'title': 'LG 55LX1Q6LA Ultra HD (4K) TV'}, {'id': 828527, 'title': 'Philips 65PUS7956 Ultra HD (4K) TV (65PUS7956/62)'}, {'id': 828528, 'title': 'Toshiba 65UA3D63DT Ultra HD (4K) TV (20276629)'}, {'id': 828557, 'title': 'TCL 65P735 Ultra HD (4K) TV'}, {'id': 828558, 'title': 'TCL 65P635 Ultra HD (4K) TV'}, {'id': 828559, 'title': 'TCL 55P735 Ultra HD (4K) TV'}, {'id': 828561, 'title': 'TCL 50P735 Ultra HD (4K) TV'}, {'id': 828563, 'title': 'TCL 43P635 Ultra HD (4K) TV'}, {'id': 830651, 'title': 'TCL 75P735 Ultra HD (4K) TV'}, {'id': 831014, 'title': 'TCL 50P635 Ultra HD (4K) TV'}, {'id': 831016, 'title': 'TCL 55P635 Ultra HD (4K) TV'}, {'id': 831018, 'title': 'TCL 58P635 Ultra HD (4K) TV'}, {'id': 833008, 'title': 'TCL 75C935 Ultra HD (4K) TV'}, {'id': 836717, 'title': 'LG 65ART90E6QA Ultra HD (4K) TV'}, {'id': 836719, 'title': 'Xiaomi TV P1E 65" Ultra HD (4K) TV (L65M7-7AEU)'}, {'id': 838391, 'title': 'LG OLED97G29LA Ultra HD (4K) TV'}, {'id': 838594, 'title': 'Samsung 98QN100B Ultra HD (4K) TV (QE98QN100BTXTK)'}, {'id': 839952, 'title': 'Regal 65R755UA11 Ultra HD (4K) TV (20277133)'}, {'id': 840442, 'title': 'Toshiba 65UA2263DT Ultra HD (4K) TV (20277169)'}, {'id': 843343, 'title': 'Philips 77OLED937 Ultra HD (4K) TV (77OLED937/12)'}, {'id': 844401, 'title': 'Vestel 65UA9630 Ultra HD (4K) TV (20277309)'}, {'id': 845155, 'title': 'Toshiba 58UA3D63DT Ultra HD (4K) TV (20276628)'}, {'id': 846350, 'title': 'LG OLED Flex 42LX3Q6LA Ultra HD (4K) TV'}, {'id': 846519, 'title': 'LG OLED77CS6LA Ultra HD (4K) TV'}, {'id': 848040, 'title': 'Beko B55 OLED C 970 B Ultra HD (4K) TV'}, {'id': 848793, 'title': 'TCL 98C735 Ultra HD (4K) TV'}, {'id': 851906, 'title': 'Ar elik A75 D 790 B Ultra HD (4K) TV'}, {'id': 851916, 'title': 'Ar elik A65 D 895 A Ultra HD (4K) TV'}, {'id': 851918, 'title': 'Ar elik A75 D 895 A Ultra HD (4K) TV'}, {'id': 852727, 'title': 'Beko B75 D 790 B Ultra HD (4K) TV'}, {'id': 855607, 'title': 'Beko B65 D 895 A Ultra HD (4K) TV'}, {'id': 856212, 'title': 'Vestel 65UG9630 Ultra HD (4K) TV (20276711)'}, {'id': 856225, 'title': 'Vestel 55UG9630 Ultra HD (4K) TV (20276712)'}, {'id': 859372, 'title': 'Vestel 55O9930 Ultra HD (4K) TV (20277958)'}, {'id': 859377, 'title': 'Vestel 65O9930 Ultra HD (4K) TV (20277962)'}, {'id': 860236, 'title': 'Samsung 55S90C Ultra HD (4K) TV (QE55S90CATXTK)'}, {'id': 860245, 'title': 'Samsung 65S90C Ultra HD (4K) TV (QE65S90CATXTK)'}, {'id': 860253, 'title': 'Samsung 55QN700C Ultra HD (8K) TV (QE55QN700CTXTK)'}, {'id': 860264, 'title': 'Samsung 65QN700C Ultra HD (8K) TV (QE65QN700CTXTK)'}, {'id': 860265, 'title': 'Samsung 75QN700C Ultra HD (8K) TV (QE75QN700CTXTK)'}, {'id': 860271, 'title': 'Samsung 65QN800C Ultra HD (8K) TV (QE65QN800CTXTK)'}, {'id': 860275, 'title': 'Samsung 75QN800C Ultra HD (8K) TV (QE75QN800CTXTK)'}, {'id': 860408, 'title': 'Samsung 75QN900C Ultra HD (8K) TV (QE75QN900CTXTK)'}, {'id': 860417, 'title': 'Samsung 85QN900C Ultra HD (8K) TV (QE85QN900CTXTK)'}, {'id': 860677, 'title': 'Samsung 55QN90C Ultra HD (4K) TV (QE55QN90CATXTK)'}, {'id': 860688, 'title': 'Samsung 65QN90C Ultra HD (4K) TV (QE65QN90CATXTK)'}, {'id': 860690, 'title': 'Samsung 75QN90C Ultra HD (4K) TV (QE75QN90CATXTK)'}, {'id': 860693, 'title': 'Samsung 85QN90C Ultra HD (4K) TV (QE85QN90CATXTK)'}, {'id': 861276, 'title': 'Grundig Tokyo 65 GHU 7905 C Ultra HD (4K) TV'}, {'id': 863006, 'title': 'Philips 65PUS8887 Ultra HD (4K) TV (65PUS8887/12)'}, {'id': 863009, 'title': 'Philips 55PUS8057 Ultra HD (4K) TV (55PUS8057/62)'}, {'id': 863733, 'title': 'Samsung 85LS03BG Ultra HD (4K) TV (QE85LS03BGUXTK)'}, {'id': 863735, 'title': 'Samsung 75LS03BG Ultra HD (4K) TV (QE75LS03BGUXTK)'}, {'id': 863736, 'title': 'Samsung 75Q70C Ultra HD (4K) TV (QE75Q70CATXTK)'}, {'id': 863737, 'title': 'Samsung 65QN85C Ultra HD (4K) TV (QE65QN85CATXTK)'}, {'id': 863738, 'title': 'Samsung 65LS03BG Ultra HD (4K) TV (QE65LS03BGUXTK)'}, {'id': 863739, 'title': 'Samsung 55QN85C Ultra HD (4K) TV (QE55QN85CATXTK)'}, {'id': 863740, 'title': 'Samsung 75CU8500 Ultra HD (4K) TV (UE75CU8500UXTK)'}, {'id': 863741, 'title': 'Samsung 75CU7100 Ultra HD (4K) TV (UE75CU7100UXTK)'}, {'id': 863742, 'title': 'Samsung 65CU8500 Ultra HD (4K) TV (UE65CU8500UXTK)'}, {'id': 863743, 'title': 'Samsung 55Q67C Ultra HD (4K) TV (QE55Q67CAUXTK)'}, {'id': 863745, 'title': 'Grundig 75 GHU 7000 B Ultra HD (4K) TV'}, {'id': 863746, 'title': 'Samsung 55CU8500 Ultra HD (4K) TV (UE55CU8500UXTK)'}, {'id': 863756, 'title': 'Toshiba 55QA4263DT Ultra HD (4K) TV (20277393)'}, {'id': 863905, 'title': 'Samsung 55CU8000 Ultra HD (4K) TV (UE55CU8000UXTK)'}, {'id': 863965, 'title': 'Samsung 65CU8000 Ultra HD (4K) TV (UE65CU8000UXTK)'}, {'id': 863985, 'title': 'Samsung 75CU8000 Ultra HD (4K) TV (UE75CU8000UXTK)'}, {'id': 863999, 'title': 'Samsung 85CU8000 Ultra HD (4K) TV (UE85CU8000UXTK)'}, {'id': 864092, 'title': 'Samsung 65CU7000 Ultra HD (4K) TV (UE65CU7000UXTK)'}, {'id': 864122, 'title': 'Samsung 85CU7100 Ultra HD (4K) TV (UE85CU7100UXTK)'}, {'id': 864131, 'title': 'Samsung 70CU7100 Ultra HD (4K) TV (UE70CU7100UXTK)'}, {'id': 864285, 'title': 'Samsung 75QN85C Ultra HD (4K) TV (QE75QN85CATXTK)'}, {'id': 864290, 'title': 'Samsung 85QN85C Ultra HD (4K) TV (QE85QN85CATXTK)'}, {'id': 864321, 'title': 'Samsung 65Q67C Ultra HD (4K) TV (QE65Q67CAUXTK)'}, {'id': 864323, 'title': 'Samsung 50Q67C Ultra HD (4K) TV (QE50Q67CAUXTK)'}, {'id': 864345, 'title': 'Samsung 55Q70C Ultra HD (4K) TV (QE55Q70CATXTK)'}, {'id': 864376, 'title': 'Samsung 65Q70C Ultra HD (4K) TV (QE65Q70CATXTK)'}, {'id': 864382, 'title': 'Samsung 85Q70C Ultra HD (4K) TV (QE85Q70CATXTK)'}, {'id': 864391, 'title': 'Samsung 55LS03BG Ultra HD (4K) TV (QE55LS03BGUXTK)'}, {'id': 864642, 'title': 'Philips 65PUS8057 Ultra HD (4K) TV (65PUS8057/12)'}, {'id': 864650, 'title': 'Philips 50PUS8057 Ultra HD (4K) TV (50PUS8057/62)'}, {'id': 865158, 'title': 'LG OLED83G36LA Ultra HD (4K) TV'}, {'id': 865159, 'title': 'LG OLED65G36LA Ultra HD (4K) TV'}, {'id': 865165, 'title': 'LG OLED55G36LA Ultra HD (4K) TV'}, {'id': 865349, 'title': 'TCL 50P725G Ultra HD (4K) TV'}, {'id': 865888, 'title': 'Grundig 65 GHU 8500 A Ultra HD (4K) TV'}, {'id': 865896, 'title': 'Grundig 55 GHU 8500 A Ultra HD (4K) TV'}, {'id': 865928, 'title': 'Grundig 50 GHU 8500 A Ultra HD (4K) TV'}, {'id': 866033, 'title': 'Vestel 75UA9530 Ultra HD (4K) TV (20277883)'}, {'id': 867110, 'title': 'Grundig 65 GHU 7505 B Ultra HD (4K) TV'}, {'id': 867113, 'title': 'Grundig 75 GHU 7505 B Ultra HD (4K) TV'}, {'id': 867319, 'title': 'Samsung 50Q60C Ultra HD (4K) TV (QE50Q60CAUXTK)'}, {'id': 867320, 'title': 'Samsung 55Q60C Ultra HD (4K) TV (QE55Q60CAUXTK)'}, {'id': 867321, 'title': 'Samsung 65Q60C Ultra HD (4K) TV (QE65Q60CAUXTK)'}, {'id': 867329, 'title': 'Grundig 75 GHU 8500 A Ultra HD (4K) TV'}, {'id': 867330, 'title': 'Samsung 55CU8100 Ultra HD (4K) TV (UE55CU8100UXTK)'}, {'id': 867331, 'title': 'Regal 65R854UQR Ultra HD (4K) TV (20277983)'}, {'id': 867518, 'title': 'Samsung 65CU8100 Ultra HD (4K) TV (UE65CU8100UXTK)'}, {'id': 868528, 'title': 'LG OLED77C34LA Ultra HD (4K) TV'}, {'id': 868529, 'title': 'LG OLED65C34LA Ultra HD (4K) TV'}, {'id': 868530, 'title': 'Samsung 75Q80C Ultra HD (4K) TV (QE75Q80CATXTK)'}, {'id': 868531, 'title': 'LG OLED55C34LA Ultra HD (4K) TV'}, {'id': 868532, 'title': 'LG 75UR91006LA Ultra HD (4K) TV'}, {'id': 868533, 'title': 'LG OLED83C34LA Ultra HD (4K) TV'}, {'id': 868534, 'title': 'LG 75UR81006LJ Ultra HD (4K) TV'}, {'id': 868535, 'title': 'Telefunken 75TU9080UA Ultra HD (4K) TV (20278160)'}, {'id': 868536, 'title': 'Vestel 70UA9630 Ultra HD (4K) TV (20277882)'}, {'id': 868710, 'title': 'LG 65UR81006LJ Ultra HD (4K) TV'}, {'id': 868954, 'title': 'Samsung 65Q80C Ultra HD (4K) TV (QE65Q80CATXTK)'}, {'id': 868957, 'title': 'Samsung 55Q80C Ultra HD (4K) TV (QE55Q80CATXTK)'}, {'id': 868988, 'title': 'LG 65UR91006LA Ultra HD (4K) TV'}, {'id': 869018, 'title': 'LG 50QNED816RE Ultra HD (4K) TV'}, {'id': 869070, 'title': 'LG 55QNED816RE Ultra HD (4K) TV'}, {'id': 869080, 'title': 'LG 65QNED816RE Ultra HD (4K) TV'}, {'id': 869085, 'title': 'LG 75QNED816RE Ultra HD (4K) TV'}, {'id': 869088, 'title': 'LG 86QNED816RE Ultra HD (4K) TV'}, {'id': 869219, 'title': 'LG OLED48C34LA Ultra HD (4K) TV'}, {'id': 869407, 'title': 'Samsung 75Q60C Ultra HD (4K) TV (QE75Q60CAUXTK)'}, {'id': 869408, 'title': 'Vestel 65UM9910 Ultra HD (4K) TV (20276496)'}, {'id': 869454, 'title': 'Samsung 85Q60C Ultra HD (4K) TV (QE85Q60CAUXTK)'}, {'id': 870423, 'title': 'Samsung 77S95C Ultra HD (4K) TV (QE77S95CATXTK)'}, {'id': 870424, 'title': 'Samsung 65CU7200 Ultra HD (4K) TV (UE65CU7200UXTK)'}, {'id': 870621, 'title': 'Samsung 65S95C Ultra HD (4K) TV (QE65S95CATXTK)'}, {'id': 870783, 'title': 'Vestel 65UA9631 Ultra HD (4K) TV (20278122)'}, {'id': 873763, 'title': 'LG OLED55CS3VA Ultra HD (4K) TV'}, {'id': 873773, 'title': 'LG OLED65CS3VA Ultra HD (4K) TV'}, {'id': 874732, 'title': 'TCL 58P633 Ultra HD (4K) TV'}, {'id': 875500, 'title': 'Toshiba 58QA4263DT Ultra HD (4K) TV (20277907)'}, {'id': 875508, 'title': 'Philips 48OLED708 Ultra HD (4K) TV (48OLED708/12)'}, {'id': 875509, 'title': 'Philips 75PUS8108 Ultra HD (4K) TV (75PUS8108/12)'}, {'id': 875678, 'title': 'Samsung 77S90C Ultra HD (4K) TV (QE77S90CATXTK)'}, {'id': 875679, 'title': 'Samsung 43LS05BG (The Sero) Ultra HD (4K) TV (QE43LS05BGUXTK)'}, {'id': 876446, 'title': 'Samsung 98Q80C Ultra HD (4K) TV (QE98Q80CATXTK)'}, {'id': 876447, 'title': 'Philips 65OLED708 Ultra HD (4K) TV (65OLED708/12)'}, {'id': 876448, 'title': 'Philips 75PUS8808 Ultra HD (4K) TV (75PUS8808/12)'}, {'id': 876449, 'title': 'Telenova Revo 85" Ultra HD (4K) TV (85KS1101)'}, {'id': 876450, 'title': 'Philips 70PUS8108 Ultra HD (4K) TV (70PUS8108/12)'}, {'id': 882315, 'title': 'TCL 50P633 Ultra HD (4K) TV'}, {'id': 883297, 'title': 'Vestel 70QA9700 Ultra HD (4K) TV (20277884)'}, {'id': 884157, 'title': 'TCL 85C645 Ultra HD (4K) TV (85C645GTV)'}, {'id': 884158, 'title': 'LG 86UR81006LA Ultra HD (4K) TV'}, {'id': 884159, 'title': 'Samsung 58CU7000U Ultra HD (4K) TV (UE58CU7000UXTK)'}, {'id': 884160, 'title': 'Regal 75R754UR Ultra HD (4K) TV (20277982)'}, {'id': 884505, 'title': 'Philips 65OLED808 Ultra HD (4K) TV (65OLED808/12)'}, {'id': 884856, 'title': 'JVC LT-75VA8205T Ultra HD (4K) TV'}, {'id': 885497, 'title': 'Philips 55OLED808 Ultra HD (4K) TV (55OLED808/12)'}, {'id': 885498, 'title': 'Philips 55OLED708 Ultra HD (4K) TV (55OLED708/12)'}, {'id': 885499, 'title': 'Philips 65PUS8808 Ultra HD (4K) TV (65PUS8808/62)'}, {'id': 885500, 'title': 'TCL 65C845 Ultra HD (4K) TV (65C845GTV)'}, {'id': 885501, 'title': 'Philips 65PUS8508 Ultra HD (4K) TV (65PUS8508/62)'}, {'id': 885502, 'title': 'Philips 55PUS8808 Ultra HD (4K) TV (55PUS8808/62)'}, {'id': 885503, 'title': 'Philips 65PUS8108 Ultra HD (4K) TV (65PUS8108/62)'}, {'id': 885504, 'title': 'Philips 50PUS8808 Ultra HD (4K) TV'}, {'id': 885505, 'title': 'TCL 65C645 Ultra HD (4K) TV (65C645GTV)'}, {'id': 885506, 'title': 'Philips 55PUS8108 Ultra HD (4K) TV (55PUS8108/62)'}, {'id': 885507, 'title': 'Philips 50PUS8508 Ultra HD (4K) TV'}, {'id': 885520, 'title': 'Philips 77OLED808 Ultra HD (4K) TV (77OLED808/12)'}, {'id': 885608, 'title': 'Philips 50PUS8108 Ultra HD (4K) TV (50PUS8108/62)'}, {'id': 885627, 'title': 'Philips 55PUS8508 Ultra HD (4K) TV'}, {'id': 885664, 'title': 'TCL 50C645 Ultra HD (4K) TV (50C645GTV)'}, {'id': 885695, 'title': 'TCL 55C645 Ultra HD (4K) TV (55C645GTV)'}, {'id': 885697, 'title': 'TCL 75C645 Ultra HD (4K) TV (75C645GTV)'}, {'id': 885748, 'title': 'Philips 85PUS8808 Ultra HD (4K) TV'}, {'id': 885867, 'title': 'TCL 75C845 Ultra HD (4K) TV (75C845GTV)'}, {'id': 885964, 'title': 'Samsung 55LS01BG Ultra HD (4K) TV (QE55LS01BGUXTK)'}, {'id': 886132, 'title': 'Grundig 75 GHU 8000 Ultra HD (4K) TV'}, {'id': 886163, 'title': 'Toshiba 65QA5D63DT Ultra HD (4K) TV (20276636)'}, {'id': 886168, 'title': 'Toshiba 55QA5D63DT Ultra HD (4K) TV (20276635)'}, {'id': 886294, 'title': 'Ar elik A65 OLED C 970 BE Ultra HD (4K) TV'}, {'id': 890856, 'title': 'TCL 75C745 Ultra HD (4K) TV (75C745GTV)'}, {'id': 890857, 'title': 'TCL 65C745 Ultra HD (4K) TV (65C745GTV)'}, {'id': 890858, 'title': 'TCL 55C745 Ultra HD (4K) TV (55C745GTV)'}, {'id': 892698, 'title': 'LG OLED83M39LA Ultra HD (4K) TV'}, {'id': 892699, 'title': 'LG OLED77M39LA Ultra HD (4K) TV'}, {'id': 893122, 'title': 'Samsung HG55AU800EE Ultra HD (4K) TV (HG55AU800EEXEN)'}, {'id': 894863, 'title': 'Vestel 50Q9700TT Ultra HD (4K) TV (20278352)'}, {'id': 894868, 'title': 'Vestel 55Q9700TT Ultra HD (4K) TV (20278353)'}, {'id': 895145, 'title': 'Toshiba 70QA5D63DT Ultra HD (4K) TV (20278082)'}, {'id': 895154, 'title': 'Vestel 55O9800TT Ultra HD (4K) TV (20278310)'}, {'id': 895758, 'title': 'Vestel 70Q9700TT Ultra HD (4K) TV (20278354)'}, {'id': 895787, 'title': 'Vestel 43Q9700TT Ultra HD (4K) TV (20278351)'}, {'id': 897287, 'title': 'LG OLED77B36LA Ultra HD (4K) TV'}, {'id': 898341, 'title': 'Philips 75PML9008 Ultra HD (4K) TV (75PML9008/12)'}, {'id': 898343, 'title': 'Philips 55PML9308 Ultra HD (4K) TV (55PML9308/12)'}, {'id': 898344, 'title': 'Philips 65PML9008 Ultra HD (4K) TV (65PML9008/12)'}, {'id': 898345, 'title': 'Philips 55PML9008 Ultra HD (4K) TV (55PML9008/12)'}, {'id': 898622, 'title': 'Philips 65OLED908 Ultra HD (4K) TV (65OLED908/12)'}, {'id': 899340, 'title': 'Vestel 65OG9930 Ultra HD (4K) TV (20278166)'}, {'id': 899524, 'title': 'Vestel 55OG9930 Ultra HD (4K) TV (20278167)'}, {'id': 899797, 'title': 'LG 65QNED756RA Ultra HD (4K) TV'}, {'id': 901116, 'title': 'Toshiba 70QG5E63DT Ultra HD (4K) TV (20278210)'}, {'id': 901120, 'title': 'TCL 43P735 Ultra HD (4K) TV'}, {'id': 902119, 'title': 'LG OLED97M39LA Ultra HD (4K) TV'}, {'id': 902123, 'title': 'TCL 58P733 Ultra HD (4K) TV (58P733GTV)'}, {'id': 902124, 'title': 'Vestel 50Q9500TE Ultra HD (4K) TV (20278348)'}, {'id': 902125, 'title': 'Vestel 43Q9500TE Ultra HD (4K) TV (20278347)'}, {'id': 904101, 'title': 'Xiaomi Mi TV P1 55" Ultra HD (4K) TV (L55M6-6AEU)'}, {'id': 905533, 'title': 'Philips 65PUS8848 Ultra HD (4K) TV (65PUS8848/62)'}, {'id': 905534, 'title': 'Philips 70PUS8118 Ultra HD (4K) TV (70PUS8118/62)'}, {'id': 905535, 'title': 'Philips 65PUS8548 Ultra HD (4K) TV'}, {'id': 905536, 'title': 'Vestel 70Q9500TE Ultra HD (4K) TV (20278350)'}, {'id': 905537, 'title': 'Philips 55PUS8548 Ultra HD (4K) TV'}, {'id': 905538, 'title': 'Regal 70R66QA11 Ultra HD (4K) TV (20278307)'}, {'id': 905539, 'title': 'Philips 55PUS8118 Ultra HD (4K) TV (55PUS8118/62)'}, {'id': 905540, 'title': 'Philips 50PUS8548 Ultra HD (4K) TV'}, {'id': 905541, 'title': 'Philips 50PUS8118 Ultra HD (4K) TV (50PUS8118/62)'}, {'id': 905543, 'title': 'Regal 65R75UA11 Ultra HD (4K) TV (20278227)'}, {'id': 905544, 'title': 'Vestel 55Q9500TE Ultra HD (4K) TV (20278349)'}, {'id': 905549, 'title': 'JVC LT-58VA3205T Ultra HD (4K) TV (20277465)'}, {'id': 905561, 'title': 'Toshiba 50QA5D63DT Ultra HD (4K) TV (20276633)'}
   
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Map<String, dynamic>> matchQuery = [];
    for (var country in _allDream) {
      if (country["title"].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(country);
      }
    }

    return Container(
      color: const Color.fromARGB(255, 185, 185, 185),
      child: ListView.builder(
        itemBuilder: (context, index) {
          var result = matchQuery[index];

          return ListTile(
            title: Text(result["title"]),
            onTap: () {
              Navigator.of(context, rootNavigator: false).push(
                MaterialPageRoute(
                  builder: ((context) => DetailsPage(
                        id: matchQuery[index]["id"].toString(),
                      )),
                ),
              );
            },
          );
        },
        itemCount: matchQuery.length,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, dynamic>> matchQuery = [];
    for (var country in _allDream) {
      if (country["title"].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(country);
      }
    }
    return Container(
      color: const Color.fromARGB(255, 185, 185, 185),
      child: ListView.builder(
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result["title"]),
            onTap: () {
              Navigator.of(context, rootNavigator: false).push(
                MaterialPageRoute(
                  builder: ((context) => DetailsPage(
                        id: matchQuery[index]["id"].toString(),
                      )),
                ),
              );
            },
          );
        },
        itemCount: matchQuery.length,
      ),
    );
  }
}
