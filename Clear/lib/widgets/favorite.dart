import 'package:compare_app/models/comment.dart';
import 'package:compare_app/screens/sign_in/sing_in_page.dart';
import 'package:compare_app/theme.dart';
import 'package:compare_app/viewmodel/user_model.dart';
import 'package:compare_app/widgets/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// {@template favorite_icon_button}
/// Animated button to indicate if a post/comment is liked.
///
/// Pass in onPressed to
/// {@endtemplate}
class FavoriteIconButton extends StatefulWidget {
  /// {@macro favorite_icon_button}
  const FavoriteIconButton({
    Key? key,
    required this.isLiked,
    this.size = 22,
    required this.commentModel,
    required this.onTap,
  }) : super(key: key);

  /// Indicates if it is liked or not.
  final bool isLiked;
  final CommentModel commentModel;

  /// Size of the icon.
  final double size;

  /// onTap callback. Returns a value to indicate if liked or not.
  final Function(bool val, CommentModel model) onTap;

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  late bool isLiked = widget.isLiked;

  void _handleTap() {
    final _userModel = Provider.of<UserModel>(context, listen: false);

    if (_userModel.user == null) {
      Navigator.of(context, rootNavigator: false).push(
        MaterialPageRoute(
          builder: ((context) => SignInPage()),
        ),
      );
    } else {
      setState(() {
        isLiked = !isLiked;
      });
      widget.onTap(isLiked, widget.commentModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _handleTap();
      },
      child: AnimatedCrossFade(
        firstCurve: Curves.easeIn,
        secondCurve: Curves.easeOut,
        firstChild: Icon(
          Icons.favorite,
          color: AppColors.like,
          size: widget.size,
        ),
        secondChild: Icon(
          Icons.favorite_outline,
          size: widget.size,
        ),
        crossFadeState:
            isLiked ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 200),
      ),
    );
  }
}
