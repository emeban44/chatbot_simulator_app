// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      id: json['id'] as String,
      lastMessage: json['last_message'] as String,
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
      topic: json['topic'] as String,
      modifiedAt: (json['modified_at'] as num).toInt(),
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'last_message': instance.lastMessage,
      'members': instance.members,
      'topic': instance.topic,
      'modified_at': instance.modifiedAt,
    };
