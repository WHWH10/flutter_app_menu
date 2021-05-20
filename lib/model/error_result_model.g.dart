// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResultModel _$ErrorResultModelFromJson(Map<String, dynamic> json) {
  return ErrorResultModel(
    errorMessage: json['errorMessage'] as String,
    errorCode: json['errorCode'] as String,
  );
}

Map<String, dynamic> _$ErrorResultModelToJson(ErrorResultModel instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
    };
