import 'package:json_annotation/json_annotation.dart';

part 'note_model.g.dart';

@JsonSerializable()
class NoteModel {
  final String title;
  final String? content;
  final int? color;

  NoteModel( {required this.title,  this.content, this.color});

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);
}
