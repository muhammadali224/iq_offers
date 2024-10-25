// To parse this JSON data, do
//
//     final couponModel = couponModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_model.freezed.dart';

part 'coupon_model.g.dart';

CouponModel couponModelFromJson(String str) =>
    CouponModel.fromJson(json.decode(str));

String couponModelToJson(CouponModel data) => json.encode(data.toJson());

@freezed
class CouponModel with _$CouponModel {
  const factory CouponModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "SubCategoryName") String? subCategoryName,
    @JsonKey(name: "SubCategoryId") int? subCategoryId,
    @JsonKey(name: "Description") String? description,
    @JsonKey(name: "Count_Coupon") String? countCoupon,
    @JsonKey(name: "Expired_Date") DateTime? expiredDate,
    @JsonKey(name: "Start_Date") DateTime? startDate,
    @JsonKey(name: "Rate") String? rate,
    @JsonKey(name: "Status") String? status,
  }) = _CouponModel;

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);
}
