import 'package:json_annotation/json_annotation.dart';

part 'responseData.g.dart';
@JsonSerializable()
class ResponseData {
    ResponseData();

    String code;
    bool status;
    String msg;
    dynamic data;

    factory ResponseData.fromJson(Map<String,dynamic> json) => _$ResponseDataFromJson(json);
    Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}