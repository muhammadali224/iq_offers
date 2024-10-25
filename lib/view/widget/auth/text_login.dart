import 'package:flutter/material.dart';

import '../../../core/constant/app_strings.dart';
import '../../../core/extension/space_extension.dart';

class TextLogin extends StatelessWidget {
  const TextLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, right: 10.0),
      child: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          children: <Widget>[
            60.height,
            const Center(
              child: Text(
                AppStrings.worldOfOffers,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
