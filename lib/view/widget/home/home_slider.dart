import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../controller/user_role_controller/home_controller/home_controller.dart';
import '../../../core/constant/api_link.dart';

class HomeAdvSlider extends GetView<HomeController> {
  const HomeAdvSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: controller.adsList.length,
      itemBuilder: (BuildContext context, int index, int realIndex) =>
          CachedNetworkImage(
        imageUrl:
            AppLink.advertisementImages + controller.adsList[index].image!,
        imageBuilder: (context, imageProvider) => Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          )),
        ),
      ),
      options: CarouselOptions(
          height: 200,
          // enlargeCenterPage: true,
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1)),
    );
  }
}
