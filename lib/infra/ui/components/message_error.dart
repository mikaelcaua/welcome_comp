import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/fonts.dart';

class MessageError extends StatelessWidget {
  const MessageError({super.key, required this.message, required this.iconData});
  final String message;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 25, 10, 25),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        spacing: 15,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            message,
            style: h4Text.copyWith(color: whiteColor),
            textAlign: TextAlign.center,
          ),
          Icon(
            iconData,
            size: 40,
          )
        ],
      ),
    );
  }
}
