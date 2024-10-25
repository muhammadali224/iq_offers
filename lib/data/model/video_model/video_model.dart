// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

VideoModel videoModelFromJson(String str) =>
    VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

@freezed
class VideoModel with _$VideoModel {
  const factory VideoModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "SubCategoryId") int? subCategoryId,
    @JsonKey(name: "Video") String? video,
    @JsonKey(name: "Start_Show") DateTime? startShow,
    @JsonKey(name: "End_Show") DateTime? endShow,
    @JsonKey(name: "Description") String? description,
    @JsonKey(name: "Status") String? status,
    @JsonKey(name: "SubCategoryName") String? subCategoryName,
    @JsonKey(name: "SubCategoryImage") String? subCategoryImage,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);
}
