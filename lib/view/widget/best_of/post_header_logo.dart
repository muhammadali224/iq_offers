import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/text_style.dart';

class PostHeaderLogo extends StatelessWidget {
  final String name;
  final String imageUrl;

  const PostHeaderLogo({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          imageBuilder: (_, imageProvider) => Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                )),
          ),
        ),
        Text(
          name,
          style: AppTextStyle.titlePrimaryText,
        ),
      ],
    );
  }
}
