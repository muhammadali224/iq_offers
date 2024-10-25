import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../core/extension/space_extension.dart';

class StoryProfile extends StatelessWidget {
  final String name;
  final String imageUrl;
  final DateTime createdDate;

  const StoryProfile(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.createdDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 78,
        left: 16,
        right: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (_, imageProvider) => CircleAvatar(
              radius: 24,
              backgroundImage: imageProvider,
            ),
          ),
          16.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  Jiffy.parseFromDateTime(createdDate).fromNow(),
                  style: const TextStyle(
                    color: Colors.white38,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
