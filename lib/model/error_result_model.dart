import 'package:json_annotation/json_annotation.dart';

part 'error_result_model.g.dart';

@JsonSerializable()
class ErrorResultModel {
  ErrorResultModel({
    required this.errorMessage,
    required this.errorCode,
  });

  String errorMessage;
  String errorCode;


  factory ErrorResultModel.fromJson(Map<String, dynamic> json) => _$ErrorResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResultModelToJson(this);
}
