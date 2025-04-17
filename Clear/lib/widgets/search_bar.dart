import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  var _messageController = TextEditingController();
  var bgColor = Color.fromARGB(255, 62, 83, 99);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: double.infinity,
        height: 68,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: TextField(
          
          onChanged: (query){

          },
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12 * 0.75, horizontal: 12),
              fillColor: Colors.white,
              hintText: "Ara",
              prefixIcon: Icon(
                Icons.search,
                size: 25,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
