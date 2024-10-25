// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advertisement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdvertisementModel _$AdvertisementModelFromJson(Map<String, dynamic> json) {
  return _AdvertisementModel.fromJson(json);
}

/// @nodoc
mixin _$AdvertisementModel {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "Description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "Image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "Price")
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "Start")
  DateTime? get start => throw _privateConstructorUsedError;
  @JsonKey(name: "End")
  DateTime? get end => throw _privateConstructorUsedError;
  @JsonKey(name: "SubCategory_Id")
  dynamic get subCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "Status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdvertisementModelCopyWith<AdvertisementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvertisementModelCopyWith<$Res> {
  factory $AdvertisementModelCopyWith(
          AdvertisementModel value, $Res Function(AdvertisementModel) then) =
      _$AdvertisementModelCopyWithImpl<$Res, AdvertisementModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "Description") String? description,
      @JsonKey(name: "Image") String? image,
      @JsonKey(name: "Price") String? price,
      @JsonKey(name: "Start") DateTime? start,
      @JsonKey(name: "End") DateTime? end,
      @JsonKey(name: "SubCategory_Id") dynamic subCategoryId,
      @JsonKey(name: "Status") String? status,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class _$AdvertisementModelCopyWithImpl<$Res, $Val extends AdvertisementModel>
    implements $AdvertisementModelCopyWith<$Res> {
  _$AdvertisementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? subCategoryId = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subCategoryId: freezed == subCategoryId
          ? _value.subCategoryId
          : subCategoryId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdvertisementModelImplCopyWith<$Res>
    implements $AdvertisementModelCopyWith<$Res> {
  factory _$$AdvertisementModelImplCopyWith(_$AdvertisementModelImpl value,
          $Res Function(_$AdvertisementModelImpl) then) =
      __$$AdvertisementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "Description") String? description,
      @JsonKey(name: "Image") String? image,
      @JsonKey(name: "Price") String? price,
      @JsonKey(name: "Start") DateTime? start,
      @JsonKey(name: "End") DateTime? end,
      @JsonKey(name: "SubCategory_Id") dynamic subCategoryId,
      @JsonKey(name: "Status") String? status,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt});
}

/// @nodoc
class __$$AdvertisementModelImplCopyWithImpl<$Res>
    extends _$AdvertisementModelCopyWithImpl<$Res, _$AdvertisementModelImpl>
    implements _$$AdvertisementModelImplCopyWith<$Res> {
  __$$AdvertisementModelImplCopyWithImpl(_$AdvertisementModelImpl _value,
      $Res Function(_$AdvertisementModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? subCategoryId = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$AdvertisementModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subCategoryId: freezed == subCategoryId
          ? _value.subCategoryId
          : subCategoryId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdvertisementModelImpl implements _AdvertisementModel {
  const _$AdvertisementModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "Description") this.description,
      @JsonKey(name: "Image") this.image,
      @JsonKey(name: "Price") this.price,
      @JsonKey(name: "Start") this.start,
      @JsonKey(name: "End") this.end,
      @JsonKey(name: "SubCategory_Id") this.subCategoryId,
      @JsonKey(name: "Status") this.status,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt});

  factory _$AdvertisementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdvertisementModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "Description")
  final String? description;
  @override
  @JsonKey(name: "Image")
  final String? image;
  @override
  @JsonKey(name: "Price")
  final String? price;
  @override
  @JsonKey(name: "Start")
  final DateTime? start;
  @override
  @JsonKey(name: "End")
  final DateTime? end;
  @override
  @JsonKey(name: "SubCategory_Id")
  final dynamic subCategoryId;
  @override
  @JsonKey(name: "Status")
  final String? status;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'AdvertisementModel(id: $id, description: $description, image: $image, price: $price, start: $start, end: $end, subCategoryId: $subCategoryId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdvertisementModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            const DeepCollectionEquality()
                .equals(other.subCategoryId, subCategoryId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      description,
      image,
      price,
      start,
      end,
      const DeepCollectionEquality().hash(subCategoryId),
      status,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdvertisementModelImplCopyWith<_$AdvertisementModelImpl> get copyWith =>
      __$$AdvertisementModelImplCopyWithImpl<_$AdvertisementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdvertisementModelImplToJson(
      this,
    );
  }
}

abstract class _AdvertisementModel implements AdvertisementModel {
  const factory _AdvertisementModel(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "Description") final String? description,
          @JsonKey(name: "Image") final String? image,
          @JsonKey(name: "Price") final String? price,
          @JsonKey(name: "Start") final DateTime? start,
          @JsonKey(name: "End") final DateTime? end,
          @JsonKey(name: "SubCategory_Id") final dynamic subCategoryId,
          @JsonKey(name: "Status") final String? status,
          @JsonKey(name: "created_at") final DateTime? createdAt,
          @JsonKey(name: "updated_at") final DateTime? updatedAt}) =
      _$AdvertisementModelImpl;

  factory _AdvertisementModel.fromJson(Map<String, dynamic> json) =
      _$AdvertisementModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "Description")
  String? get description;
  @override
  @JsonKey(name: "Image")
  String? get image;
  @override
  @JsonKey(name: "Price")
  String? get price;
  @override
  @JsonKey(name: "Start")
  DateTime? get start;
  @override
  @JsonKey(name: "End")
  DateTime? get end;
  @override
  @JsonKey(name: "SubCategory_Id")
  dynamic get subCategoryId;
  @override
  @JsonKey(name: "Status")
  String? get status;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$AdvertisementModelImplCopyWith<_$AdvertisementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
