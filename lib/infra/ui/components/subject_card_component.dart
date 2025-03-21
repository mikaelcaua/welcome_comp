import 'package:flutter/material.dart';
import '../../../domain/models/subject_model.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';

class SubjectCardComponent extends StatelessWidget {
  const SubjectCardComponent({super.key, required this.subjectModel});
  final SubjectModel subjectModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              subjectModel.name,
              textAlign: TextAlign.center,
              style: h3Text,
            ),
          ],
        ),
      ),
    );
  }
}
