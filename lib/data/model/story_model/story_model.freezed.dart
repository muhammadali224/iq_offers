// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) {
  return _StoryModel.fromJson(json);
}

/// @nodoc
mixin _$StoryModel {
  @JsonKey(name: "SubCategoryName")
  String? get subCategoryName => throw _privateConstructorUsedError;
  @JsonKey(name: "SubCategoryImage")
  String? get subCategoryImage => throw _privateConstructorUsedError;
  @JsonKey(name: "url")
  List<Url>? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryModelCopyWith<StoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryModelCopyWith<$Res> {
  factory $StoryModelCopyWith(
          StoryModel value, $Res Function(StoryModel) then) =
      _$StoryModelCopyWithImpl<$Res, StoryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "SubCategoryName") String? subCategoryName,
      @JsonKey(name: "SubCategoryImage") String? subCategoryImage,
      @JsonKey(name: "url") List<Url>? url});
}

/// @nodoc
class _$StoryModelCopyWithImpl<$Res, $Val extends StoryModel>
    implements $StoryModelCopyWith<$Res> {
  _$StoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subCategoryName = freezed,
    Object? subCategoryImage = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      subCategoryName: freezed == subCategoryName
          ? _value.subCategoryName
          : subCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategoryImage: freezed == subCategoryImage
          ? _value.subCategoryImage
          : subCategoryImage // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as List<Url>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryModelImplCopyWith<$Res>
    implements $StoryModelCopyWith<$Res> {
  factory _$$StoryModelImplCopyWith(
          _$StoryModelImpl value, $Res Function(_$StoryModelImpl) then) =
      __$$StoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "SubCategoryName") String? subCategoryName,
      @JsonKey(name: "SubCategoryImage") String? subCategoryImage,
      @JsonKey(name: "url") List<Url>? url});
}

/// @nodoc
class __$$StoryModelImplCopyWithImpl<$Res>
    extends _$StoryModelCopyWithImpl<$Res, _$StoryModelImpl>
    implements _$$StoryModelImplCopyWith<$Res> {
  __$$StoryModelImplCopyWithImpl(
      _$StoryModelImpl _value, $Res Function(_$StoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subCategoryName = freezed,
    Object? subCategoryImage = freezed,
    Object? url = freezed,
  }) {
    return _then(_$StoryModelImpl(
      subCategoryName: freezed == subCategoryName
          ? _value.subCategoryName
          : subCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategoryImage: freezed == subCategoryImage
          ? _value.subCategoryImage
          : subCategoryImage // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value._url
          : url // ignore: cast_nullable_to_non_nullable
              as List<Url>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryModelImpl implements _StoryModel {
  const _$StoryModelImpl(
      {@JsonKey(name: "SubCategoryName") this.subCategoryName,
      @JsonKey(name: "SubCategoryImage") this.subCategoryImage,
      @JsonKey(name: "url") final List<Url>? url})
      : _url = url;

  factory _$StoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryModelImplFromJson(json);

  @override
  @JsonKey(name: "SubCategoryName")
  final String? subCategoryName;
  @override
  @JsonKey(name: "SubCategoryImage")
  final String? subCategoryImage;
  final List<Url>? _url;
  @override
  @JsonKey(name: "url")
  List<Url>? get url {
    final value = _url;
    if (value == null) return null;
    if (_url is EqualUnmodifiableListView) return _url;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StoryModel(subCategoryName: $subCategoryName, subCategoryImage: $subCategoryImage, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryModelImpl &&
            (identical(other.subCategoryName, subCategoryName) ||
                other.subCategoryName == subCategoryName) &&
            (identical(other.subCategoryImage, subCategoryImage) ||
                other.subCategoryImage == subCategoryImage) &&
            const DeepCollectionEquality().equals(other._url, _url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, subCategoryName,
      subCategoryImage, const DeepCollectionEquality().hash(_url));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryModelImplCopyWith<_$StoryModelImpl> get copyWith =>
      __$$StoryModelImplCopyWithImpl<_$StoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryModelImplToJson(
      this,
    );
  }
}

abstract class _StoryModel implements StoryModel {
  const factory _StoryModel(
      {@JsonKey(name: "SubCategoryName") final String? subCategoryName,
      @JsonKey(name: "SubCategoryImage") final String? subCategoryImage,
      @JsonKey(name: "url") final List<Url>? url}) = _$StoryModelImpl;

  factory _StoryModel.fromJson(Map<String, dynamic> json) =
      _$StoryModelImpl.fromJson;

  @override
  @JsonKey(name: "SubCategoryName")
  String? get subCategoryName;
  @override
  @JsonKey(name: "SubCategoryImage")
  String? get subCategoryImage;
  @override
  @JsonKey(name: "url")
  List<Url>? get url;
  @override
  @JsonKey(ignore: true)
  _$$StoryModelImplCopyWith<_$StoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Url _$UrlFromJson(Map<String, dynamic> json) {
  return _Url.fromJson(json);
}

/// @nodoc
mixin _$Url {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "Image")
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "Video")
  String? get video => throw _privateConstructorUsedError;
  @JsonKey(name: "Content")
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: "View_Count")
  String? get viewCount => throw _privateConstructorUsedError;
  @JsonKey(name: "End_Story")
  DateTime? get endStory => throw _privateConstructorUsedError;
  @JsonKey(name: "Type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UrlCopyWith<Url> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UrlCopyWith<$Res> {
  factory $UrlCopyWith(Url value, $Res Function(Url) then) =
      _$UrlCopyWithImpl<$Res, Url>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "Image") String? image,
      @JsonKey(name: "Video") String? video,
      @JsonKey(name: "Content") String? content,
      @JsonKey(name: "View_Count") String? viewCount,
      @JsonKey(name: "End_Story") DateTime? endStory,
      @JsonKey(name: "Type") String? type,
      @JsonKey(name: "created_at") DateTime? createdAt});
}

/// @nodoc
class _$UrlCopyWithImpl<$Res, $Val extends Url> implements $UrlCopyWith<$Res> {
  _$UrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? video = freezed,
    Object? content = freezed,
    Object? viewCount = freezed,
    Object? endStory = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as String?,
      endStory: freezed == endStory
          ? _value.endStory
          : endStory // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UrlImplCopyWith<$Res> implements $UrlCopyWith<$Res> {
  factory _$$UrlImplCopyWith(_$UrlImpl value, $Res Function(_$UrlImpl) then) =
      __$$UrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "Image") String? image,
      @JsonKey(name: "Video") String? video,
      @JsonKey(name: "Content") String? content,
      @JsonKey(name: "View_Count") String? viewCount,
      @JsonKey(name: "End_Story") DateTime? endStory,
      @JsonKey(name: "Type") String? type,
      @JsonKey(name: "created_at") DateTime? createdAt});
}

/// @nodoc
class __$$UrlImplCopyWithImpl<$Res> extends _$UrlCopyWithImpl<$Res, _$UrlImpl>
    implements _$$UrlImplCopyWith<$Res> {
  __$$UrlImplCopyWithImpl(_$UrlImpl _value, $Res Function(_$UrlImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? video = freezed,
    Object? content = freezed,
    Object? viewCount = freezed,
    Object? endStory = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$UrlImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as String?,
      endStory: freezed == endStory
          ? _value.endStory
          : endStory // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UrlImpl implements _Url {
  const _$UrlImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "Image") this.image,
      @JsonKey(name: "Video") this.video,
      @JsonKey(name: "Content") this.content,
      @JsonKey(name: "View_Count") this.viewCount,
      @JsonKey(name: "End_Story") this.endStory,
      @JsonKey(name: "Type") this.type,
      @JsonKey(name: "created_at") this.createdAt});

  factory _$UrlImpl.fromJson(Map<String, dynamic> json) =>
      _$$UrlImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "Image")
  final String? image;
  @override
  @JsonKey(name: "Video")
  final String? video;
  @override
  @JsonKey(name: "Content")
  final String? content;
  @override
  @JsonKey(name: "View_Count")
  final String? viewCount;
  @override
  @JsonKey(name: "End_Story")
  final DateTime? endStory;
  @override
  @JsonKey(name: "Type")
  final String? type;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Url(id: $id, image: $image, video: $video, content: $content, viewCount: $viewCount, endStory: $endStory, type: $type, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UrlImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.endStory, endStory) ||
                other.endStory == endStory) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, image, video, content,
      viewCount, endStory, type, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UrlImplCopyWith<_$UrlImpl> get copyWith =>
      __$$UrlImplCopyWithImpl<_$UrlImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UrlImplToJson(
      this,
    );
  }
}

abstract class _Url implements Url {
  const factory _Url(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "Image") final String? image,
      @JsonKey(name: "Video") final String? video,
      @JsonKey(name: "Content") final String? content,
      @JsonKey(name: "View_Count") final String? viewCount,
      @JsonKey(name: "End_Story") final DateTime? endStory,
      @JsonKey(name: "Type") final String? type,
      @JsonKey(name: "created_at") final DateTime? createdAt}) = _$UrlImpl;

  factory _Url.fromJson(Map<String, dynamic> json) = _$UrlImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "Image")
  String? get image;
  @override
  @JsonKey(name: "Video")
  String? get video;
  @override
  @JsonKey(name: "Content")
  String? get content;
  @override
  @JsonKey(name: "View_Count")
  String? get viewCount;
  @override
  @JsonKey(name: "End_Story")
  DateTime? get endStory;
  @override
  @JsonKey(name: "Type")
  String? get type;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UrlImplCopyWith<_$UrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
