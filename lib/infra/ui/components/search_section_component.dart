import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/fonts.dart';

class SearchSectionComponent extends StatefulWidget {
  const SearchSectionComponent({super.key, required this.onChanged});
  final Function(String) onChanged;

  @override
  State<SearchSectionComponent> createState() => _SearchSectionComponentState();
}

class _SearchSectionComponentState extends State<SearchSectionComponent> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      onChanged: (value) {
        widget.onChanged(value);
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: whiteColor,
        hintText: 'Busque uma disciplina',
        hintStyle: h3Text.copyWith(
            color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w400),
        prefixIcon: const Icon(Icons.search),
      ),
      style: h3Text.copyWith(
          color: Theme.of(context).scaffoldBackgroundColor,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    );
  }
}