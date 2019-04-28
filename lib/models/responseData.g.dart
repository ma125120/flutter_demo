
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) {
  return ResponseData()
    ..code = json['code'] as String
    ..status = json['status'] as bool
    ..msg = json['msg'] as String
    ..data = json['data'] as dynamic;
}

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) => <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data
    };
