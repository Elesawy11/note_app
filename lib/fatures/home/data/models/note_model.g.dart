// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteModel _$NoteModelFromJson(Map<String, dynamic> json) => NoteModel(
      title: json['title'] as String,
      content: json['content'] as String?,
      color: (json['color'] as num?)?.toInt(),
      id: json['id'] as String,
    );

Map<String, dynamic> _$NoteModelToJson(NoteModel instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'color': instance.color,
      'id': instance.id,
    };
