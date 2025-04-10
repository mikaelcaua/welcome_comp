import 'package:flutter/material.dart';
import '../../../domain/models/subject_model.dart';
import '../theme/colors.dart';
import '../theme/fonts.dart';

class SubjectCardComponent extends StatelessWidget {
  const SubjectCardComponent({super.key, required this.subjectModel});
  final SubjectModel subjectModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              subjectModel.name,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: h3Text.copyWith(color: whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: whiteColor,
          ),
        ],
      ),
    );
  }
}
