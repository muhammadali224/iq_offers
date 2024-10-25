import 'package:flutter/material.dart';

import '../../../core/constant/app_strings.dart';
import '../../../core/function/valid_input.dart';

class NewPhone extends StatelessWidget {
  final TextEditingController textController;
  const NewPhone({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: SizedBox(
        // height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) {
            return validInput(val!, 10, 10, "phone");
          },
          controller: textController,
          keyboardType: TextInputType.phone,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightBlueAccent,
            labelText: AppStrings.phone,
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
