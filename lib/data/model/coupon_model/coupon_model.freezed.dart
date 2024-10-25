// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CouponModel _$CouponModelFromJson(Map<String, dynamic> json) {
  return _CouponModel.fromJson(json);
}

/// @nodoc
mixin _$CouponModel {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "SubCategoryName")
  String? get subCategoryName => throw _privateConstructorUsedError;
  @JsonKey(name: "SubCategoryId")
  int? get subCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "Description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "Count_Coupon")
  String? get countCoupon => throw _privateConstructorUsedError;
  @JsonKey(name: "Expired_Date")
  DateTime? get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: "Start_Date")
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "Rate")
  String? get rate => throw _privateConstructorUsedError;
  @JsonKey(name: "Status")
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponModelCopyWith<CouponModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponModelCopyWith<$Res> {
  factory $CouponModelCopyWith(
          CouponModel value, $Res Function(CouponModel) then) =
      _$CouponModelCopyWithImpl<$Res, CouponModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "SubCategoryName") String? subCategoryName,
      @JsonKey(name: "SubCategoryId") int? subCategoryId,
      @JsonKey(name: "Description") String? description,
      @JsonKey(name: "Count_Coupon") String? countCoupon,
      @JsonKey(name: "Expired_Date") DateTime? expiredDate,
      @JsonKey(name: "Start_Date") DateTime? startDate,
      @JsonKey(name: "Rate") String? rate,
      @JsonKey(name: "Status") String? status});
}

/// @nodoc
class _$CouponModelCopyWithImpl<$Res, $Val extends CouponModel>
    implements $CouponModelCopyWith<$Res> {
  _$CouponModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? subCategoryName = freezed,
    Object? subCategoryId = freezed,
    Object? description = freezed,
    Object? countCoupon = freezed,
    Object? expiredDate = freezed,
    Object? startDate = freezed,
    Object? rate = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      subCategoryName: freezed == subCategoryName
          ? _value.subCategoryName
          : subCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategoryId: freezed == subCategoryId
          ? _value.subCategoryId
          : subCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      countCoupon: freezed == countCoupon
          ? _value.countCoupon
          : countCoupon // ignore: cast_nullable_to_non_nullable
              as String?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CouponModelImplCopyWith<$Res>
    implements $CouponModelCopyWith<$Res> {
  factory _$$CouponModelImplCopyWith(
          _$CouponModelImpl value, $Res Function(_$CouponModelImpl) then) =
      __$$CouponModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "SubCategoryName") String? subCategoryName,
      @JsonKey(name: "SubCategoryId") int? subCategoryId,
      @JsonKey(name: "Description") String? description,
      @JsonKey(name: "Count_Coupon") String? countCoupon,
      @JsonKey(name: "Expired_Date") DateTime? expiredDate,
      @JsonKey(name: "Start_Date") DateTime? startDate,
      @JsonKey(name: "Rate") String? rate,
      @JsonKey(name: "Status") String? status});
}

/// @nodoc
class __$$CouponModelImplCopyWithImpl<$Res>
    extends _$CouponModelCopyWithImpl<$Res, _$CouponModelImpl>
    implements _$$CouponModelImplCopyWith<$Res> {
  __$$CouponModelImplCopyWithImpl(
      _$CouponModelImpl _value, $Res Function(_$CouponModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? subCategoryName = freezed,
    Object? subCategoryId = freezed,
    Object? description = freezed,
    Object? countCoupon = freezed,
    Object? expiredDate = freezed,
    Object? startDate = freezed,
    Object? rate = freezed,
    Object? status = freezed,
  }) {
    return _then(_$CouponModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      subCategoryName: freezed == subCategoryName
          ? _value.subCategoryName
          : subCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategoryId: freezed == subCategoryId
          ? _value.subCategoryId
          : subCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      countCoupon: freezed == countCoupon
          ? _value.countCoupon
          : countCoupon // ignore: cast_nullable_to_non_nullable
              as String?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CouponModelImpl implements _CouponModel {
  const _$CouponModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "SubCategoryName") this.subCategoryName,
      @JsonKey(name: "SubCategoryId") this.subCategoryId,
      @JsonKey(name: "Description") this.description,
      @JsonKey(name: "Count_Coupon") this.countCoupon,
      @JsonKey(name: "Expired_Date") this.expiredDate,
      @JsonKey(name: "Start_Date") this.startDate,
      @JsonKey(name: "Rate") this.rate,
      @JsonKey(name: "Status") this.status});

  factory _$CouponModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CouponModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "SubCategoryName")
  final String? subCategoryName;
  @override
  @JsonKey(name: "SubCategoryId")
  final int? subCategoryId;
  @override
  @JsonKey(name: "Description")
  final String? description;
  @override
  @JsonKey(name: "Count_Coupon")
  final String? countCoupon;
  @override
  @JsonKey(name: "Expired_Date")
  final DateTime? expiredDate;
  @override
  @JsonKey(name: "Start_Date")
  final DateTime? startDate;
  @override
  @JsonKey(name: "Rate")
  final String? rate;
  @override
  @JsonKey(name: "Status")
  final String? status;

  @override
  String toString() {
    return 'CouponModel(id: $id, subCategoryName: $subCategoryName, subCategoryId: $subCategoryId, description: $description, countCoupon: $countCoupon, expiredDate: $expiredDate, startDate: $startDate, rate: $rate, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subCategoryName, subCategoryName) ||
                other.subCategoryName == subCategoryName) &&
            (identical(other.subCategoryId, subCategoryId) ||
                other.subCategoryId == subCategoryId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.countCoupon, countCoupon) ||
                other.countCoupon == countCoupon) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      subCategoryName,
      subCategoryId,
      description,
      countCoupon,
      expiredDate,
      startDate,
      rate,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponModelImplCopyWith<_$CouponModelImpl> get copyWith =>
      __$$CouponModelImplCopyWithImpl<_$CouponModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CouponModelImplToJson(
      this,
    );
  }
}

abstract class _CouponModel implements CouponModel {
  const factory _CouponModel(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "SubCategoryName") final String? subCategoryName,
      @JsonKey(name: "SubCategoryId") final int? subCategoryId,
      @JsonKey(name: "Description") final String? description,
      @JsonKey(name: "Count_Coupon") final String? countCoupon,
      @JsonKey(name: "Expired_Date") final DateTime? expiredDate,
      @JsonKey(name: "Start_Date") final DateTime? startDate,
      @JsonKey(name: "Rate") final String? rate,
      @JsonKey(name: "Status") final String? status}) = _$CouponModelImpl;

  factory _CouponModel.fromJson(Map<String, dynamic> json) =
      _$CouponModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "SubCategoryName")
  String? get subCategoryName;
  @override
  @JsonKey(name: "SubCategoryId")
  int? get subCategoryId;
  @override
  @JsonKey(name: "Description")
  String? get description;
  @override
  @JsonKey(name: "Count_Coupon")
  String? get countCoupon;
  @override
  @JsonKey(name: "Expired_Date")
  DateTime? get expiredDate;
  @override
  @JsonKey(name: "Start_Date")
  DateTime? get startDate;
  @override
  @JsonKey(name: "Rate")
  String? get rate;
  @override
  @JsonKey(name: "Status")
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$CouponModelImplCopyWith<_$CouponModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
