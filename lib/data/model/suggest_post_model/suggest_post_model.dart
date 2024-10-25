// To parse this JSON data, do
//
//     final suggestPostModel = suggestPostModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'suggest_post_model.freezed.dart';
part 'suggest_post_model.g.dart';

SuggestPostModel suggestPostModelFromJson(String str) =>
    SuggestPostModel.fromJson(json.decode(str));

String suggestPostModelToJson(SuggestPostModel data) =>
    json.encode(data.toJson());

@freezed
class SuggestPostModel with _$SuggestPostModel {
  const factory SuggestPostModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "Description") String? description,
    @JsonKey(name: "Image") String? image,
    @JsonKey(name: "Start_Offer") DateTime? startOffer,
    @JsonKey(name: "End_Offer") DateTime? endOffer,
    @JsonKey(name: "SubCategoryName") String? subCategoryName,
    @JsonKey(name: "SubCategoryImage") String? subCategoryImage,
    @JsonKey(name: "Status") String? status,
  }) = _SuggestPostModel;

  factory SuggestPostModel.fromJson(Map<String, dynamic> json) =>
      _$SuggestPostModelFromJson(json);
}
