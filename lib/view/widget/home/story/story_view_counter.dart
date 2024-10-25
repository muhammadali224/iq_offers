import 'package:flutter/material.dart';

import '../../../../core/extension/space_extension.dart';

class StoryViewCounter extends StatelessWidget {
  final String? counter;

  const StoryViewCounter({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.remove_red_eye_rounded,
            color: Colors.white38,
          ),
          10.width,
          Text(
            counter ?? "0",
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
