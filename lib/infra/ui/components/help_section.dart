import 'package:flutter/material.dart';
import 'package:welcome_comp/infra/ui/components/social_media_button.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';

class HelpSection extends StatelessWidget {
  const HelpSection(
      {super.key,
      required this.title,
      this.buttons,
      required this.description});

  final String title;
  final List<SocialMediaButton>? buttons;
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
            if(buttons!=null)...buttons!
          ],
        ),
      ),
    );
  }
}
