import 'package:flutter/material.dart';

import '../../../core/constant/app_strings.dart';
import '../../../core/function/valid_input.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController? textController;
  const PasswordInput({super.key, this.textController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) {
            return validInput(val!, 8, 16, "password");
          },
          controller: textController,
          style: const TextStyle(color: Colors.white),
          obscureText: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: AppStrings.password,
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
