// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_awards_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartnerAwardsModelImpl _$$PartnerAwardsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PartnerAwardsModelImpl(
      id: json['id'] as int?,
      description: json['Description'] as String?,
      image: json['Image'] as String?,
      value: json['Value'] as String?,
      expiredDate: json['Expired_Date'] == null
          ? null
          : DateTime.parse(json['Expired_Date'] as String),
      startDate: json['Start_Date'] == null
          ? null
          : DateTime.parse(json['Start_Date'] as String),
      status: json['Status'] as String?,
      subCategoryId: json['SubCategory_Id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PartnerAwardsModelImplToJson(
        _$PartnerAwardsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Description': instance.description,
      'Image': instance.image,
      'Value': instance.value,
      'Expired_Date': instance.expiredDate?.toIso8601String(),
      'Start_Date': instance.startDate?.toIso8601String(),
      'Status': instance.status,
      'SubCategory_Id': instance.subCategoryId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
