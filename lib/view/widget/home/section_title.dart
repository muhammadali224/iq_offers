import 'package:flutter/cupertino.dart';

import '../../../core/constant/text_style.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: AppTextStyle.largePrimaryText,
      ),
    );
  }
}
