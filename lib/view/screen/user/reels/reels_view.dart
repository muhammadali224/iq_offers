import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cached_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../controller/user_role_controller/favorite_controller/favorite_controller.dart';
import '../../../../core/constant/api_link.dart';
import '../../../../core/constant/text_style.dart';
import '../../../../core/extension/space_extension.dart';
import '../../../../data/model/video_model/video_model.dart';
import '../../../../generated/assets.dart';

class ReelsViewVideo extends StatefulWidget {
  final VideoModel videoModel;

  const ReelsViewVideo({
    super.key,
    required this.videoModel,
  });

  @override
  State<ReelsViewVideo> createState() => _ReelsViewVideoState();
}

class _ReelsViewVideoState extends State<ReelsViewVideo> {
  VideoPlayerController? _controller;
  ChewieController? chewieController;
  Chewie? playerWidget;
  int? bufferDelay;

  @override
  void initState() {
    initializePlayer("${AppLink.postImages}${widget.videoModel.video}");
    setState(() {});
    super.initState();
  }

//Initialize Video Player
  void initializePlayer(String url) async {
    final fileInfo = await checkCacheFor(url);
    if (fileInfo == null) {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(url),
      );

      _controller!.initialize().then((value) {
        cachedForUrl(url);
        chewieController = ChewieController(
          videoPlayerController: _controller!,
          autoPlay: true,
          looping: true,
          showOptions: false,
          showControls: false,
          deviceOrientationsAfterFullScreen: [
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ],
          progressIndicatorDelay:
              bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
        );
        playerWidget = Chewie(controller: chewieController!);
      });
    } else {
      final file = fileInfo.file;
      _controller = VideoPlayerController.file(file);
      _controller!.initialize().then((value) {
        setState(() {
          chewieController = ChewieController(
            videoPlayerController: _controller!,
            autoPlay: true,
            looping: true,
            showControls: false,
            deviceOrientationsAfterFullScreen: [
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ],
            progressIndicatorDelay: bufferDelay != null
                ? Duration(milliseconds: bufferDelay!)
                : null,
          );
          playerWidget = Chewie(controller: chewieController!);
        });
      });
    }
    setState(() {});
  }

  Future<FileInfo?> checkCacheFor(String url) async {
    final FileInfo? value = await DefaultCacheManager().getFileFromCache(url);
    return value;
  }

//:cached Url Data
  void cachedForUrl(String url) async {
    await DefaultCacheManager().getSingleFile(url).then((value) {
      print('downloaded successfully done for $url');
    });
  }

//:Dispose
  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
      chewieController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return GetBuilder<FavoriteController>(builder: (favController) {
      return Stack(
        fit: StackFit.expand,
        children: [
          if (chewieController != null && _controller!.value.isInitialized)
            GestureDetector(
              onTap: () {
                if (_controller!.value.isPlaying) {
                  _controller!.pause();
                } else {
                  _controller!.play();
                }
              },
              child: playerWidget!,
            ),
          // : Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       const CircularProgressIndicator(),
          //       10.height,
          //       const Text(AppStrings.loading),
          //     ],
          //   ),
          if (widget.videoModel.status == "0")
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(Assets.imagesEndOffer),
            ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CachedNetworkImage(
                      imageUrl: AppLink.subCategoriesImages +
                          widget.videoModel.subCategoryImage!,
                      imageBuilder: (_, imageProvider) => CircleAvatar(
                            backgroundImage: imageProvider,
                            radius: 30,
                          )),
                  Text(
                    widget.videoModel.subCategoryName!,
                    style: AppTextStyle.titlePrimaryText
                        .copyWith(fontSize: 18, color: Colors.white),
                  ),
                  10.height,
                  TextButton(
                      onPressed: () async {
                        await favController.addFavorite(widget.videoModel.id!);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(100)),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 40,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
