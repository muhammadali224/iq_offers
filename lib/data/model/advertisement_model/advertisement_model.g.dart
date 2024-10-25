// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdvertisementModelImpl _$$AdvertisementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdvertisementModelImpl(
      id: json['id'] as int?,
      description: json['Description'] as String?,
      image: json['Image'] as String?,
      price: json['Price'] as String?,
      start: json['Start'] == null
          ? null
          : DateTime.parse(json['Start'] as String),
      end: json['End'] == null ? null : DateTime.parse(json['End'] as String),
      subCategoryId: json['SubCategory_Id'],
      status: json['Status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$AdvertisementModelImplToJson(
        _$AdvertisementModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Description': instance.description,
      'Image': instance.image,
      'Price': instance.price,
      'Start': instance.start?.toIso8601String(),
      'End': instance.end?.toIso8601String(),
      'SubCategory_Id': instance.subCategoryId,
      'Status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
