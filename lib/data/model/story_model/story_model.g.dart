// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryModelImpl _$$StoryModelImplFromJson(Map<String, dynamic> json) =>
    _$StoryModelImpl(
      subCategoryName: json['SubCategoryName'] as String?,
      subCategoryImage: json['SubCategoryImage'] as String?,
      url: (json['url'] as List<dynamic>?)
          ?.map((e) => Url.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StoryModelImplToJson(_$StoryModelImpl instance) =>
    <String, dynamic>{
      'SubCategoryName': instance.subCategoryName,
      'SubCategoryImage': instance.subCategoryImage,
      'url': instance.url,
    };

_$UrlImpl _$$UrlImplFromJson(Map<String, dynamic> json) => _$UrlImpl(
      id: json['id'] as int?,
      image: json['Image'] as String?,
      video: json['Video'] as String?,
      content: json['Content'] as String?,
      viewCount: json['View_Count'] as String?,
      endStory: json['End_Story'] == null
          ? null
          : DateTime.parse(json['End_Story'] as String),
      type: json['Type'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$UrlImplToJson(_$UrlImpl instance) => <String, dynamic>{
      'id': instance.id,
      'Image': instance.image,
      'Video': instance.video,
      'Content': instance.content,
      'View_Count': instance.viewCount,
      'End_Story': instance.endStory?.toIso8601String(),
      'Type': instance.type,
      'created_at': instance.createdAt?.toIso8601String(),
    };
