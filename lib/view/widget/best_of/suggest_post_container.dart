import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'post_header_logo.dart';

import '../../../core/constant/api_link.dart';
import '../../../core/extension/space_extension.dart';
import '../../../data/model/suggest_post_model/suggest_post_model.dart';

class SuggestPostContainer extends StatelessWidget {
  final SuggestPostModel e;

  const SuggestPostContainer({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          border: Border.all(width: 0.2)),
      child: Column(
        children: [
          PostHeaderLogo(
            name: e.subCategoryName!,
            imageUrl: AppLink.subCategoriesImages + e.subCategoryImage!,
          ),
          CachedNetworkImage(
            imageUrl: AppLink.postImages + e.image!,
            fit: BoxFit.fill,
            imageBuilder: (_, imageProvider) => Container(
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(e.description!),
          ),
          15.height,
        ],
      ),
    );
  }
}
