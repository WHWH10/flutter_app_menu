import 'package:json_annotation/json_annotation.dart';

part 'image_result_model.g.dart';

@JsonSerializable()
class ImageResultModel {
  ImageResultModel({
    required this.lastBuildDate,
    required this.total,
    required this.start,
    required this.display,
    required this.items,
  });

  String lastBuildDate;
  int total;
  int start;
  int display;
  List<ResultSubItemModel> items;

  factory ImageResultModel.fromJson(Map<String, dynamic> json) => _$ImageResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResultModelToJson(this);
}

@JsonSerializable()
class ResultSubItemModel {
  ResultSubItemModel({
    required this.title,
    required this.link,
    required this.thumbnail,
    required this.sizeheight,
    required this.sizewidth,
  });

  String title;
  String link;
  String thumbnail;
  String sizeheight;
  String sizewidth;

  factory ResultSubItemModel.fromJson(Map<String, dynamic> json) => _$ResultSubItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultSubItemModelToJson(this);
}
