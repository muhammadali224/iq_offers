// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CitiesModelImpl _$$CitiesModelImplFromJson(Map<String, dynamic> json) =>
    _$CitiesModelImpl(
      id: json['id'] as int?,
      name: json['Name'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CitiesModelImplToJson(_$CitiesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Name': instance.name,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
