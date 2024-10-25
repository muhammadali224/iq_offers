import 'package:flutter/material.dart';

import '../../../core/constant/app_strings.dart';
import '../../../core/function/valid_input.dart';

class NewName extends StatelessWidget {
  final TextEditingController textController;

  const NewName({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          validator: (val) {
            return validInput(val!, 4, 100, "name");
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: textController,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightBlueAccent,
            labelText: AppStrings.userName,
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
