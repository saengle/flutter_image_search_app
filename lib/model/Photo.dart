import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'Photo.g.dart';

@JsonSerializable()
class Photo extends Equatable {
  final int id;
  final String tags;
  final String previewURL;

  Photo({required this.id, required this.tags, required this.previewURL});

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  //id 기준으로 같으면 같다고 알려주기 (이쿼터블 이용)
  @override
  List<Object?> get props => [id];
}
