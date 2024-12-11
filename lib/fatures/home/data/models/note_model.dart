import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_model.g.dart';

@JsonSerializable()
class NoteModel {
  final String title;
  final String? content;
  int? color = Colors.green.value;
  final String id;

  NoteModel({required this.title, this.content, this.color, required this.id});

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);
}
