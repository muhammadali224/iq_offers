// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CouponModelImpl _$$CouponModelImplFromJson(Map<String, dynamic> json) =>
    _$CouponModelImpl(
      id: json['id'] as int?,
      subCategoryName: json['SubCategoryName'] as String?,
      subCategoryId: json['SubCategoryId'] as int?,
      description: json['Description'] as String?,
      countCoupon: json['Count_Coupon'] as String?,
      expiredDate: json['Expired_Date'] == null
          ? null
          : DateTime.parse(json['Expired_Date'] as String),
      startDate: json['Start_Date'] == null
          ? null
          : DateTime.parse(json['Start_Date'] as String),
      rate: json['Rate'] as String?,
      status: json['Status'] as String?,
    );

Map<String, dynamic> _$$CouponModelImplToJson(_$CouponModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'SubCategoryName': instance.subCategoryName,
      'SubCategoryId': instance.subCategoryId,
      'Description': instance.description,
      'Count_Coupon': instance.countCoupon,
      'Expired_Date': instance.expiredDate?.toIso8601String(),
      'Start_Date': instance.startDate?.toIso8601String(),
      'Rate': instance.rate,
      'Status': instance.status,
    };
