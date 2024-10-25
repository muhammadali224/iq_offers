// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';

part 'post_model.g.dart';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "Description") String? description,
    @JsonKey(name: "Image") String? image,
    @JsonKey(name: "SubCategory_Id") String? subCategoryId,
    @JsonKey(name: "Start_Offer") DateTime? startOffer,
    @JsonKey(name: "End_Offer") DateTime? endOffer,
    @JsonKey(name: "Likes") String? likes,
    @JsonKey(name: "DisLikes") String? disLikes,
    @JsonKey(name: "Status") String? status,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
