import 'package:compare_app/models/user.dart';
import 'package:compare_app/screens/details_page.dart';
import 'package:flutter/material.dart';

class CustomAppBarMonitor extends StatefulWidget {
  CustomAppBarMonitor({Key? key, required this.user}) : super(key: key);
  Users? user;
  @override
  State<CustomAppBarMonitor> createState() => _CustomAppBarMonitorState();
}

class _CustomAppBarMonitorState extends State<CustomAppBarMonitor> {
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
                "Monitorler",
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
    {'id': 101287, 'title': 'ViewSonic VP2785-4K Monitör'},
    {'id': 101603, 'title': 'MSI Optix MAG27CQ Monitör'},
    {'id': 103465, 'title': 'Asus ProArt PA27AC Monitör'},
    {'id': 117347, 'title': 'Asus ProArt PA32UC-K Monitör'},
    {'id': 141375, 'title': 'Asus ProArt PA24AC Monitör'},
    {'id': 148943, 'title': 'MSI Optix MAG271CQR Monitör'},
    {'id': 151797, 'title': 'ViewSonic VG2755-2K Monitör'},
    {'id': 165122, 'title': 'Acer Z321QUbmiphzx Monitör (UM.JZ1EE.005)'},
    {
      'id': 171465,
      'title': 'Samsung LC49RG90SSMXUF (C49RG90) Monitör (C49RG90SSM)'
    },
    {'id': 179443, 'title': 'ViewSonic VX3276-4K-MHD Monitör'},
    {'id': 190798, 'title': 'Philips 328E1CA/00 Monitör'},
    {'id': 201403, 'title': 'Philips 329P9H/00 Monitör'},
    {'id': 367099, 'title': 'Asus TUF Gaming VG27AQ Monitör'},
    {'id': 391082, 'title': 'ViewSonic Elite XG270QG Monitör'},
    {'id': 401097, 'title': 'Asus ProArt PA329C Monitör'},
    {'id': 405137, 'title': 'LG 34WL750-B Monitör'},
    {'id': 406264, 'title': 'Asus TUF Gaming VG27BQ Monitör'},
    {'id': 415900, 'title': 'BenQ EX2780Q Monitör'},
    {'id': 421107, 'title': 'Asus TUF Gaming VG279QM Monitör'},
    {'id': 422309, 'title': 'BenQ SW270C Monitör'},
    {'id': 422311, 'title': 'BenQ PD2700U Monitör'},
    {'id': 422314, 'title': 'ViewSonic VP2785-2K Monitör'},
    {'id': 426262, 'title': 'AOC CU34G2/BK Monitör'},
    {'id': 426370, 'title': 'AOC CU34G2X/BK Monitör'},
    {'id': 430846, 'title': 'Asus TUF Gaming VG289Q Monitör'},
    {'id': 440289, 'title': 'MSI Optix MAG272CQR Monitör'},
    {'id': 441132, 'title': 'Lenovo ThinkVision P27q-20 Monitör (61EAGAT6TK)'},
    {'id': 549021, 'title': 'BenQ PD2700Q Monitör'},
    {'id': 559387, 'title': 'Asus TUF Gaming VG259QM Monitör'},
    {'id': 563975, 'title': 'MSI Optix MAG322CR Monitör'},
    {'id': 563978, 'title': 'BenQ PD3220U Monitör'},
    {'id': 571773, 'title': 'AOC C27G2ZU/BK Monitör'},
    {'id': 571944, 'title': 'Casper Excalibur M.E27QHD-G Monitör'},
    {'id': 573695, 'title': 'Dell UltraSharp U4320Q Monitör'},
    {'id': 573697, 'title': 'Dell UltraSharp U2520D Monitör'},
    {'id': 577079, 'title': 'Philips 243B9/00 Monitör'},
    {'id': 586051, 'title': 'Lenovo ThinkVision T32h-20 Monitör (61F1GAT2TK)'},
    {'id': 586060, 'title': 'Asus ProArt PA278QV Monitör'},
    {'id': 586061, 'title': 'HP Z38c (Z4W65A4) Monitör'},
    {'id': 587035, 'title': 'Acer Nitro XZ322QPbmiiphx Monitör (UM.JX2EE.P01)'},
    {'id': 591059, 'title': 'Gigabyte G27QC Monitör'},
    {'id': 591096, 'title': 'Monster Aryond A27 V1.1 Monitör'},
    {'id': 593120, 'title': 'BenQ EW3270U Monitör'},
    {'id': 595563, 'title': 'GamePower Intense X60 Monitör'},
    {'id': 596647, 'title': 'Lenovo ThinkVision P27h-20 Monitör (61E9GAT6TK)'},
    {
      'id': 596648,
      'title': 'Xiaomi Mi BHR4269GL Monitör (BHR5133GL, XMMNTWQ34,BHR5126CN)'
    },
    {'id': 598517, 'title': 'LG UltraGear 27GL63T-B Monitör'},
    {'id': 603029, 'title': 'Philips 242B1V/00 Monitör'},
    {'id': 603157, 'title': 'AOC 24P2C Monitör'},
    {'id': 605355, 'title': 'Asus TUF Gaming VG27WQ1B Monitör'},
    {'id': 608619, 'title': 'MSI Optix MAG322CQR Monitör'},
    {'id': 613251, 'title': 'Gigabyte G27F Monitör'},
    {'id': 615819, 'title': 'Dell S2721QS Monitör'},
    {'id': 615822, 'title': 'Gigabyte G34WQC Monitör'},
    {'id': 617525, 'title': 'GameBooster GB-327LCQ-H Monitör'},
    {'id': 621168, 'title': 'Asus TUF Gaming VG27AQL1A Monitör'},
    {'id': 622631, 'title': 'AOC CU34P2A Monitör'},
    {'id': 625241, 'title': 'Monster Aryond A32 V1.1 Monitör'},
    {'id': 629319, 'title': 'Asus TUF Gaming VG279QL1A Monitör'},
    {'id': 633452, 'title': 'MSI Optix MAG342CQRV Monitör'},
    {'id': 634014, 'title': 'MSI Optix MAG342CQR Monitör'},
    {'id': 636158, 'title': 'Philips 279C9/00 Monitör'},
    {'id': 636890, 'title': 'LG UltraGear 32GN550-B Monitör'},
    {'id': 636918, 'title': 'Dell UltraSharp U2421E Monitör'},
    {'id': 636931, 'title': 'MSI Creator PS321URV Monitör'},
    {'id': 638646, 'title': 'Asus TUF Gaming VG27AQ1A Monitör'},
    {'id': 640547, 'title': 'MSI Optix MAG274QRF-QD Monitör'},
    {'id': 640548, 'title': 'MSI Optix MAG274QRF Monitör'},
    {'id': 642029, 'title': 'Gigabyte M27Q Monitör'},
    {'id': 642183, 'title': 'Asus ROG Swift PG259QNR Monitör'},
    {'id': 642618, 'title': 'LG UltraFine 32UN880-B Monitör'},
    {'id': 642619, 'title': 'LG UltraFine 27UN880-B Monitör'},
    {'id': 642661, 'title': 'Philips 242B1H/00 Monitör'},
    {'id': 647149, 'title': 'LG UltraWide 34WN780-B Monitör'},
    {'id': 647154, 'title': 'Lenovo ThinkVision P32p-20 Monitör (62A2GAR2TK)'},
    {'id': 647523, 'title': 'Asus ProArt PA32UCX-PK Monitör'},
    {'id': 647589, 'title': 'Philips 329P1H/00 Monitör'},
    {'id': 647591, 'title': 'Asus VA27AQSB Monitör'},
    {'id': 653209, 'title': 'Philips 275S1AE/01 Monitör'},
    {'id': 654560, 'title': 'Asus TUF Gaming VG259QR Monitör'},
    {'id': 656477, 'title': 'Philips 325B1L/00 Monitör'},
    {'id': 656526, 'title': 'Philips 345E2AE/00 Monitör'},
    {'id': 656528, 'title': 'Philips 273B9/00 Monitör'},
    {'id': 656538, 'title': 'Dell P3421W Monitör'},
    {'id': 656539, 'title': 'Dell UltraSharp U3421WE Monitör'},
    {'id': 661010, 'title': 'Dell S2721DGFA Monitör'},
    {'id': 662500, 'title': 'Gigabyte G27Q Monitör'},
    {'id': 662506, 'title': 'BenQ SW321C Monitör'},
    {'id': 662783, 'title': 'Asus TUF Gaming VG289Q1A Monitör'},
    {'id': 662817, 'title': 'Asus ProArt PA279CV Monitör'},
    {'id': 664939, 'title': 'Asus ProArt PA247CV Monitör'},
    {'id': 672386, 'title': 'ViewSonic VP2768a Monitör'},
    {'id': 673989, 'title': 'Acer Nitro XZ320QX Monitör (UM.JX0EE.X01)'},
    {'id': 674001, 'title': 'LG UltraGear 32GN650-B Monitör'},
    {'id': 679769, 'title': 'LG UltraWide 49WL95C-WE Monitör'},
    {'id': 679875, 'title': 'Dell UltraSharp U3821DW Monitör'},
    {'id': 679876, 'title': 'Dell UltraSharp U4021QW Monitör'},
    {'id': 680906, 'title': 'Philips 278B1/00 Monitör'},
    {'id': 681169, 'title': 'MSI Optix MAG274R2 Monitör'},
    {'id': 682194, 'title': 'Dell C2422HE Monitör'},
    {'id': 682195, 'title': 'Dell C2722DE Monitör'},
    {'id': 683886, 'title': 'ViewSonic VA3456-MHDJ Monitör'},
    {'id': 685822, 'title': 'LG UltraFine 32UN88A-W Monitör'},
    {'id': 685827, 'title': 'Asus ProArt PA278CV Monitör'},
    {'id': 685829, 'title': 'Dell C3422WE Monitör'},
    {'id': 685834, 'title': 'Philips 288E2UAE/00 Monitör'},
    {'id': 687154, 'title': 'ViewSonic XG2705-2 Monitör'},
    {'id': 687874, 'title': 'AOC U27V4EA Monitör'},
    {'id': 688630, 'title': 'Gigabyte AORUS FI32Q Monitör'},
    {'id': 688635, 'title': 'Asus TUF Gaming VG258QM Monitör'},
    {'id': 688649, 'title': 'AOC Q32P2 Monitör'},
    {'id': 689641, 'title': 'MSI Optix MAG301CR2 Monitör'},
    {'id': 691756, 'title': 'LG Ultragear 27GN650-B Monitör'},
    {'id': 691768, 'title': 'Dell UltraSharp U2722DE Monitör'},
    {'id': 695501, 'title': 'Dell UltraSharp U2422HE Monitör'},
    {'id': 695958, 'title': 'Dell UltraSharp U2722D Monitör'},
    {'id': 697283, 'title': 'Philips 328B1/00 Monitör'},
    {'id': 698469, 'title': 'ViewSonic VG3456 Monitör'},
    {
      'id': 698731,
      'title': 'Samsung LU28R550UQRXUF (U28R55) Monitör (U28R550UQR)'
    },
    {'id': 698739, 'title': 'LG 32UN550-W Monitör'},
    {'id': 698884, 'title': 'Gigabyte AORUS FV43U Monitör'},
    {'id': 701095, 'title': 'MSI Optix AG321CQR Monitör'},
    {'id': 701113, 'title': 'Philips 243B9H/00 Monitör'},
    {'id': 701123, 'title': 'Asus VP32UQ Monitör'},
    {
      'id': 701158,
      'title': 'Samsung Odyssey G9 49" LC49G95TSSRXUF Monitör (C49G95TSSR)'
    },
    {'id': 701170, 'title': 'LG UltraWide 34WP65G-B Monitör'},
    {'id': 702651, 'title': 'Asus TUF Gaming VG32VQ1BR Monitör'},
    {'id': 704739, 'title': 'HP P34hc G4 (21Y56AS) Monitör (21Y56AA)'},
    {'id': 706768, 'title': 'BenQ PD2725U Monitör'},
    {'id': 706981, 'title': 'ViewSonic VX3276-2K-MHD-2 Monitör'},
    {'id': 707916, 'title': 'Casper Excalibur M.E34WQHD-G Monitör'},
    {'id': 707926, 'title': 'HP Z27k G3 (1B9T0AA) Monitör'},
    {'id': 707933, 'title': 'MSI Oculux NXG253R Monitör'},
    {'id': 710063, 'title': 'Asus TUF Gaming VG32VQR Monitör'},
    {'id': 710066, 'title': 'Dell S2722DGM Monitör'},
    {'id': 710158, 'title': 'Xiaomi Mi 27 XMMNT27HQ Monitör'},
    {'id': 713104, 'title': 'Asus ProArt PA32UCG-K Monitör'},
    {'id': 714188, 'title': 'AOC 24G2ZU/BK Monitör'},
    {'id': 714189, 'title': 'AOC CQ32G3SU/BK Monitör'},
    {'id': 714324, 'title': 'BenQ MOBIUZ EX2510S Monitör'},
    {'id': 715163, 'title': 'Dell S2722QC Monitör'},
    {'id': 717432, 'title': 'LG UltraWide 35WN73A-B Monitör'},
    {'id': 719384, 'title': 'Dell S3222DGM Monitör'},
    {'id': 719385, 'title': 'Dell S3422DW Monitör'},
    {'id': 719397, 'title': 'BenQ MOBIUZ EX2710S Monitör'},
    {'id': 721137, 'title': 'Philips 559M1RYV/00 Monitör'},
    {'id': 721146, 'title': 'Dell S2722DC Monitör'},
    {'id': 721147, 'title': 'Asus VP299CL Monitör'},
    {'id': 721148, 'title': 'HP M34d (3B1W4E9) Monitör (3B1W4AA, 3B1W4AS)'},
    {'id': 721151, 'title': 'ViewSonic VP3268a-4K Monitör'},
    {'id': 721152, 'title': 'ViewSonic VP2756-2K Monitör'},
    {'id': 721155, 'title': 'BenQ EX2710Q Monitör'},
    {'id': 721977, 'title': 'Dell S3422DWG Monitör'},
    {'id': 723355, 'title': 'Asus ROG Strix XG27UQR Monitör'},
    {'id': 723399, 'title': 'BenQ SW271C Monitör'},
    {'id': 725910, 'title': 'HP X32 (2V7V4E9) Monitör'},
    {'id': 725960, 'title': 'Asus ProArt PA329CV Monitör'},
    {'id': 725962, 'title': 'ViewSonic VX3418-2KPC Monitör'},
    {'id': 729799, 'title': 'Lenovo ThinkVision P24h-2L Monitör (62B2GAT1TK)'},
    {
      'id': 729861,
      'title': 'Samsung Odyssey Neo G9 49" LS49AG950NUXUF Monitör (S49AG950NU)'
    },
    {'id': 731191, 'title': 'Gigabyte M34WQ Monitör'},
    {'id': 731192, 'title': 'Gigabyte M28U Monitör'},
    {'id': 731200, 'title': 'Dell S2422HZ Monitör'},
    {'id': 731347, 'title': 'Asus ProArt PA328CGV Monitör'},
    {'id': 731413, 'title': 'Gigabyte AORUS FI32U Monitör'},
    {'id': 731414, 'title': 'Gigabyte M32U Monitör'},
    {'id': 731434, 'title': 'HP U32 (368Y5E9) Monitör (368Y5AA,368Y6AA)'},
    {'id': 732706, 'title': 'MSI Summit MS321UP Monitör'},
    {'id': 733864, 'title': 'AOC 24G2SU/BK Monitör'},
    {'id': 734609, 'title': 'Gigabyte G32QC A Monitör'},
    {'id': 735891, 'title': 'ViewSonic Elite XG320U Monitör'},
    {'id': 735892, 'title': 'ViewSonic XG320Q Monitör'},
    {'id': 735893, 'title': 'AOC U32P2CA Monitör'},
    {'id': 735895, 'title': 'Dell S2722DZ Monitör'},
    {'id': 735896, 'title': 'Lenovo L32p-30 Monitör (66C9UAC1TK)'},
    {'id': 737938, 'title': 'Gigabyte G27QC A Monitör'},
    {'id': 738394, 'title': 'ViewSonic VP2768a-4K Monitör'},
    {'id': 738577, 'title': 'LG DualUp 28MQ780-B Monitör'},
    {'id': 742429, 'title': 'ViewSonic Elite XG271QG Monitör'},
    {'id': 743227, 'title': 'MSI MAG Artymis 274CP Monitör'},
    {'id': 743687, 'title': 'AOC Agon AG254FG Monitör'},
    {'id': 743700, 'title': 'Acer Nitro XV272Sbmiiprx Monitör (UM.HX2EE.S05)'},
    {'id': 744061, 'title': 'ViewSonic VP2468a Monitör'},
    {'id': 746639, 'title': 'MSI MAG Artymis 324CP Monitör'},
    {'id': 748358, 'title': 'Gigabyte M32QC Monitör'},
    {'id': 748372, 'title': 'Asus TUF Gaming VG27AQZ Monitör'},
    {'id': 748428, 'title': 'Philips 24M1N3200VA/00 Monitör'},
    {'id': 748539, 'title': 'AOC Agon AG493UCX2 Monitör'},
    {'id': 753155, 'title': 'Philips 329M1RV/00 Monitör'},
    {'id': 753159, 'title': 'Philips 279M1RV/00 Monitör'},
    {'id': 753165, 'title': 'Philips 24M1N3200ZA/00 Monitör'},
    {'id': 758183, 'title': 'Dell UltraSharp U2723QE Monitör'},
    {'id': 758185, 'title': 'HP Omen 27c (35D67E9) Monitör'},
    {'id': 758240, 'title': 'Asus BE27ACSBK Monitör'},
    {'id': 758252, 'title': 'Dell UltraSharp U3223QE Monitör'},
    {'id': 758265, 'title': 'Philips 27M1N3200VA/00 Monitör'},
    {'id': 758270, 'title': 'Dell UltraSharp U3023E Monitör'},
    {'id': 758287, 'title': 'AOC U27P2CA Monitör'},
    {'id': 762456, 'title': 'ViewSonic Elite XG251G Monitör'},
    {'id': 762581, 'title': 'Dell P3421WM Monitör'},
    {'id': 762727, 'title': 'Gigabyte AORUS FI32Q X Monitör'},
    {
      'id': 765494,
      'title': 'Samsung LS32BM801UUXUF (32M80) Monitör (S32BM801UU)'
    },
    {'id': 765543, 'title': 'Dell P3223DE Monitör'},
    {
      'id': 767499,
      'title': 'Apple Studio Display Monitör (MMYX3TU/A, MMYW3TU/A)'
    },
    {'id': 770626, 'title': 'MSI Optix MPG321UR-QD Monitör'},
    {'id': 770627, 'title': 'Dell P2423DE Monitör'},
    {'id': 770630, 'title': 'Philips 24E1N5300AE/00 Monitör'},
    {
      'id': 770632,
      'title': 'Samsung LS32BM700UUXUF (S32BM700) Monitör (S32BM700UU)'
    },
    {'id': 774413, 'title': 'Dell P2723DE Monitör'},
    {'id': 775325, 'title': 'LG 27UP550-W Monitör'},
    {'id': 776147, 'title': 'ViewSonic VP3481a Monitör'},
    {'id': 776225, 'title': 'LG UltraWide 34WP65C-B Monitör'},
    {'id': 778496, 'title': 'ViewSonic VP3256-4K Monitör'},
    {'id': 780823, 'title': 'Dell P2723QE Monitör'},
    {'id': 780836, 'title': 'Philips 27M1N3500LS/00 Monitör'},
    {'id': 780983, 'title': 'GamePower WQ35 Monitör'},
    {'id': 782008, 'title': 'ViewSonic VP2776 Monitör'},
    {
      'id': 786155,
      'title': 'Samsung LS43BM700UUXUF (S43BM700) Monitör (S43BM700UU)'
    },
    {'id': 786543, 'title': 'Philips 27E1N5600HE/00 Monitör'},
    {'id': 786550, 'title': 'Philips 27E1N5600AE/00 Monitör'},
    {'id': 786564, 'title': 'Philips 24E1N5300HE/00 Monitör'},
    {'id': 788203, 'title': 'Philips 27E1N5300AE/00 Monitör'},
    {'id': 789825, 'title': 'Philips 276B9/00 Monitör'},
    {'id': 794290, 'title': 'LG 27UP650-W Monitör'},
    {'id': 796543, 'title': 'ViewSonic VP3881a Monitör'},
    {'id': 801986, 'title': 'Dell G3223D Monitör'},
    {
      'id': 802005,
      'title': 'Samsung LS32BM80BUUXUF (32M80) Monitör (S32BM80BUU)'
    },
    {
      'id': 802006,
      'title': 'Samsung LS32BM80PUUXUF (32M80) Monitör (S32BM80PUU)'
    },
    {'id': 803439, 'title': 'Gigabyte G24F-2 Monitör'},
    {'id': 803846, 'title': 'MSI Optix MEG381CQR Plus Monitör'},
    {'id': 805526, 'title': 'Dell SE3223Q Monitör'},
    {'id': 805676, 'title': 'Asus TUF Gaming VG27VQM Monitör'},
    {'id': 805860, 'title': 'MSI Optix MPG341QR Monitör'},
    {'id': 805868, 'title': 'Dell G3223Q Monitör'},
    {'id': 806019, 'title': 'BenQ PD3205U Monitör'},
    {'id': 806305, 'title': 'Philips 32E1N3600LA/00 Monitör'},
    {
      'id': 807728,
      'title':
          'Samsung Odyssey Ark 55" LS55BG970NUXUF (S55BG97) Monitör (S55BG970NU)'
    },
    {
      'id': 810642,
      'title':
          'Samsung Odyssey Neo G8 32" LS32BG850NUXUF (S32BG85) Monitör (S32BG850NU)'
    },
    {
      'id': 810644,
      'title':
          'Samsung Odyssey Neo G7 32" LS32BG750NUXUF (S32BG75) Monitör (S32BG750NU)'
    },
    {
      'id': 810674,
      'title':
          'Samsung Odyssey G4 25" LS25BG400EUXUF (S25BG40) Monitör (S25BG400EU)'
    },
    {'id': 812535, 'title': 'HP E34m G4 (40Z26AA) Monitör'},
    {'id': 812536, 'title': 'AOC Q27V5CW/BK Monitör'},
    {'id': 812537, 'title': 'AOC Q32V5CE/BK Monitör'},
    {'id': 812539, 'title': 'HP E27m G4 (40Z29AA) Monitör'},
    {'id': 812540, 'title': 'AOC 27V5C/BK Monitör'},
    {'id': 812541, 'title': 'AOC 24V5CW/BK Monitör'},
    {'id': 812542, 'title': 'AOC 24V5C/BK Monitör'},
    {'id': 816765, 'title': 'Dell S3423DWC Monitör'},
    {'id': 817329, 'title': 'Dell P3223QE Monitör'},
    {
      'id': 817615,
      'title': 'Apple Pro Display XDR (Pro Stand) Monitör (MWPF2TU/A)'
    },
    {'id': 818194, 'title': 'MSI Optix MAG275R2 Monitör'},
    {'id': 819451, 'title': 'Philips Evnia 34M2C7600MV/00 Monitör'},
    {'id': 828654, 'title': 'Asus ProArt Display OLED PA32DC Monitör'},
    {'id': 828656, 'title': 'Asus ProArt PA348CGV Monitör'},
    {'id': 828657, 'title': 'MSI Modern MD272QP Monitör'},
    {'id': 828658, 'title': 'MSI Modern MD272QPW Monitör'},
    {'id': 828668, 'title': 'Asus ROG Strix XG309CM Monitör'},
    {'id': 828669, 'title': 'Asus TUF Gaming VG249QM1A Monitör'},
    {'id': 828676, 'title': 'Philips 27M1F5500P/00 Monitör'},
    {'id': 828706, 'title': 'AOC 25G3ZM/BK Monitör'},
    {'id': 828707, 'title': 'Cooler Master GM27-CFX Monitör'},
    {'id': 828710, 'title': 'Monster Aryond A32 V1.2 Monitör'},
    {'id': 828711, 'title': 'Monster Aryond A27 V1.2 Monitör'},
    {'id': 832996, 'title': 'Lenovo ThinkVision T27H-2L Monitör (62B1GAT2TK)'},
    {'id': 833018, 'title': 'ViewSonic VX2718-2KPC-MHDJ Monitör'},
    {'id': 833019, 'title': 'AOC Q27P2CA Monitör'},
    {'id': 836723, 'title': 'LG UltraGear 32GP750-B Monitör'},
    {'id': 838551, 'title': 'Lenovo ThinkVision P32p-20 Monitör (62DBGAT2TK)'},
    {'id': 838630, 'title': 'Dell G2723H Monitör'},
    {'id': 839011, 'title': 'MSI MPG Artymis 273CQR-QD Monitör'},
    {'id': 840069, 'title': 'BenQ MOBIUZ EX240 Monitör'},
    {'id': 840667, 'title': 'LG UltraGear 27GR95QE-B Monitör'},
    {'id': 840679, 'title': 'LG UltraGear 45GR95QE-B Monitör'},
    {'id': 840808, 'title': 'Philips 27M1F5800/00 Monitör'},
    {'id': 841140, 'title': 'LG UltraWide 34WP75C-B Monitör'},
    {'id': 841380, 'title': 'ASUS ProArt PA248CNV Monitör'},
    {'id': 841820, 'title': 'MSI Pro MP341CQ Monitör'},
    {'id': 841914, 'title': 'BenQ MOBIUZ EX270M Monitör'},
    {'id': 842383, 'title': 'BenQ MOBIUZ EX270QM Monitör'},
    {'id': 842384, 'title': 'HP Z24q G3 (4Q8N4AA) Monitör'},
    {'id': 842385, 'title': 'MSI Pro MP341CQW Monitör'},
    {'id': 842512, 'title': 'GameBooster GB-2728FF Monitör'},
    {'id': 843706, 'title': 'BenQ PD2705Q Monitör'},
    {'id': 845185, 'title': 'ViewSonic VP2786-4K Monitör'},
    {'id': 845188, 'title': 'Dell Alienware 25 AW2523HF Monitör'},
    {'id': 845189, 'title': 'AOC Agon Pro PD27S Monitör'},
    {'id': 845200, 'title': 'Asus ProArt PA279CRV Monitör'},
    {'id': 845262, 'title': 'Razer Raptor 27 Monitör (RZ39-03500100-R3G1)'},
    {'id': 845751, 'title': 'AOC Q27V5C/BK Monitör'},
    {'id': 845796, 'title': 'ViewSonic VG2756-4K Monitör'},
    {'id': 846505, 'title': 'AOC Agon AG275QZN/EU Monitör'},
    {'id': 848000, 'title': 'Philips 40B1U5600/00 Monitör'},
    {'id': 848003, 'title': 'Philips 24B1U5301H/00 Monitör'},
    {'id': 848574, 'title': 'Lenovo Legion Y27-30 Monitör (66F8GAC3TK)'},
    {'id': 848630, 'title': 'ViewSonic Elite XG341C-2K Monitör'},
    {'id': 848667, 'title': 'BenQ PD3205UA Monitör'},
    {'id': 848728, 'title': 'HyperX Armada 27 Monitör'},
    {'id': 849305, 'title': 'Asus ROG Swift PG27AQN Monitör'},
    {
      'id': 849321,
      'title':
          'Samsung Smart Odyssey OLED G8 LS34BG850SUXUF Monitör (S34BG850SU)'
    },
    {'id': 849726, 'title': 'Asus ROG Strix XG249CM Monitör'},
    {'id': 851152, 'title': 'AOC U34E2M/BK Monitör'},
    {'id': 851153, 'title': 'Philips 275S1AE/00 Monitör'},
    {'id': 852171, 'title': 'AOC Q27P3QW Monitör'},
    {'id': 853616, 'title': 'Philips Evnia 27M2C5500W/00 Monitör'},
    {'id': 853633, 'title': 'ViewSonic VG2756V-2K Monitör'},
    {'id': 853680, 'title': 'Philips Evnia 42M2N8900/00 Monitör'},
    {'id': 854549, 'title': 'HP M27m (678U8AA) Monitör'},
    {'id': 855328, 'title': 'ViewSonic XG2431 Monitör'},
    {
      'id': 855634,
      'title': 'Samsung LC49RG90SSRXUF (C49RG90) Monitör (C49RG90SSR)'
    },
    {
      'id': 855706,
      'title':
          'Samsung Odyssey G7 28" LS28BG702EPXUF (S28BG70) Monitör (S28BG702EP)'
    },
    {'id': 856281, 'title': 'MSI Optix MAG274QRX Monitör'},
    {'id': 856337, 'title': 'MSI G321CUV Monitör'},
    {'id': 856741, 'title': 'Dell Alienware AW2723DF Monitör'},
    {'id': 856775, 'title': 'LG UltraWide 29WQ600-W Monitör'},
    {'id': 856776, 'title': 'LG UltraGear 32GN55R-B Monitör'},
    {'id': 857038, 'title': 'Gamepower Ace A80 Monitör'},
    {'id': 859135, 'title': 'Asus ROG Strix XG32UQ Monitör'},
    {'id': 859136, 'title': 'MSI G281UV Monitör'},
    {'id': 859152, 'title': 'BenQ PD2705U Monitör'},
    {'id': 859153, 'title': 'LG UltraWide Ergo 34WQ680-W Monitör'},
    {
      'id': 859182,
      'title':
          'Samsung Odyssey G7 32" LS32BG700EUXUF (S32BG70) Monitör (S32BG700EU)'
    },
    {'id': 860955, 'title': 'Asus ROG Swift PG27AQDM Monitör'},
    {'id': 862096, 'title': 'Asus ROG Strix XG32AQ Monitör'},
    {'id': 862149, 'title': 'AOC U34V5C/BK Monitör'},
    {'id': 862534, 'title': 'LG UltraGear 27GN65R-B Monitör'},
    {'id': 862539, 'title': 'LG 27UP550P-W Monitör'},
    {'id': 862541, 'title': 'Asus TUF Gaming VG27AQA1A Monitör'},
    {'id': 862547, 'title': 'LG UltraFine 32UN880P-B Monitör'},
    {'id': 862559, 'title': 'LG UltraFine 27UN880P-B Monitör'},
    {'id': 862822, 'title': 'Gigabyte M28U-AE Arm Edition Monitör'},
    {'id': 862837, 'title': 'Lenovo ThinkVision P32p-20 Monitör (62A2GAT2TK)'},
    {
      'id': 863143,
      'title':
          'Samsung ViewFinity S5 34" LS34C500GAUXUF (S34C500) Monitör (S34C500GAU)'
    },
    {'id': 863546, 'title': 'Dell Alienware AW3423DWF Monitör'},
    {'id': 863562, 'title': 'Corsair Xeneon Flex 45WQHD240 Monitör'},
    {'id': 863823, 'title': 'Dell UltraSharp U4323QE Monitör'},
    {'id': 863824, 'title': 'Dell UltraSharp U3423WE Monitör'},
    {'id': 863829, 'title': 'MSI MAG342CQPV Monitör'},
    {'id': 863857, 'title': 'Philips 276B1/00 Monitör'},
    {'id': 863867, 'title': 'BenQ GW3290QT Monitör'},
    {'id': 863868, 'title': 'BenQ GW2790QT Monitör'},
    {'id': 863869, 'title': 'AOC 24P3CW Monitör'},
    {
      'id': 863870,
      'title': 'Samsung LU28R550UQPXUF (U28R55) Monitör (U28R550UQP)'
    },
    {'id': 863872, 'title': 'AOC 24P3CV Monitör'},
    {
      'id': 865962,
      'title':
          'Samsung Odyssey G5 27" LS27CG510EUXUF (S27CG510) Monitör (S27CG510EU)'
    },
    {'id': 865972, 'title': 'GameBooster GB-2724FF Monitör'},
    {
      'id': 865976,
      'title': 'Samsung LS32CM80PUUXUF (32M80C) Monitör (S32CM80PUU)'
    },
    {
      'id': 865980,
      'title': 'Samsung LS32CM80BUUXUF (32M80C) Monitör (S32CM80BUU)'
    },
    {
      'id': 865981,
      'title': 'Samsung LS32CM801UUXUF (32M80C) Monitör (S32CM801UU)'
    },
    {'id': 865985, 'title': 'Asus ROG Swift OLED PG42UQ Monitör'},
    {'id': 866089, 'title': 'AOC Agon U34G3XM/EU Monitör'},
    {'id': 866169, 'title': 'Asus TUF Gaming VG32AQA1A Monitör'},
    {'id': 866175, 'title': 'Asus ROG Strix XG27AQMR Monitör'},
    {'id': 866208, 'title': 'MSI G321CU Monitör'},
    {'id': 866216, 'title': 'ViewSonic VP16-OLED Monitör'},
    {'id': 866221, 'title': 'Dell UltraSharp U4924DW Monitör'},
    {'id': 866232, 'title': 'MSI Modern MD271UL Monitör'},
    {'id': 866233, 'title': 'MSI Pro MP273QP Monitör'},
    {'id': 866238, 'title': 'Dell S3221QSA Monitör'},
    {'id': 866245, 'title': 'Asus ROG Strix XG27AQV Monitör'},
    {'id': 869552, 'title': 'ViewSonic VX2428J Monitör'},
    {'id': 869574, 'title': 'Philips 346E2LAE/00 Monitör'},
    {'id': 869587, 'title': 'LG UltraFine 32UN88AP-W Monitör'},
    {'id': 869588, 'title': 'LG UltraWide 34WP75CP-B Monitör'},
    {'id': 869590, 'title': 'LG UltraGear 27GR75Q-B Monitör'},
    {'id': 869594, 'title': 'Gigabyte M32UC Monitör'},
    {'id': 869616, 'title': 'Twisted Minds TM272QE Monitör'},
    {'id': 871000, 'title': 'BenQ PD2705UA Monitör'},
    {'id': 871141, 'title': 'AOC Agon AG325QZN/EU Monitör'},
    {
      'id': 871173,
      'title':
          'Samsung Odyssey Neo G7 LS43CG700NUXUF (S43CG700) Monitör (S43CG700NU)'
    },
    {'id': 871758, 'title': 'MSI Optix G321CQP Monitör'},
    {'id': 871766, 'title': 'Monster Aryond A32 V1.3 Monitör'},
    {'id': 872209, 'title': 'Philips Evnia 32M1C5200W/00 Monitör'},
    {'id': 872912, 'title': 'Philips Evnia 25M2N5200P/00 Monitör'},
    {
      'id': 872973,
      'title':
          'Samsung Odyssey OLED G9 49" LS49CG954SUXUF (S49CG954S) Monitör (S49CG954SU)'
    },
    {'id': 873033, 'title': 'Dell S2721QSA Monitör'},
    {'id': 873062, 'title': 'Philips Evnia 25M2N3200W/00 Monitör'},
    {
      'id': 873534,
      'title':
          'Samsung ViewFinity S6 32" LS32A600UUPXUF (S32A600U) Monitör (S32A600UUP)'
    },
    {'id': 874353, 'title': 'LG UltraWide 34WQ650-W Monitör'},
    {'id': 875421, 'title': 'LG UltraGear 49GR85DC-B Monitör'},
    {'id': 883308, 'title': 'MSI G32C4X Monitör'},
    {'id': 883309, 'title': 'MSI Optix G271CQR Monitör'},
    {'id': 883310, 'title': 'MSI G272CQP Monitör'},
    {'id': 883313, 'title': 'LG 27UP650P-W Monitör'},
    {'id': 883320, 'title': 'Thull UltraView THL-DQHD49C Monitör'},
    {'id': 883321, 'title': 'Thull Vision TG-UWQHD34C Monitör'},
    {'id': 883322, 'title': 'ViewSonic VX2780J-2K Monitör'},
    {'id': 883324, 'title': 'ViewSonic VX2728J Monitör'},
    {'id': 883330, 'title': 'Rampage RAGE RG24R165 Monitör'},
    {'id': 884803, 'title': 'Gigabyte G27F 2 Monitör'},
    {
      'id': 884806,
      'title':
          'Samsung ViewFinity S9 27" LS27C902PAUXUF (S27C902) Monitör (S27C902PAU)'
    },
    {'id': 886314, 'title': 'GameBooster GB-2528FF Monitör'},
    {'id': 886494, 'title': 'HP Omen 27 (780F9E9) Monitör'},
    {
      'id': 886520,
      'title': 'Cooler Master Tempest GP27Q Monitör (CMI-GP27-FQS)'
    },
    {
      'id': 886699,
      'title': 'Samsung LC49RG90SSPXUF (C49RG90) Monitör (C49RG90SSP)'
    },
    {'id': 890611, 'title': 'HP Omen 32c (780K6E9) Monitör'},
    {'id': 890614, 'title': 'Lenovo G32qc-30 Monitör (66F2GAC1TK)'},
    {'id': 890657, 'title': 'ViewSonic VX2780-2K Monitör'},
    {'id': 890667, 'title': 'BenQ PD2706UA Monitör'},
    {'id': 890907, 'title': 'MSI G322CQP Monitör'},
    {'id': 890908, 'title': 'MSI G272QPF Monitör'},
    {'id': 890920, 'title': 'LG UltraGear 27GL83AP-B Monitör'},
    {'id': 890921, 'title': 'LG UltraGear 32GN550P-B Monitör'},
    {'id': 890952, 'title': 'Asus TUF Gamıng VG27AQ3A Monitör'},
    {'id': 890955, 'title': 'HP Omen 27s (780G5E9) Monitör'},
    {'id': 890958, 'title': 'GameBooster GB-2727FF Monitör'},
    {'id': 890974, 'title': 'Eizo ColorEdge CG2420 Monitör (CG2420-BK)'},
    {'id': 890975, 'title': 'Dell G2724D Monitör'},
    {
      'id': 892284,
      'title':
          'Samsung Odyssey Neo G9 57" LS57CG952NUXUF (S57CG95) Monitör (S57CG952NU)'
    },
    {
      'id': 892845,
      'title':
          'Samsung Odyssey Neo G8 32" LS32BG850NPXUF (S32BG85) Monitör (S32BG850NP)'
    },
    {
      'id': 893860,
      'title':
          'Samsung Odyssey OLED G9 49" LS49CG934SUXUF (S49CG934S) Monitör (S49CG934SU)'
    },
    {'id': 894419, 'title': 'LG UltraGear 27GR93U-B Monitör'},
    {'id': 894594, 'title': 'HP OMEN 34c (780K8E9) Monitör'},
    {'id': 894629, 'title': 'Xiaomi 4K Monitor 27” XMMNT27NU Monitör'},
    {'id': 894696, 'title': 'HP E27u G5 (6N4D3AA) Monitör'},
    {'id': 894723, 'title': 'HP E27k G5 (6N4C4AA) Monitör'},
    {'id': 894728, 'title': 'HP E32k G5 (6N4D6AA) Monitör'},
    {
      'id': 894937,
      'title':
          'Samsung Odyssey OLED G9 49" LS49CG950SUXUF (S49CG950S) Monitör (S49CG950SU)'
    },
    {'id': 895039, 'title': 'HP Omen 27qs (780J4E9) Monitör'},
    {'id': 896165, 'title': 'MSI Modern MD272XP Monitör'},
    {'id': 896256, 'title': 'Dell Alienware AW2724DM Monitör'},
    {'id': 896723, 'title': 'Lenovo ThinkVision P27h-30 Monitör (63A1GAT1TK)'},
    {
      'id': 896994,
      'title':
          'Samsung Odyssey Neo G7 32" LS32BG750NPXUF (S32BG75) Monitör (S32BG750NP)'
    },
    {'id': 896998, 'title': 'Asus TUF Gaming VG279QM1A Monitör'},
    {'id': 898412, 'title': 'LG UltraGear 27GR83Q-B Monitör'},
    {'id': 898882, 'title': 'Dell G2524H Monitör'},
    {'id': 898967, 'title': 'LG UltraGear 32GR93U-B Monitör'},
    {'id': 899089, 'title': 'Philips Evnia 34M1C5500VA/00 Monitör'},
    {'id': 899428, 'title': 'MSI G321Q Monitör'},
    {'id': 899667, 'title': 'HP Omen 27u (3G6W0E9) Monitör (3G6W0AA)'},
    {'id': 900143, 'title': 'MSI MAG 274UPF Monitör'},
    {'id': 900307, 'title': 'MSI G273CQ Monitör'},
    {'id': 900425, 'title': 'AOC CU34P3CV Monitör'},
    {'id': 900479, 'title': 'AOC CU34P2C Monitör'},
    {'id': 900483, 'title': 'Lenovo G34w-30 Monitör (66F1GAC1TK)'},
    {'id': 900506, 'title': 'HP Omen 32q (780K0E9) Monitör'},
    {'id': 900690, 'title': 'Twisted Minds TM32DUI Monitör'},
    {'id': 900692, 'title': 'Asus TUF Gaming VG27AQML1A Monitör'},
    {'id': 900693, 'title': 'Twisted Minds TM28EUI Monitör'},
    {
      'id': 900697,
      'title': 'Acer Nitro EI322QURPbmiippx Monitör (UM.JE2EE.P04)'
    },
    {
      'id': 900723,
      'title':
          'Samsung Odyssey G4 27" LS27BG400EUXUF (S27BG40) Monitör (S27BG400EU)'
    },
    {'id': 900724, 'title': 'Asus ROG Strix XG49WCR Monitör'},
    {'id': 900734, 'title': 'AOC CQ27G2SE/BK Monitör'},
    {'id': 900811, 'title': 'Dell UltraSharp U3824DW Monitör'},
    {'id': 900812, 'title': 'MSI MAG 325CQRF-QD Monitör'},
    {'id': 900813, 'title': 'MSI MAG 275CQRF-QD Monitör'},
    {'id': 900814, 'title': 'MSI G274QPX Monitör'},
    {'id': 900816, 'title': 'Acer Nitro VG271UMbmiipx Monitör (UM.HV1EE.M07)'},
    {'id': 900818, 'title': 'GameBooster GB-2716FF Plus Monitör'},
    {'id': 900825, 'title': 'Asus ROG Strix XG259QN Monitör'},
    {
      'id': 906111,
      'title':
          'Samsung Odyssey Ark 55" LS55CG97WNUXUF (S55CG97) Monitör (S55CG97WNU)'
    },
    {'id': 906128, 'title': 'LG UltraWide 34WR50QC-B Monitör'},
    {
      'id': 906287,
      'title':
          'Samsung ViewFinity S6 34" LS34C652UAUXUF (S34C652U) Monitör (S34C652UAU)'
    },
    {'id': 906784, 'title': 'Corsair Xeneon 27QHD240 Monitör'},
    {'id': 906896, 'title': 'ASUS ProArt PA248CRV Monitör'},
    {'id': 907218, 'title': 'MSI G271CQP E2 Monitör'},
    {'id': 907303, 'title': 'MSI G274QPF Monitör'},
    {'id': 907329, 'title': 'Lenovo Legion R25i-30 Monitör (67B7GACBTK)'},
    {'id': 907334, 'title': 'Lenovo Legion Y34wz-30 Monitör (67B0UAC1TK)'},
    {'id': 907394, 'title': 'LG UltraGear 48GQ900-B Monitör'},
    {'id': 93499, 'title': 'BenQ PD3200U Monitör'},
    {'id': 98820, 'title': 'ViewSonic VP3268-4K Monitör'},
    {'id': 98821, 'title': 'ViewSonic VP3881 Monitör'}
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
