// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuggestPostModelImpl _$$SuggestPostModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SuggestPostModelImpl(
      id: json['id'] as int?,
      description: json['Description'] as String?,
      image: json['Image'] as String?,
      startOffer: json['Start_Offer'] == null
          ? null
          : DateTime.parse(json['Start_Offer'] as String),
      endOffer: json['End_Offer'] == null
          ? null
          : DateTime.parse(json['End_Offer'] as String),
      subCategoryName: json['SubCategoryName'] as String?,
      subCategoryImage: json['SubCategoryImage'] as String?,
      status: json['Status'] as String?,
    );

Map<String, dynamic> _$$SuggestPostModelImplToJson(
        _$SuggestPostModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Description': instance.description,
      'Image': instance.image,
      'Start_Offer': instance.startOffer?.toIso8601String(),
      'End_Offer': instance.endOffer?.toIso8601String(),
      'SubCategoryName': instance.subCategoryName,
      'SubCategoryImage': instance.subCategoryImage,
      'Status': instance.status,
    };
