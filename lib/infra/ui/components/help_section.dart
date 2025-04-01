import 'package:flutter/material.dart';
import 'package:welcome_comp/infra/ui/theme/colors.dart';
import 'package:welcome_comp/infra/ui/theme/fonts.dart';

class HelpSection extends StatelessWidget {
  const HelpSection(
      {super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 30, 16, 30),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: h2Text.copyWith(
                fontWeight: FontWeight.bold,
                color: whiteColor,
              ),
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
