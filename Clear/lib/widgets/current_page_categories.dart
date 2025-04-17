import 'package:compare_app/screens/home_page.dart';
import 'package:compare_app/screens/laptop_page.dart';
import 'package:compare_app/screens/monitor_page.dart';
import 'package:compare_app/screens/tv_page.dart';
import 'package:compare_app/viewmodel/phoneModel.dart';
import 'package:compare_app/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentPageCategories extends StatefulWidget {
  const CurrentPageCategories({Key? key}) : super(key: key);

  @override
  State<CurrentPageCategories> createState() => _CurrentPageCategoriesState();
}

class _CurrentPageCategoriesState extends State<CurrentPageCategories> {
  int selectedCategoryIndex = 0;
  List categoryList = [
    "Telefon",
    "Laptop",
    "Televizyon",
    "Monitör",

  ];
  List iconList = [
    Icons.phone_android_outlined,
    Icons.laptop_chromebook_outlined,
    Icons.tv_outlined,
    Icons.desktop_windows_outlined,
    Icons.computer_outlined,
    Icons.keyboard,
  ];
  Widget _buildCategoryList(BuildContext contex, int index) {
    final _userModel = Provider.of<UserModel>(context, listen: true);
    var d = _userModel.lastCatogori;
    selectedCategoryIndex = d!;
    return GestureDetector(
      onTap: () {
        if (index != selectedCategoryIndex) {
          setState(() {
            selectedCategoryIndex = index;
            _userModel.lastCatog = selectedCategoryIndex;
          });
          if (index == 0) {
            Navigator.of(context, rootNavigator: false)
                .push(MaterialPageRoute(builder: ((context) => HomePage())));
          }
          
          if (index == 1) {
            Navigator.of(context, rootNavigator: false)
                .push(MaterialPageRoute(builder: ((context) => LaptopPage())));
          }
          if (index == 2) {
            Navigator.of(context, rootNavigator: false)
                .push(MaterialPageRoute(builder: ((context) => TVPage())));
          }
          if (index == 3) {
            Navigator.of(context, rootNavigator: false)
                .push(MaterialPageRoute(builder: ((context) => MonitorPage())));
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 5,
                width: 20,
                decoration: BoxDecoration(
                    color: selectedCategoryIndex == index
                        ? Colors.orange
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30)),
              ),
              Icon(
                iconList[index],
                color: Colors.white,
              ),
              Text(
                categoryList[index],
                style: TextStyle(
                  color: selectedCategoryIndex == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.1),
                  fontSize: 18,
                  fontWeight: selectedCategoryIndex == index
                      ? FontWeight.w700
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: size.height * 0.40,
        width: size.width * 1,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _buildCategoryList(context, index);
          },
          itemCount: categoryList.length,
          scrollDirection: Axis.vertical,
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
