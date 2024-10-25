import 'package:flutter/material.dart';

import '../../../../data/model/story_model/story_model.dart';
import 'story_rounded.dart';

class StorySection extends StatelessWidget {
  final List<StoryModel> storyList;

  const StorySection({super.key, required this.storyList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: storyList.map((e) => StoryRounded(storyModel: e)).toList(),
        ));
  }
}
