import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class PlayPauseIcon extends StatelessWidget {
  const PlayPauseIcon({super.key});

  Future<int> tempFuture() async {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: tempFuture(),
          builder: (_, snapshot) => snapshot.connectionState !=
                  ConnectionState.done
              ? Icon(Icons.play_arrow, size: 110, color: AppColor.primaryColor)
              : const SizedBox()),
    );
  }
}
