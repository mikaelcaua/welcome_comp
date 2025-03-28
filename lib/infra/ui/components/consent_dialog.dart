import 'package:flutter/material.dart';
import 'package:welcome_comp/infra/ui/theme/colors.dart';

class ConsentDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConsentDialog({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: blackColor,
      title: const Text('Permitir acesso ao armazenamento'),
      content: const Text('Precisamos de acesso ao armazenamento para baixar ou abrir o PDF.'),
      actions: <Widget>[
        TextButton(
          onPressed: onCancel,
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: onConfirm,
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}