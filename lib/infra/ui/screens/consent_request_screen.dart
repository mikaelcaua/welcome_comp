import 'package:flutter/material.dart';
import 'package:welcome_comp/infra/ui/theme/colors.dart';

class ConsentRequestScreen extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const ConsentRequestScreen({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Para baixar o arquivo, precisamos da sua permissão de armazenamento.',
              style: TextStyle(fontSize: 20, color: whiteColor),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: onButtonPressed,
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(primaryColor),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              child: Text(
                'Autorizar acesso ao armazenamento interno',
                style: TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
