import 'package:json_annotation/json_annotation.dart';

part 'chat_message.g.dart';

@JsonSerializable()
class ChatMessage {
  ChatMessage({
    required this.id,
    required this.lastMessage,
    required this.sender,
    required this.modifiedAt,
  });

  // From JSON
  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'message')
  final String lastMessage;

  @JsonKey(name: 'sender')
  final String sender;

  @JsonKey(name: 'modified_at')
  final int modifiedAt;

  bool get isCurrentUserSender {
    return sender == 'You';
  }
}
