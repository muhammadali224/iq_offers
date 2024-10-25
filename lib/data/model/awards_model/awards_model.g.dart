// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'awards_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AwardsModelImpl _$$AwardsModelImplFromJson(Map<String, dynamic> json) =>
    _$AwardsModelImpl(
      id: json['id'] as int?,
      countReplacement: json['CountReplacement'] as int?,
      description: json['Description'] as String?,
      image: json['Image'] as String?,
      value: json['Value'] as String?,
      expiredDate: json['Expired_Date'] == null
          ? null
          : DateTime.parse(json['Expired_Date'] as String),
      startDate: json['Start_Date'] == null
          ? null
          : DateTime.parse(json['Start_Date'] as String),
      subCategoryName: json['SubCategoryName'] as String?,
      subCategoryImage: json['SubCategoryImage'] as String?,
      subCategoryId: json['SubCategoryId'] as int?,
      status: json['Status'] as String?,
    );

Map<String, dynamic> _$$AwardsModelImplToJson(_$AwardsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CountReplacement': instance.countReplacement,
      'Description': instance.description,
      'Image': instance.image,
      'Value': instance.value,
      'Expired_Date': instance.expiredDate?.toIso8601String(),
      'Start_Date': instance.startDate?.toIso8601String(),
      'SubCategoryName': instance.subCategoryName,
      'SubCategoryImage': instance.subCategoryImage,
      'SubCategoryId': instance.subCategoryId,
      'Status': instance.status,
    };
