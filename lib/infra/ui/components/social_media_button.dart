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
    return GestureDetector(
      onTap: () => onPressed(url),
      child: Container(
        width: 250,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
