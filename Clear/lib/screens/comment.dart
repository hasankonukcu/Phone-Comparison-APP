import 'package:compare_app/models/comment.dart';
import 'package:compare_app/models/reply_model.dart';
import 'package:compare_app/screens/sign_in/sing_in_page.dart';
import 'package:compare_app/theme.dart';
import 'package:compare_app/viewmodel/user_model.dart';
import 'package:compare_app/widgets/alert_dialog.dart';
import 'package:compare_app/widgets/fadeanimation.dart';
import 'package:compare_app/widgets/favorite.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CommentPage extends StatefulWidget {
  int id;
  String type;
  String phoneName;
  CommentPage(
      {super.key,
      required this.id,
      required this.phoneName,
      required this.type});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  List<CommentModel>? commentModel;
  List<ReplyModel>? replyList;
  ReplyModel? isReply;

  @override
  void initState() {
    Jiffy.setLocale('tr');
    getData(widget.id, widget.type);
    super.initState();
  }

  bool _isFavorited(String element) {
    late bool result;
    final _userModel = Provider.of<UserModel>(context, listen: false);
    if (_userModel.user != null) {
      if (_userModel.user!.likes != null) {
        if (_userModel.user!.likes!.contains(element)) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context, listen: false);

    var bgColor = Colors.grey.withOpacity(0.1);
    final border = _border(context);
    return Scaffold(
      appBar: AppBar(
          title: FadeAnimation(
            delay: 0.5,
            child: const Text(
              "Yorumlar",
              style: TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: bgColor,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: FadeAnimation(
                delay: 0.5,
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ))),
      body: Stack(
        children: [
          ListView.builder(
              itemBuilder: (context, index) {
                if (index == commentModel!.length) {
                  // Bottom padding to ensure [CommentBox] does not obscure
                  // visibility
                  return const SizedBox(
                    height: 120,
                  );
                }
                return commentLine(index);
              },
              itemCount: commentModel != null ? commentModel!.length + 1 : 0),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: (Theme.of(context).brightness == Brightness.light)
                      ? Color.fromARGB(255, 234, 253, 250)
                      : Colors.black,
                  border: const Border(
                      top: BorderSide(
                    color: Color.fromARGB(255, 240, 236, 236),
                  ))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible: isReply != null ? true : false,
                    child: Container(
                        color: Color.fromARGB(255, 238, 234, 234),
                        height: 35,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                textEditingController.text + "yanıtlıyorsunuz"),
                            IconButton(
                                onPressed: () {
                                  isReply = null;
                                  textEditingController.clear();
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.cancel_outlined,
                                  size: 17,
                                  color: Color.fromARGB(255, 71, 68, 68),
                                ))
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FadeAnimation(delay: 0.2, child: _emojiText('❤️')),
                        FadeAnimation(delay: 0.4, child: _emojiText('🙌')),
                        FadeAnimation(delay: 0.6, child: _emojiText('🔥')),
                        FadeAnimation(delay: 0.8, child: _emojiText('👏🏻')),
                        FadeAnimation(delay: 1, child: _emojiText('😢')),
                        FadeAnimation(delay: 1.2, child: _emojiText('😍')),
                        FadeAnimation(delay: 1.4, child: _emojiText('😮')),
                        FadeAnimation(delay: 1.6, child: _emojiText('😂')),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FadeAnimation(
                          delay: 0.5,
                          child: CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.1),
                              child: const Image(
                                  image: AssetImage("assets/face.png"))),
                        ),
                      ),
                      Expanded(
                        child: FadeAnimation(
                          delay: 0.8,
                          child: TextField(
                            onChanged: (value) {
                              if (value.length == 0) {
                                isReply = null;
                                setState(() {});
                              }
                              ;
                            },
                            controller: textEditingController,
                            minLines: 1,
                            maxLines: 10,
                            style: const TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                                suffix: GestureDetector(
                                  onTap: () {
                                    if (_userModel.user == null) {
                                      _loginQuestion(context);
                                    } else {
                                      if (textEditingController
                                          .text.isNotEmpty) {
                                        if (isReply == null) {
                                          final _userModel =
                                              Provider.of<UserModel>(context,
                                                  listen: false);
                                          var result = _userModel.saveDream(
                                              CommentModel(
                                                  phoneName: widget.phoneName,
                                                  userID:
                                                      _userModel.user!.usersID,
                                                  email: _userModel.user!.email,
                                                  message: textEditingController
                                                      .text,
                                                  phoneID: widget.id,
                                                  userName: _userModel
                                                      .user!.userName),
                                              widget.type);

                                          setState(() {
                                            getData(widget.id, widget.type);
                                            textEditingController.clear();
                                          });
                                        } else {
                                          //save reply
                                          final _userModel =
                                              Provider.of<UserModel>(context,
                                                  listen: false);

                                          var result = _userModel.reply(
                                              ReplyModel(
                                                userID: isReply!.userID,
                                                email: isReply!.email,
                                                message:
                                                    textEditingController.text,
                                                phoneID: widget.id,
                                                commentID: isReply!.commentID,
                                                userName: isReply!.userName,
                                              ),
                                              widget.type);

                                          setState(() {
                                            getData(widget.id, widget.type);
                                            isReply = null;
                                            textEditingController.clear();
                                          });
                                        }
                                      }
                                    }
                                  },
                                  child: const Text(
                                    'Paylaş',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 90, 171, 238)),
                                  ),
                                ),
                                hintText: 'yorum yap...',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                focusedBorder: border,
                                border: border,
                                enabledBorder: border),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _loginQuestion(BuildContext context) async {
    final sonuc = await PlatformSensAlertDialog(
      title: "Giriş Yapmalısınız.",
      content:
          "Devam etmek için giriş yapmalısınız, devam etmek istiyor musunuz?",
      mainButtonText: "Evet",
      cancelButtonText: "Vazgeç",
    ).show(context);
    if (sonuc == true) {
      Navigator.of(context, rootNavigator: false).push(
        MaterialPageRoute(
          builder: ((context) => SignInPage()),
        ),
      );
    }
  }

  Widget _emojiText(String emoji) {
    return GestureDetector(
      onTap: () {
        focusNode.requestFocus();
        textEditingController.text = textEditingController.text + emoji;
        textEditingController.selection = TextSelection.fromPosition(
            TextPosition(offset: textEditingController.text.length));
      },
      child: Text(
        emoji,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }

/*
  Widget replyLine(ReplyModel reply) {
    DateTime dt;
    if (reply.createdAt != null) {
      dt = (reply.createdAt)!.toDate();
    } else {
      dt = DateTime.now();
    }

    final jiffyTime = Jiffy(dt).fromNow();
    bool isLiked = _isFavorited(reply.commentID.toString());

    return Padding(
      padding: const EdgeInsets.only(left: 35,top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeAnimation(
                delay: 0.1,
                child: const CircleAvatar(

                  backgroundColor: Colors.white,
                  child: Image(
                    height: 18,
                    width: 18,
                    image: AssetImage("assets/face.png"),
                  ),
                ),
              ),
              Expanded(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: reply.userName.toString() + " ",
                    style: const TextStyle(fontSize: 12,
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                      text: reply.message.toString(),
                      style: const TextStyle(color: Colors.black,fontSize: 12))
                ])),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: ReplyFavoriteIconButton(
                    isLiked: isLiked,
                    replyModel: reply,
                    size: 17,
                    onTap: _handleForReplyFavorite,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    jiffyTime,
                    style: AppTextStyle.textStyleFadedSmall,
                  ),
                ),
                Visibility(
                  visible: reply.like! > 0,
                  child: SizedBox(
                    width: 90,
                    child: Text(
                      reply.like.toString() + " beğenme",
                      style: AppTextStyle.textStyleFadedSmall,
                    ),
                  ),
                ),
                Visibility(
                  child: GestureDetector(
                    onTap: () {
                      final _userModel =
                          Provider.of<UserModel>(context, listen: false);
                      var username = reply.userName.toString();
                      textEditingController.clear();
                      textEditingController.text = "@" + username + " ";
                      isReply = reply;

                      setState(() {});
                      // _userModel.reply();
                    },
                    child: const SizedBox(
                      width: 50,
                      child: Text(
                        'Yanıtla',
                        style: AppTextStyle.textStyleFadedSmallBold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
*/
  Widget commentLine(int index) {
    DateTime dt;
    if (commentModel![index].createdAt != null) {
      dt = (commentModel![index].createdAt)!.toDate();
    } else {
      dt = DateTime.now();
    }
    final jiffyTime = Jiffy.parseFromDateTime(dt).fromNow();

    bool isLiked = _isFavorited(commentModel![index].commentID.toString());

    return commentModel != null
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      delay: 0.1,
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image(
                          image: AssetImage("assets/face.png"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: commentModel![index].userName.toString() + " ",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        TextSpan(
                            text: commentModel![index].message.toString(),
                            style: const TextStyle(color: Colors.black))
                      ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: FavoriteIconButton(
                          isLiked: isLiked,
                          commentModel: commentModel![index],
                          size: 17,
                          onTap: _handleFavorite,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          jiffyTime,
                          style: AppTextStyle.textStyleFadedSmall,
                        ),
                      ),
                      Visibility(
                        visible: commentModel![index].like! > 0,
                        child: SizedBox(
                          width: 90,
                          child: Text(
                            commentModel![index].like.toString() + " beğenme",
                            style: AppTextStyle.textStyleFadedSmall,
                          ),
                        ),
                      ),
                      /*Visibility(
                        child: GestureDetector(
                          onTap: () {
                            final _userModel =
                                Provider.of<UserModel>(context, listen: false);
                            var username =
                                commentModel![index].userName.toString();
                            textEditingController.clear();
                            textEditingController.text = "@" + username + " ";
                            isReply = ReplyModel(
                              commentID: commentModel![index].commentID,
                              email: _userModel.user!.email,
                              phoneID: commentModel![index].phoneID,
                              userID: _userModel.user!.usersID,
                              userName: _userModel.user!.userName,
                            );

                            setState(() {});
                            // _userModel.reply();
                          },
                          child: const SizedBox(
                            width: 50,
                            child: Text(
                              'Yanıtla',
                              style: AppTextStyle.textStyleFadedSmallBold,
                            ),
                          ),
                        ),
                      )*/
                    ],
                  ),
                ),
                /*Visibility(
                    visible:
                        commentModel![index].replys!.isNotEmpty ? true : false,
                    child: ListView.builder(
                      itemBuilder: (context, int) {
                        return replyLine(commentModel![index].replys![int]);
                      },
                      itemCount: commentModel![index].replys!.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    ))*/

                /*
                Visibility(
                    visible: commentModel![index].replys != null ? true : false,
                    child: ListView.builder(
                      itemBuilder: (context, int) {
                        if (commentModel![index].replys == null) {
                          return Center();
                        }else{
                          ReplyModel message = ReplyModel.fromMap(
                              commentModel![index].replys![int]);
                          return replyLine(message);
                        }
                      },
                      itemCount: commentModel![index].replys?.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    ))*/
              ],
            ),
          )
        : const CircularProgressIndicator();
  }

  Future<void> _handleFavorite(bool liked, CommentModel commentModel) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);

    if (liked) {
      /// save data
      if (_userModel.user != null) {
        if (_userModel.user!.likes != null) {
          _userModel.user!.likes!.add(commentModel.commentID!);
          _userModel.like(commentModel, _userModel.user!, widget.type);
        }
      }
    } else {
      /// delete data
      if (_userModel.user != null) {
        if (_userModel.user!.likes != null) {
          _userModel.user!.likes!.remove(commentModel.commentID!);
          _userModel.disslike(commentModel, _userModel.user!, widget.type);
        }
      }
    }
  }

  Future<void> _handleForReplyFavorite(
      bool liked, ReplyModel replyModel) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    if (liked) {
      /// save data
      _userModel.user!.likes!.add(replyModel.replyID);
      //_userModel.like(replyModel, _userModel.user!);
    } else {
      /// delete data
      _userModel.user!.likes!.remove(replyModel.replyID);
      //_userModel.disslike(replyModel, _userModel.user!);
    }
  }

  getData(int id, String type) {
    final _userModel = Provider.of<UserModel>(context, listen: false);

    _userModel.getComments(widget.id, widget.type).then((value) {
      setState(() {
        commentModel = value;
      });
    });
  }
}

OutlineInputBorder _border(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(24)),
    borderSide: BorderSide(
      color: (Theme.of(context).brightness == Brightness.light)
          ? const Color.fromARGB(255, 32, 39, 37)
          : const Color.fromARGB(255, 208, 241, 231),
      width: 0.5,
    ),
  );
}
