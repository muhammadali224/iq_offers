// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactModelImpl _$$ContactModelImplFromJson(Map<String, dynamic> json) =>
    _$ContactModelImpl(
      id: json['id'] as int?,
      phone: json['Phone'] as String?,
      location: json['Location'] as String?,
      facebookUrl: json['Facebook_Url'] as String?,
      instagramUrl: json['Instagram_Url'] as String?,
      youtupeUrl: json['Youtupe_Url'] as String?,
      tiktokUrl: json['Tiktok_Url'] as String?,
      whatsappUrl: json['Whatsapp_Url'] as String?,
      sanpchatUrl: json['Sanpchat_Url'] as String?,
      subCategoryId: json['SubCategory_Id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ContactModelImplToJson(_$ContactModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Phone': instance.phone,
      'Location': instance.location,
      'Facebook_Url': instance.facebookUrl,
      'Instagram_Url': instance.instagramUrl,
      'Youtupe_Url': instance.youtupeUrl,
      'Tiktok_Url': instance.tiktokUrl,
      'Whatsapp_Url': instance.whatsappUrl,
      'Sanpchat_Url': instance.sanpchatUrl,
      'SubCategory_Id': instance.subCategoryId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
