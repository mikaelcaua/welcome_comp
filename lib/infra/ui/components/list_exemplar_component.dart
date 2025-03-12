import 'package:flutter/material.dart';
import 'package:welcome_comp/domain/models/exemplar_model.dart';

class ListExemplarComponent extends StatelessWidget {
  const ListExemplarComponent({super.key, required this.listExemplarModel});
  final List<ExemplarModel> listExemplarModel;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listExemplarModel.map((exemplar) {
          return Text(exemplar.name);
        }).toList());
  }
}
