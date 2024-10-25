// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_cat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubCatModelImpl _$$SubCatModelImplFromJson(Map<String, dynamic> json) =>
    _$SubCatModelImpl(
      id: json['id'] as int?,
      name: json['Name'] as String?,
      image: json['Image'] as String?,
      cityId: json['City_Id'] as String?,
      status: json['Status'] as String?,
      active: json['Active'] as String?,
      cityName: json['CityName'] as String?,
      totalRating: json['TotalRating'] as num?,
    );

Map<String, dynamic> _$$SubCatModelImplToJson(_$SubCatModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Name': instance.name,
      'Image': instance.image,
      'City_Id': instance.cityId,
      'Status': instance.status,
      'Active': instance.active,
      'CityName': instance.cityName,
      'TotalRating': instance.totalRating,
    };
