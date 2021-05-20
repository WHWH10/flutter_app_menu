// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageResultModel _$ImageResultModelFromJson(Map<String, dynamic> json) {
  return ImageResultModel(
    lastBuildDate: json['lastBuildDate'] as String,
    total: json['total'] as int,
    start: json['start'] as int,
    display: json['display'] as int,
    items: (json['items'] as List<dynamic>)
        .map((e) => ResultSubItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ImageResultModelToJson(ImageResultModel instance) =>
    <String, dynamic>{
      'lastBuildDate': instance.lastBuildDate,
      'total': instance.total,
      'start': instance.start,
      'display': instance.display,
      'items': instance.items,
    };

ResultSubItemModel _$ResultSubItemModelFromJson(Map<String, dynamic> json) {
  return ResultSubItemModel(
    title: json['title'] as String,
    link: json['link'] as String,
    thumbnail: json['thumbnail'] as String,
    sizeheight: json['sizeheight'] as String,
    sizewidth: json['sizewidth'] as String,
  );
}

Map<String, dynamic> _$ResultSubItemModelToJson(ResultSubItemModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'link': instance.link,
      'thumbnail': instance.thumbnail,
      'sizeheight': instance.sizeheight,
      'sizewidth': instance.sizewidth,
    };
