// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      id: json['id'] as String,
      lastMessage: json['message'] as String,
      sender: json['sender'] as String,
      modifiedAt: (json['modified_at'] as num).toInt(),
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.lastMessage,
      'sender': instance.sender,
      'modified_at': instance.modifiedAt,
    };
