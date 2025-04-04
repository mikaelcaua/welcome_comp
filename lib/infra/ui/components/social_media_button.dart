import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String url;
  final String label;
  final void Function(String url) onPressed;

  const SocialMediaButton({
    super.key,
    required this.icon,
    required this.color,
    required this.url,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton.icon(
        onPressed: () {
          onPressed(url);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
        ),
        icon: Icon(icon, color: Colors.white),
        label: Text(label),
      ),
    );
  }
}
