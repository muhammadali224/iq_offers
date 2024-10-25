// To parse this JSON data, do
//
//     final pointsModel = pointsModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'points_model.freezed.dart';

part 'points_model.g.dart';

PointsModel pointsModelFromJson(String str) =>
    PointsModel.fromJson(json.decode(str));

String pointsModelToJson(PointsModel data) => json.encode(data.toJson());

@freezed
class PointsModel with _$PointsModel {
  const factory PointsModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "UserName") String? userName,
    @JsonKey(name: "Description") String? description,
    @JsonKey(name: "Total_Point") String? totalPoint,
    @JsonKey(name: "Point") String? point,
    @JsonKey(name: "Expired_Date") DateTime? expiredDate,
    @JsonKey(name: "Start_Date") DateTime? startDate,
    @JsonKey(name: "Status") String? status,
  }) = _PointsModel;

  factory PointsModel.fromJson(Map<String, dynamic> json) =>
      _$PointsModelFromJson(json);
}
