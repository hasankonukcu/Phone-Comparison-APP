import 'package:compare_app/models/comment.dart';
import 'package:compare_app/models/reply_model.dart';
import 'package:compare_app/theme.dart';
import 'package:flutter/material.dart';


/// {@template favorite_icon_button}
/// Animated button to indicate if a post/comment is liked.
///
/// Pass in onPressed to
/// {@endtemplate}
class ReplyFavoriteIconButton extends StatefulWidget {
  /// {@macro favorite_icon_button}
  const ReplyFavoriteIconButton({
    Key? key,
    required this.isLiked,
    this.size = 22,
    required this.replyModel,
    required this.onTap,
  }) : super(key: key);

  /// Indicates if it is liked or not.
  final bool isLiked;
  final ReplyModel replyModel;

  /// Size of the icon.
  final double size;

  /// onTap callback. Returns a value to indicate if liked or not.
  final Function(bool val,ReplyModel model) onTap;

  @override
  State<ReplyFavoriteIconButton> createState() => _ReplyFavoriteIconButtonState();
}

class _ReplyFavoriteIconButtonState extends State<ReplyFavoriteIconButton> {
  late bool isLiked = widget.isLiked;

  void _handleTap() {
    setState(() {
      isLiked = !isLiked;
    });
    widget.onTap(isLiked,widget.replyModel);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
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
