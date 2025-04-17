import 'package:compare_app/models/user.dart';
import 'package:compare_app/screens/details_page.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({Key? key, required this.user}) : super(key: key);
  Users? user;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
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
                "Telefonlar",
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
    {"id": 757414, "title": "Samsung Galaxy S22 Ultra (512 GB)"},
    {"id": 674253, "title": "OnePlus 9 Pro (LE2123)"},
    {"id": 646910, "title": "Samsung Galaxy S21 Ultra 5G (256 GB) (SM-G998B)"},
    {"id": 757408, "title": "Samsung Galaxy S22+ (256 GB)"},
    {"id": 709026, "title": "Huawei P50 Pro (JAD-LX9)"},
    {"id": 625372, "title": "OnePlus 8 Pro (256 GB)"},
    {"id": 741184, "title": "Samsung Galaxy S22 (SM-S901E)"},
    {"id": 717143, "title": "Apple iPhone 13 Pro Max (1 TB)"},
    {"id": 616059, "title": "Huawei Mate 40 Pro"},
    {"id": 717140, "title": "Apple iPhone 13 Pro (1 TB)"},
    {"id": 413835, "title": "Samsung Galaxy S20 Ultra (SM-G988B/DS)"},
    {"id": 646909, "title": "Samsung Galaxy S21 Plus 5G (256 GB) (SM-G996B)"},
    {"id": 425115, "title": "Oppo Find X2 (CPH2023)"},
    {"id": 413329, "title": "Huawei P40 Pro (ELS-NX9)"},
    {"id": 742087, "title": "Samsung Galaxy S21 FE 5G (256 GB)"},
    {"id": 711274, "title": "Samsung Galaxy Z Fold3 5G (SM-F926B/DS)"},
    {"id": 638816, "title": "Samsung Galaxy S21 5G (SM-G991B)"},
    {"id": 628421, "title": "Apple iPhone 12 Pro Max (512 GB)"},
    {"id": 587270, "title": "Samsung Galaxy Note 20 Ultra (SM-N985F/DS)"},
    {"id": 404678, "title": "Samsung Galaxy Note10+ Star Wars Special Edition"},
    {"id": 174667, "title": "Samsung Galaxy Note 10+ (Plus) (SM-N975F)"},
    {"id": 700656, "title": "Samsung Galaxy S20 FE (256 GB) (SM-G780G)"},
    {"id": 628419, "title": "Apple iPhone 12 Pro (512 GB)"},
    {"id": 689553, "title": "Xiaomi Mi 11 (256 GB)"},
    {"id": 682384, "title": "Samsung Galaxy S21 FE 5G (SM-G990E)"},
    {"id": 628418, "title": "Apple iPhone 12 Pro (256 GB)"},
    {"id": 716103, "title": "Xiaomi 11T Pro"},
    {"id": 674205, "title": "OnePlus 9"},
    {"id": 621833, "title": "Samsung Galaxy S20 FE (256 GB) (SM-G780F)"},
    {"id": 578746, "title": "Samsung Galaxy S20+ Plus BTS Edition (SM-G985F)"},
    {"id": 413834, "title": "Samsung Galaxy S20+ Plus (SM-G985F)"},
    {"id": 153559, "title": "Samsung Galaxy S10+ Plus (512 GB)"},
    {"id": 717137, "title": "Apple iPhone 13 (512 GB)"},
    {"id": 687645, "title": "Samsung Galaxy S20 FE (SM-G780G)"},
    {"id": 613693, "title": "Apple iPhone 12 Pro (128 GB)"},
    {"id": 415585, "title": "Samsung Galaxy S20 (SM-G980F)"},
    {"id": 407688, "title": "Xiaomi Mi 10"},
    {"id": 309229, "title": "Huawei Mate 30 Pro"},
    {"id": 717135, "title": "Apple iPhone 13 mini (512 GB)"},
    {"id": 738967, "title": "Huawei P50 Pocket (BAL-L49)"},
    {"id": 717715, "title": "Xiaomi Black Shark 4 (256 GB / 12 GB)"},
    {"id": 711314, "title": "Samsung Galaxy Z Flip3 5G (SM-F711B)"},
    {"id": 628425, "title": "Apple iPhone 12 (256 GB)"},
    {"id": 587272, "title": "Samsung Galaxy Note 20 (SM-N980F/DS)"},
    {"id": 142363, "title": "Samsung Galaxy S10+ Plus (SM-G975F)"},
    {"id": 771820, "title": "Samsung Galaxy A73 5G (256 GB)"},
    {"id": 726241, "title": "Xiaomi 11T Pro (256 GB / 12 GB)"},
    {"id": 663992, "title": "realme GT (RMX2202)"},
    {"id": 624351, "title": "Xiaomi Mi 10T Pro (256 GB)"},
    {"id": 559401, "title": "Poco F2 Pro (256 GB)"},
    {"id": 171536, "title": "Samsung Galaxy Note 10 (SM-N970F)"},
    {"id": 136486, "title": "Samsung Galaxy S10 (SM-G973F)"},
    {"id": 758097, "title": "Samsung Galaxy A73 5G (SM-A736B)"},
    {"id": 687816, "title": "Poco F3 (256 GB / 8 GB)"},
    {"id": 628424, "title": "Apple iPhone 12 (128 GB)"},
    {"id": 628423, "title": "Apple iPhone 12 mini (256 GB)"},
    {"id": 586320, "title": "Samsung Galaxy Z Fold2 (SM-F916B)"},
    {"id": 335133, "title": "Apple iPhone 11 Pro Max (512 GB)"},
    {"id": 155827, "title": "Huawei P30 Pro (256 GB / 8 GB)"},
    {"id": 716042, "title": "Xiaomi 11T"},
    {"id": 712341, "title": "Samsung Galaxy A52s 5G (SM-A528B/DS)"},
    {"id": 628422, "title": "Apple iPhone 12 mini (128 GB)"},
    {"id": 441835, "title": "OnePlus 8"},
    {"id": 413203, "title": "Huawei P40 (ANA-NX9)"},
    {"id": 645524, "title": "Xiaomi Black Shark 4"},
    {"id": 624358, "title": "Xiaomi Mi 10T (8 GB)"},
    {"id": 613344, "title": "Apple iPhone 12 (64 GB)"},
    {"id": 556728, "title": "Poco F2 Pro"},
    {"id": 159420, "title": "Oppo Reno 10x Zoom"},
    {"id": 125051, "title": "Huawei Mate 20 Pro (LYA-L09)"},
    {"id": 749534, "title": "Samsung Galaxy A53 5G (SM-A536E)"},
    {"id": 663015, "title": "Poco F3"},
    {"id": 613689, "title": "Apple iPhone 12 mini (64 GB)"},
    {"id": 608099, "title": "Xiaomi Mi 10T"},
    {"id": 335128, "title": "Apple iPhone 11 Pro (256 GB)"},
    {"id": 150453, "title": "Huawei P30 Pro"},
    {"id": 726232, "title": "Xiaomi 11 Lite 5G NE (256 GB / 8 GB)"},
    {"id": 684651, "title": "Samsung Galaxy A72 (256 GB)"},
    {"id": 676734, "title": "Xiaomi Mi 11 Lite 5G"},
    {"id": 424998, "title": "Xiaomi Black Shark 3"},
    {"id": 754792, "title": "Samsung Galaxy A33 5G (SM-A336E)"},
    {"id": 726228, "title": "Xiaomi 11 Lite 5G NE (128 GB / 8 GB)"},
    {"id": 712888, "title": "Poco X3 GT (256 GB)"},
    {"id": 686240, "title": "Poco X3 Pro (256 GB)"},
    {"id": 350745, "title": "realme X2 Pro (RMX1931)"},
    {"id": 224036, "title": "Apple iPhone 11 Pro Max"},
    {"id": 717978, "title": "OnePlus Nord (256 GB)"},
    {"id": 716925, "title": "Samsung Galaxy M52 5G (SM-M526BR)"},
    {"id": 696921, "title": "Poco X3 GT"},
    {"id": 650314, "title": "Samsung Galaxy A72 (128 GB) (SM-A725F)"},
    {"id": 395684, "title": "Samsung Galaxy S10 Lite (SM-G770F)"},
    {"id": 224024, "title": "Apple iPhone 11 Pro"},
    {"id": 155955, "title": "Xiaomi Mi 9 (128 GB / 6 GB)"},
    {"id": 151171, "title": "LG G8s ThinQ (LMG810)"},
    {"id": 143967, "title": "Samsung Galaxy S10e (SM-G970F)"},
    {"id": 767030, "title": "Poco X4 Pro 5G (256 GB)"},
    {"id": 717408, "title": "Xiaomi 11 Lite 5G NE"},
    {"id": 709096, "title": "realme GT Master Edition (RMX3363)"},
    {"id": 682283, "title": "TCL 20 Pro 5G"},
    {"id": 425899, "title": "Oppo Reno 3 Pro (CPH2009)"},
    {"id": 107295, "title": "Samsung Galaxy S9+ (Plus) (256 GB)"},
    {"id": 741017, "title": "Infinix Zero X Pro (256 GB)"},
    {"id": 674215, "title": "Poco X3 Pro"},
    {"id": 655654, "title": "Samsung Galaxy A52 (SM-A525F)"},
    {"id": 601285, "title": "LG Wing (LM-F100EMW)"},
    {"id": 423942, "title": "Huawei Mate Xs (TAH-N29m)"},
    {"id": 417133, "title": "Samsung Galaxy Z Flip (SM-F700F)"},
    {"id": 390260, "title": "Xiaomi Mi Note 10 Pro"},
    {"id": 143981, "title": "Xiaomi Mi 9"},
    {
      "id": 131639,
      "title": "Apple iPhone XS Max (512 GB) (MT582TU/A, MT572TU/A, MT562TU/A)"
    },
    {"id": 109641, "title": "Samsung Galaxy Note 9 (SM-N960F)"},
    {
      "id": 758822,
      "title":
          "Apple iPhone SE 3 (2022) (256 GB) (MMXM3TU/A, MMXN3TU/A, MMXP3TU/A)"
    },
    {"id": 724397, "title": "Huawei Nova 9 (NAM-LX9)"},
    {"id": 699858, "title": "Honor 50 (NTH-NX9)"},
    {"id": 639324, "title": "Vivo X51 5G"},
    {"id": 223930, "title": "Xiaomi Mi 9T Pro (128 GB)"},
    {
      "id": 131638,
      "title": "Apple iPhone XS Max (256 GB) (MT532TU/A, MT542TU/A, MT552TU/A)"
    },
    {
      "id": 131614,
      "title": "Apple iPhone XS (512 GB) (MT9L2TU/A, MT9N2TU/A, MT9M2TU/A)"
    },
    {"id": 107034, "title": "Samsung Galaxy S9+ (Plus) (128 GB)"},
    {
      "id": 758817,
      "title":
          "Apple iPhone SE 3 (2022) (128 GB) (MMXJ3TU/A, MMXK3TU/A, MMXL3TU/A)"
    },
    {"id": 750160, "title": "Poco X4 Pro 5G"},
    {"id": 723841, "title": "Infinix Zero X Pro (X6811)"},
    {"id": 677294, "title": "Redmi Note 10 Pro (8 GB)"},
    {"id": 586039, "title": "LG Velvet (LM-G910)"},
    {"id": 404477, "title": "Samsung Galaxy Note 10 Lite (SM-N770F/DS)"},
    {"id": 335126, "title": "Apple iPhone 11 (256 GB)"},
    {"id": 150449, "title": "Huawei P30"},
    {"id": 99827, "title": "Samsung Galaxy S9+ (Plus) (SM-G965F)"},
    {"id": 743203, "title": "OnePlus 7 (256 GB)"},
    {"id": 721769, "title": "Tecno Phantom X"},
    {"id": 663810, "title": "Redmi Note 10 Pro (6 GB)"},
    {"id": 369670, "title": "Xiaomi Mi Note 10"},
    {"id": 335107, "title": "Apple iPhone 11 (128 GB)"},
    {"id": 202835, "title": "Oppo Reno 2"},
    {"id": 167772, "title": "Xiaomi Mi 9T Pro"},
    {
      "id": 107341,
      "title": "Samsung Galaxy S9+ (Plus) (64 GB / Çift Hat) (SM-G965F/DS)"
    },
    {
      "id": 758749,
      "title": "Apple iPhone SE 3 (2022) (MMXF3TU/A, MMXG3TU/A, MMXH3TU/A)"
    },
    {"id": 734677, "title": "Tecno Camon 18 Premier (CH9n)"},
    {"id": 686745, "title": "Vivo V21"},
    {"id": 650120, "title": "Xiaomi Mi 10T Lite (128 GB)"},
    {"id": 588658, "title": "Samsung Galaxy M51 (SM-M515F/DSN)"},
    {"id": 587228, "title": "Oppo Reno 4 Pro (CPH2109)"},
    {"id": 767035, "title": "Redmi Note 11 Pro (8 GB)"},
    {"id": 701725, "title": "Xiaomi Mi 11 Lite (8 GB)"},
    {"id": 327494, "title": "OnePlus 7T"},
    {"id": 223976, "title": "Apple iPhone 11"},
    {
      "id": 127714,
      "title": "Apple iPhone XS Max (MT512TU/A, MT522TU/A, MT502TU/A)"
    },
    {"id": 105370, "title": "Huawei P20 Pro (CLT-L09)"},
    {"id": 96204, "title": "Samsung Galaxy S9 (SM-G960F)"},
    {"id": 757736, "title": "Samsung Galaxy M33 5G (SM-M336B)"},
    {"id": 747759, "title": "Redmi Note 11 Pro"},
    {"id": 718916, "title": "OnePlus Nord CE 5G (256 GB)"},
    {"id": 715805, "title": "ZTE Nubia Red Magic 5G Lite"},
    {"id": 708072, "title": "Oppo Reno6 (CPH2235)"},
    {"id": 697751, "title": "Oppo Reno5 Marvel Edition"},
    {"id": 676027, "title": "Xiaomi Mi 11 Lite (6 GB)"},
    {"id": 642795, "title": "Oppo Reno5 (CPH2159)"},
    {"id": 615620, "title": "Poco X3 NFC (128 GB)"},
    {"id": 609328, "title": "Xiaomi Mi 10T Lite (64 GB)"},
    {"id": 596223, "title": "realme 7 Pro (RMX2170)"},
    {"id": 590428, "title": "Xiaomi Mi Note 10 Lite (128 GB / 8 GB)"},
    {"id": 441361, "title": "Xiaomi Mi 10 Lite"},
    {"id": 402688, "title": "Samsung Galaxy A71 (SM-A715F)"},
    {
      "id": 126668,
      "title": "Apple iPhone XS (64 GB) (MT9E2TU/A, MT9G2TU/A, MT9F2TU/A)"
    },
    {
      "id": 82806,
      "title": "Samsung Galaxy Note 8 (Tek Hat / 64 GB) (SM-N950F)"
    },
    {"id": 686732, "title": "Vivo V21e"},
    {"id": 663858, "title": "Redmi Note 10S (128 GB)"},
    {"id": 608455, "title": "Oppo Reno 4 (CPH2113)"},
    {"id": 560576, "title": "Xiaomi Redmi Note 9 Pro (128 GB)"},
    {"id": 109176, "title": "Huawei Mate 20 (HMA-L29)"},
    {"id": 92486, "title": "Apple iPhone X (256 GB) (MQAG2TU/A, MQAF2TU/A)"},
    {"id": 763699, "title": "Poco M4 Pro (256 GB)"},
    {"id": 750883, "title": "Poco M4 Pro 5G (128 GB)"},
    {"id": 713651, "title": "Infinix Note 10 Pro (X695)"},
    {"id": 689619, "title": "Samsung Galaxy A51 (256 GB / 8 GB)"},
    {"id": 676896, "title": "realme 8 Pro (RMX3081)"},
    {"id": 596594, "title": "Poco X3 NFC (64 GB)"},
    {"id": 560581, "title": "Xiaomi Mi Note 10 Lite (128 GB / 6 GB)"},
    {
      "id": 548607,
      "title":
          "Apple iPhone SE 2 (2020) (256 GB) (MXVU2TU/A, MXVT2TU/A, MXVV2TU/A)"
    },
    {"id": 424649, "title": "realme 6 Pro (RMX2061)"},
    {"id": 365725, "title": "realme X2"},
    {"id": 128722, "title": "Xiaomi Mi 8 Pro"},
    {"id": 120420, "title": "Xiaomi Mi Mix 3"},
    {"id": 92555, "title": "Huawei Mate 10 Porsche Design"},
    {"id": 91539, "title": "Huawei Mate 10 Pro (Tek Hat / 128 GB) (BLA-L09)"},
    {"id": 89390, "title": "LG V30+ Plus (Tek Hat / 128 GB) (H930)"},
    {"id": 770214, "title": "Redmi Note 11S (128 GB / 6 GB)"},
    {"id": 757040, "title": "Samsung Galaxy M23 5G (SM-M236B)"},
    {"id": 715770, "title": "Redmi Note 10S (64 GB)"},
    {"id": 677304, "title": "Redmi Note 10 (6 GB / 128 GB)"},
    {"id": 585582, "title": "Samsung Galaxy M31s (SM-M317F/DSN)"},
    {"id": 543770, "title": "TCL 10 Pro (T799H)"},
    {"id": 429876, "title": "Oppo Reno 3 (CPH2043)"},
    {"id": 428494, "title": "Xiaomi Redmi Note 9 Pro"},
    {"id": 349693, "title": "Xiaomi Mi 9 Lite (128 GB)"},
    {
      "id": 138630,
      "title":
          "Apple iPhone XR (256 GB) (MRYJ2TU/A, MRYQ2TU/A, MRYP2TU/A, MRYN2TU/A, MRYM2TU/A, MRYL2TU/A)"
    },
    {"id": 677344, "title": "Oppo Reno5 Lite (CPH2205)"},
    {"id": 677301, "title": "Redmi Note 10 (4 GB / 128 GB)"},
    {"id": 618148, "title": "OnePlus Nord N10 5G (BE2029)"},
    {"id": 555495, "title": "Xiaomi Mi Note 10 Lite"},
    {
      "id": 548606,
      "title":
          "Apple iPhone SE 2 (2020) (128 GB) (MXD12TU/A, MXD02TU/A, MXD22TU/A)"
    },
    {"id": 547841, "title": "realme 6 (8 GB)"},
    {"id": 420165, "title": "Samsung Galaxy M31 (SM-M315F)"},
    {"id": 345128, "title": "Xiaomi Redmi Note 8 Pro (128 GB)"},
    {"id": 203136, "title": "Huawei Nova 5T (YAL-L21)"},
    {"id": 202888, "title": "Oppo Reno2 Z (CPH1951)"},
    {
      "id": 138629,
      "title":
          "Apple iPhone XR (128 GB) (MRYD2TU/A, MRYH2TU/A, MRYG2TU/A, MRYF2TU/A, MRYE2TU/A, MRY92TU/A)"
    },
    {"id": 138248, "title": "Meizu 16th (8 GB / 128 GB)"},
    {"id": 123770, "title": "Xiaomi Mi 8 (128 GB)"},
    {"id": 119742, "title": "OnePlus 6 (128 GB / 8 GB)"},
    {"id": 91263, "title": "HTC U11+ Plus"},
    {"id": 756006, "title": "Poco M4 Pro"},
    {"id": 747614, "title": "Redmi Note 11S"},
    {"id": 747292, "title": "General Mobile GM 22 Pro (G702)"},
    {"id": 745352, "title": "Infinix Note 11S"},
    {"id": 730355, "title": "Infinix Note 11 Pro (X697)"},
    {"id": 67305, "title": "Samsung Galaxy S8+ Plus (Tek Hat) (SM-G955F)"},
    {"id": 634238, "title": "Tecno Camon 16 Premier (CE9)"},
    {"id": 620539, "title": "TCL 10 Plus (256 GB)"},
    {"id": 436157, "title": "Xiaomi Redmi Note 9S"},
    {"id": 393643, "title": "Samsung Galaxy A51 (SM-A515F)"},
    {"id": 307616, "title": "Xiaomi Mi 9 Lite"},
    {"id": 165185, "title": "Xiaomi Mi 9 SE (128 GB)"},
    {"id": 163984, "title": "Honor 20 (YAL-L21)"},
    {"id": 157540, "title": "Samsung Galaxy A80 (SM-A805F)"},
    {"id": 155585, "title": "Samsung Galaxy A70 (SM-A705FN)"},
    {
      "id": 92441,
      "title": "Apple iPhone 8 Plus (256 GB) (MQ8P2TU/A, MQ8Q2TU/A, MQ8R2TU/A)"
    },
    {"id": 89863, "title": "Apple iPhone X (MQAC2TU/A, MQAD2TU/A)"},
    {"id": 72465, "title": "Samsung Galaxy S7 edge (128GB) (SM-G935F)"},
    {"id": 685012, "title": "Samsung Galaxy A32 (128 GB)"},
    {"id": 662517, "title": "Redmi Note 10 (4 GB / 64 GB)"},
    {"id": 620331, "title": "TCL 10 Plus (128 GB)"},
    {"id": 613204, "title": "Infinix Zero 8 (X687)"},
    {"id": 608053, "title": "Oppo Reno 4 Lite (CPH2125)"},
    {
      "id": 548579,
      "title":
          "Apple iPhone SE 2 (2020) (MX9T2TU/A, MX9R2TU/A, MX9U2TU/A, MHGQ3TU/A)"
    },
    {"id": 425056, "title": "Huawei P40 Lite (JNY-LX1)"},
    {"id": 307598, "title": "realme XT"},
    {"id": 202956, "title": "Xiaomi Redmi Note 8 Pro (64 GB)"},
    {"id": 150523, "title": "Xiaomi Mi 9 SE"},
    {"id": 142990, "title": "Oppo RX17 Pro"},
    {
      "id": 127715,
      "title":
          "Apple iPhone XR (MRY42TU/A, MRYA2TU/A, MRY82TU/A, MRY72TU/A, MRY62TU/A, MRY52TU/A)"
    },
    {"id": 115238, "title": "Xiaomi Mi 8 (64 GB)"},
    {"id": 112968, "title": "Xiaomi Mi MIX 2S (6 GB / 128 GB)"},
    {
      "id": 109253,
      "title":
          "Apple iPhone 8 Plus (PRODUCT)RED Special Edition (256 GB) (MRTA2TU/A)"
    },
    {"id": 87896, "title": "Huawei Mate 10 (Çift Hat) (ALP-L29)"},
    {"id": 73778, "title": "Sony Xperia XZ Premium (G8141)"},
    {"id": 73296, "title": "Huawei P10 Plus (128 GB / Tek Hat) (VKY-L09)"},
    {"id": 705137, "title": "Poco M3 Pro 5G (6 GB / 128 GB)"},
    {"id": 698539, "title": "Samsung Galaxy M32 (SM-M325F)"},
    {"id": 65625, "title": "Huawei Mate 9 Porsche Design"},
    {"id": 427126, "title": "realme 6 (4 GB) (RMX2001)"},
    {"id": 157630, "title": "Oppo Reno (CPH1917)"},
    {"id": 128083, "title": "Pocophone F1 (128 GB)"},
    {"id": 124827, "title": "Meizu 16th"},
    {"id": 114039, "title": "Huawei Mate 10 (Tek Hat) (ALP-L09)"},
    {"id": 106543, "title": "OnePlus 6 (64 GB / 6 GB)"},
    {"id": 105085, "title": "Asus ZenFone 5Z (ZS620KL)"},
    {
      "id": 85116,
      "title": "Samsung Galaxy Note FE (Fan Edition) (SM-N935F/DS)"
    },
    {"id": 757705, "title": "Samsung Galaxy A23 (SM-A235F)"},
    {"id": 757250, "title": "Huawei Nova 9 SE (JLN-LX1)"},
    {"id": 66518, "title": "Huawei Mate 9 Pro"},
    {"id": 663859, "title": "Redmi Note 10 5G (128 GB)"},
    {"id": 595271, "title": "realme 7 (RMX2151)"},
    {"id": 579955, "title": "TCL 10 Plus (64 GB) (T782H)"},
    {"id": 405259, "title": "Oppo A91 (CPH2021)"},
    {
      "id": 336523,
      "title": "Apple iPhone 8 Plus (128 GB) (MX242TU/A, MX252TU/A, MX262TU/A)"
    },
    {"id": 103979, "title": "Xiaomi Mi MIX 2S"},
    {"id": 87729, "title": "OnePlus 5 (128 GB)"},
    {"id": 84706, "title": "Xiaomi Mi 6 (128 GB / 6 GB)"},
    {"id": 78332, "title": "Xiaomi Mi 6 Ceramic (128 GB / 6 GB)"},
    {"id": 77090, "title": "HTC U11 (64 GB / Tek Hat)"},
    {"id": 672868, "title": "Redmi 9T (128 GB)"},
    {"id": 662309, "title": "Samsung Galaxy A32 (64 GB) (SM-A325F)"},
    {"id": 639471, "title": "Vivo Y70"},
    {"id": 593835, "title": "Vivo X50 Lite (V1937)"},
    {"id": 422334, "title": "Samsung Galaxy A31 (SM-A315F/DS)"},
    {"id": 415599, "title": "Samsung Galaxy M21 (SM-M215F/DSN)"},
    {"id": 342493, "title": "Meizu 16Xs (128 GB)"},
    {"id": 203377, "title": "Samsung Galaxy M30s (SM-M307FN/DS)"},
    {"id": 200715, "title": "realme 5 Pro (RMX1971)"},
    {"id": 167222, "title": "Oppo Reno Z (CPH1979)"},
    {"id": 131692, "title": "Samsung Galaxy A9 (2018) (SM-A920F)"},
    {"id": 124915, "title": "Pocophone F1"},
    {"id": 104943, "title": "Huawei P20 (EML-L09)"},
    {
      "id": 92440,
      "title": "Apple iPhone 8 (256 GB) (MQ7D2TU/A, MQ7E2TU/A, MQ7C2TU/A)"
    },
    {
      "id": 89874,
      "title": "Apple iPhone 8 Plus (64 GB) (MQ8L2TU/A, MQ8M2TU/A, MQ8N2TU/A)"
    },
    {"id": 719053, "title": "Samsung Galaxy A22 (128 GB)"},
    {"id": 704113, "title": "Redmi Note 10 5G (64 GB)"},
    {"id": 693618, "title": "General Mobile GM 21 Pro d (Çift Hat) (G701)"},
    {"id": 691688, "title": "General Mobile GM 21 Pro (Tek Hat) (G700)"},
    {"id": 680525, "title": "Oppo A74 (CPH2219)"},
    {"id": 551882, "title": "Oppo A72 (CPH2067)"},
    {"id": 37059, "title": "Samsung Galaxy S7 edge (Tek Hat) (SM-G935F)"},
    {"id": 214465, "title": "Xiaomi Mi A3 (128 GB)"},
    {"id": 132788, "title": "Xiaomi Black Shark (128 GB / 8 GB)"},
    {
      "id": 109261,
      "title":
          "Apple iPhone 8 (PRODUCT)RED Special Edition (256 GB) (MRRN2TU/A)"
    },
    {
      "id": 109251,
      "title": "Apple iPhone 8 Plus (PRODUCT)RED Special Edition (MRT92TU/A)"
    },
    {"id": 100148, "title": "OnePlus 5T (128 GB)"},
    {"id": 88649, "title": "Sony Xperia XZ1 (G8341)"},
    {"id": 86939, "title": "Nokia 8 (TA-1012)"},
    {"id": 743894, "title": "Vivo Y33s"},
    {"id": 719766, "title": "Vivo Y53s (V2058)"},
    {"id": 714048, "title": "Vivo Y51"},
    {"id": 694355, "title": "Samsung Galaxy M22 (SM-M225F)"},
    {"id": 656486, "title": "TCL 10L (256 GB)"},
    {"id": 649820, "title": "Poco M3 (128 GB)"},
    {"id": 643271, "title": "Redmi 9T (64 GB)"},
    {"id": 610691, "title": "Oppo A73 (CPH2095)"},
    {"id": 59306, "title": "Samsung Galaxy S7 Duos (Çift Hat) (SM-G930FD)"},
    {"id": 589835, "title": "HTC Desire 20 Pro"},
    {"id": 564443, "title": "Xiaomi Redmi Note 9 (128 GB)"},
    {"id": 37056, "title": "Samsung Galaxy S7 (Tek Hat) (SM-G930F)"},
    {"id": 369222, "title": "Xiaomi Redmi Note 8T"},
    {"id": 366128, "title": "Xiaomi Redmi Note 8 (128 GB)"},
    {"id": 365649, "title": "TCL Plex (T780H)"},
    {"id": 167135, "title": "Meizu 16Xs (64 GB)"},
    {"id": 166669, "title": "Samsung Galaxy M40 (SM-M405F/DS)"},
    {"id": 143853, "title": "Meizu 16 (128 GB)"},
    {"id": 100964, "title": "Xiaomi Mi 6 (64 GB / 6 GB)"},
    {"id": 79633, "title": "OnePlus 5 (64 GB)"},
    {
      "id": 76237,
      "title":
          "Apple iPhone 7 Plus (PRODUCT)RED Special Edition (256 GB) (MPR62TU/A)"
    },
    {"id": 754557, "title": "Redmi 10 2022 (128 GB)"},
    {"id": 753029, "title": "Redmi 10 (128 GB)"},
    {"id": 752121, "title": "Omix X500 (6 GB)"},
    {"id": 705045, "title": "Huawei Nova 8i (NEN-LX1)"},
    {"id": 691941, "title": "Samsung Galaxy A22 (64 GB) (SM-A225F)"},
    {
      "id": 61956,
      "title":
          "Apple iPhone 7 Plus (256 GB) (MN4W2TU/A, MN512TU/A, MN4X2TU/A, MN4Y2TU/A, MN502TU/A)"
    },
    {"id": 585658, "title": "Casper VIA X20"},
    {
      "id": 336608,
      "title": "Apple iPhone 8 (128 GB) (MX162TU/A, MX172TU/A, MX182TU/A)"
    },
    {"id": 203051, "title": "Xiaomi Redmi Note 8"},
    {"id": 143490, "title": "Samsung Galaxy A50 (SM-A505F)"},
    {"id": 101410, "title": "OnePlus 3T (128 GB)"},
    {"id": 93196, "title": "OnePlus 5T (64 GB)"},
    {"id": 87230, "title": "Xiaomi Mi Note 2 (128 GB)"},
    {"id": 83952, "title": "LG G6 (Çift Hat) (H870DS)"},
    {"id": 76371, "title": "Xiaomi Mi 6 (64 GB / 4 GB)"},
    {"id": 752268, "title": "Redmi 10 2022"},
    {"id": 723566, "title": "Omix X500"},
    {"id": 712422, "title": "Redmi 10"},
    {"id": 69713, "title": "HTC U Ultra (Tek Hat)"},
    {"id": 693788, "title": "Redmi Note 8 (2021)"},
    {"id": 67307, "title": "LG G6 (H870)"},
    {"id": 628730, "title": "Poco M3 (64 GB)"},
    {"id": 47307, "title": "HP Elite x3 (1BH17EA)"},
    {"id": 428492, "title": "Xiaomi Redmi Note 9"},
    {"id": 409900, "title": "Samsung Galaxy XCover Pro (SM-G715F)"},
    {"id": 395367, "title": "Vestel Venus Z40"},
    {"id": 193232, "title": "realme 3 Pro (6 GB / 128 GB)"},
    {"id": 143142, "title": "Meizu 16 (64 GB)"},
    {"id": 109993, "title": "Honor 10 (COL-L29)"},
    {"id": 109809, "title": "Xiaomi Black Shark (64 GB / 6 GB)"},
    {"id": 104478, "title": "HTC U Ultra (Çift Hat)"},
    {"id": 100672, "title": "Xiaomi Mi Note 3 (128 GB)"},
    {"id": 87696, "title": "Meizu Pro 7 Plus"},
    {
      "id": 81737,
      "title": "Apple iPhone 8 (64 GB) (MQ6G2TU/A, MQ6H2TU/A, MQ6J2TU/A)"
    },
    {
      "id": 75835,
      "title":
          "Apple iPhone 7 Plus (PRODUCT)RED Special Edition (128 GB) (MPQW2TU/A)"
    },
    {"id": 702762, "title": "Tecno Camon 16"},
    {"id": 698231, "title": "Infinix Note 8i"},
    {
      "id": 63305,
      "title":
          "Apple iPhone 7 Plus (128 GB) (MN4M2TU/A, MN4P2TU/A, MN4V2TU/A, MN4Q2TU/A, MN4U2TU/A)"
    },
    {"id": 56740, "title": "ZTE Axon 7 (64 GB)"},
    {"id": 563712, "title": "Samsung Galaxy M30 (128 GB)"},
    {"id": 561182, "title": "Huawei P Smart S (AQM-LX1)"},
    {"id": 551777, "title": "Oppo A52 (CPH2069)"},
    {"id": 430050, "title": "realme 6i (RMX2040)"},
    {"id": 224133, "title": "Oppo A9 2020 (CPH1941)"},
    {"id": 155958, "title": "Xiaomi Redmi Note 7 (128 GB / 4 GB)"},
    {"id": 152580, "title": "Huawei P30 Lite (48 MP / 128 GB) (MAR-LX1A)"},
    {"id": 126069, "title": "LG G7 Fit (LM-Q850)"},
    {"id": 120991, "title": "ZTE Nubia Z17S (128 GB / 8 GB)"},
    {"id": 117216, "title": "Honor Play (COR-L29)"},
    {"id": 113361, "title": "UM{idIGI Z2 Pro"},
    {
      "id": 109256,
      "title": "Apple iPhone 8 (PRODUCT)RED Special Edition (MRRM2TU/A)"
    },
    {"id": 81724, "title": "Xiaomi Mi Note 3 (64 GB)"},
    {"id": 765093, "title": "Samsung Galaxy A13 (128 GB)"},
    {"id": 695304, "title": "realme C25s (RMX3195)"},
    {"id": 631144, "title": "Tecno Pova (LD7)"},
    {"id": 608424, "title": "Huawei P Smart 2021 (PPA-LX2)"},
    {"id": 590275, "title": "General Mobile GM 20 Pro (G501)"},
    {"id": 58836, "title": "LG V20 (H990)"},
    {"id": 543764, "title": "TCL 10L (T770H)"},
    {"id": 404814, "title": "Huawei P Smart Pro (STK-L21)"},
    {"id": 390156, "title": "Xiaomi Redmi Note 8 (32 GB)"},
    {"id": 135816, "title": "Xiaomi Mi 8 Lite (128 GB / 6 GB)"},
    {"id": 116292, "title": "Xiaomi Mi 8 SE"},
    {"id": 100697, "title": "Xiaomi Mi MIX 2 (128 GB)"},
    {"id": 556519, "title": "Xiaomi Redmi Note 9S (128 GB)"},
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
