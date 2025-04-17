import 'package:compare_app/viewmodel/phoneModel.dart';
import 'package:compare_app/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedCategoryIndex = 0;
  List categoryList = [
    "En Popüler",
    "Bizim Seçtiklerimiz",
    "Fiyat Performans",
  ];
  Widget _buildCategoryList(BuildContext contex, int index) {
    final _userModel = Provider.of<UserModel>(context, listen: true);
    return GestureDetector(
      onTap: () {
        if (index != selectedCategoryIndex) {
          setState(() {
            selectedCategoryIndex = index;
          });
          _userModel.slider = categoryList[index];
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          children: [
            Text(
              categoryList[index],
              style: TextStyle(
                color: selectedCategoryIndex == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.1),
                fontSize: 18,
                fontWeight: selectedCategoryIndex == index
                    ? FontWeight.w600
                    : FontWeight.normal,
              ),
            ),
            Container(
              height: 3,
              width: 20,
              decoration: BoxDecoration(
                  color: selectedCategoryIndex == index
                      ? Colors.orange
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: size.height * 0.05,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _buildCategoryList(context, index);
          },
          itemCount: categoryList.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
