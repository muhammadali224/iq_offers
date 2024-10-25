// To parse this JSON data, do
//
//     final citiesModel = citiesModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cities_model.freezed.dart';

part 'cities_model.g.dart';

CitiesModel citiesModelFromJson(String str) =>
    CitiesModel.fromJson(json.decode(str));

String citiesModelToJson(CitiesModel data) => json.encode(data.toJson());

@freezed
class CitiesModel with _$CitiesModel {
  const factory CitiesModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "Name") String? name,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _CitiesModel;

  factory CitiesModel.fromJson(Map<String, dynamic> json) =>
      _$CitiesModelFromJson(json);
}
