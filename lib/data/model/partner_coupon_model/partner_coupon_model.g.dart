// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartnerCouponModelImpl _$$PartnerCouponModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PartnerCouponModelImpl(
      id: json['id'] as int?,
      description: json['Description'] as String?,
      countCoupon: json['Count_Coupon'] as String?,
      expiredDate: json['Expired_Date'] == null
          ? null
          : DateTime.parse(json['Expired_Date'] as String),
      startDate: json['Start_Date'] == null
          ? null
          : DateTime.parse(json['Start_Date'] as String),
      rate: json['Rate'] as String?,
      replacement: json['Replacement'] as String?,
      subCategoryId: json['SubCategory_Id'] as String?,
      status: json['Status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PartnerCouponModelImplToJson(
        _$PartnerCouponModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Description': instance.description,
      'Count_Coupon': instance.countCoupon,
      'Expired_Date': instance.expiredDate?.toIso8601String(),
      'Start_Date': instance.startDate?.toIso8601String(),
      'Rate': instance.rate,
      'Replacement': instance.replacement,
      'SubCategory_Id': instance.subCategoryId,
      'Status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
