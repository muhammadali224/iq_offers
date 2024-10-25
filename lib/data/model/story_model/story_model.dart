// To parse this JSON data, do
//
//     final storyModel = storyModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_model.freezed.dart';

part 'story_model.g.dart';

List<StoryModel> storyModelFromJson(String str) =>
    List<StoryModel>.from(json.decode(str).map((x) => StoryModel.fromJson(x)));

String storyModelToJson(List<StoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class StoryModel with _$StoryModel {
  const factory StoryModel({
    @JsonKey(name: "SubCategoryName") String? subCategoryName,
    @JsonKey(name: "SubCategoryImage") String? subCategoryImage,
    @JsonKey(name: "url") List<Url>? url,
  }) = _StoryModel;

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);
}

@freezed
class Url with _$Url {
  const factory Url({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "Image") String? image,
    @JsonKey(name: "Video") String? video,
    @JsonKey(name: "Content") String? content,
    @JsonKey(name: "View_Count") String? viewCount,
    @JsonKey(name: "End_Story") DateTime? endStory,
    @JsonKey(name: "Type") String? type,
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _Url;

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);
}
