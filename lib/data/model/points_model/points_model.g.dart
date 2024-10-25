// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointsModelImpl _$$PointsModelImplFromJson(Map<String, dynamic> json) =>
    _$PointsModelImpl(
      id: json['id'] as int?,
      userName: json['UserName'] as String?,
      description: json['Description'] as String?,
      totalPoint: json['Total_Point'] as String?,
      point: json['Point'] as String?,
      expiredDate: json['Expired_Date'] == null
          ? null
          : DateTime.parse(json['Expired_Date'] as String),
      startDate: json['Start_Date'] == null
          ? null
          : DateTime.parse(json['Start_Date'] as String),
      status: json['Status'] as String?,
    );

Map<String, dynamic> _$$PointsModelImplToJson(_$PointsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'UserName': instance.userName,
      'Description': instance.description,
      'Total_Point': instance.totalPoint,
      'Point': instance.point,
      'Expired_Date': instance.expiredDate?.toIso8601String(),
      'Start_Date': instance.startDate?.toIso8601String(),
      'Status': instance.status,
    };
