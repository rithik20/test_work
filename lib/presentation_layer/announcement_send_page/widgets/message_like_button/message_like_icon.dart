import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MessageLikeIcon extends StatelessWidget {
  const MessageLikeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.transparent,
      child: Icon(
        CupertinoIcons.hand_thumbsup_fill,
        color: Colors.blue,
      ),
    );
  }
}
