import 'package:compare_app/models/comment.dart';
import 'package:compare_app/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikesPage extends StatefulWidget {
  const LikesPage({super.key});

  @override
  State<LikesPage> createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  List<CommentModel> commentList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beğeniler"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text(commentList[index].phoneName.toString());
        },
        itemCount: commentList.length,
      ),
    );
  }

  void getData() {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    _userModel.getAllLikes(_userModel.user!.usersID, "").then((value) {
      commentList = value;
    });
  }
}
