import 'package:flutter/material.dart';

class ConsentRequestScreen extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const ConsentRequestScreen({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Para baixar o arquivo, precisamos da sua permissão de armazenamento.'),
          ElevatedButton(
            onPressed: onButtonPressed,
            child: const Text('Autorizar acesso ao armazenamento interno'),
          ),
        ],
      ),
    );
  }
}