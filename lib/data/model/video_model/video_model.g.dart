// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoModelImpl _$$VideoModelImplFromJson(Map<String, dynamic> json) =>
    _$VideoModelImpl(
      id: json['id'] as int?,
      subCategoryId: json['SubCategoryId'] as int?,
      video: json['Video'] as String?,
      startShow: json['Start_Show'] == null
          ? null
          : DateTime.parse(json['Start_Show'] as String),
      endShow: json['End_Show'] == null
          ? null
          : DateTime.parse(json['End_Show'] as String),
      description: json['Description'] as String?,
      status: json['Status'] as String?,
      subCategoryName: json['SubCategoryName'] as String?,
      subCategoryImage: json['SubCategoryImage'] as String?,
    );

Map<String, dynamic> _$$VideoModelImplToJson(_$VideoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'SubCategoryId': instance.subCategoryId,
      'Video': instance.video,
      'Start_Show': instance.startShow?.toIso8601String(),
      'End_Show': instance.endShow?.toIso8601String(),
      'Description': instance.description,
      'Status': instance.status,
      'SubCategoryName': instance.subCategoryName,
      'SubCategoryImage': instance.subCategoryImage,
    };
