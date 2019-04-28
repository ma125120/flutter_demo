import 'package:json_annotation/json_annotation.dart';

part 'homeTab.g.dart';
@JsonSerializable()
class HomeTab {
    HomeTab();

    num id;
    String name;
    
    factory HomeTab.fromJson(Map<String,dynamic> json) => _$HomeTabFromJson(json);
    Map<String, dynamic> toJson() => _$HomeTabToJson(this);
}