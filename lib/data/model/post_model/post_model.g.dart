// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      id: json['id'] as int?,
      description: json['Description'] as String?,
      image: json['Image'] as String?,
      subCategoryId: json['SubCategory_Id'] as String?,
      startOffer: json['Start_Offer'] == null
          ? null
          : DateTime.parse(json['Start_Offer'] as String),
      endOffer: json['End_Offer'] == null
          ? null
          : DateTime.parse(json['End_Offer'] as String),
      likes: json['Likes'] as String?,
      disLikes: json['DisLikes'] as String?,
      status: json['Status'] as String?,
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Description': instance.description,
      'Image': instance.image,
      'SubCategory_Id': instance.subCategoryId,
      'Start_Offer': instance.startOffer?.toIso8601String(),
      'End_Offer': instance.endOffer?.toIso8601String(),
      'Likes': instance.likes,
      'DisLikes': instance.disLikes,
      'Status': instance.status,
    };
