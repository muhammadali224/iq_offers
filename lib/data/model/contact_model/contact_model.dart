// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

ContactModel contactModelFromJson(String str) =>
    ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

@freezed
class ContactModel with _$ContactModel {
  const factory ContactModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "Phone") String? phone,
    @JsonKey(name: "Location") String? location,
    @JsonKey(name: "Facebook_Url") String? facebookUrl,
    @JsonKey(name: "Instagram_Url") String? instagramUrl,
    @JsonKey(name: "Youtupe_Url") String? youtupeUrl,
    @JsonKey(name: "Tiktok_Url") String? tiktokUrl,
    @JsonKey(name: "Whatsapp_Url") String? whatsappUrl,
    @JsonKey(name: "Sanpchat_Url") String? sanpchatUrl,
    @JsonKey(name: "SubCategory_Id") String? subCategoryId,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _ContactModel;

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);
}
