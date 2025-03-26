import 'package:json_annotation/json_annotation.dart';

part 'conversation.g.dart';

@JsonSerializable()
class Conversation {
  Conversation({
    required this.id,
    required this.lastMessage,
    required this.members,
    required this.topic,
    required this.modifiedAt,
  });

  // From JSON
  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$ConversationToJson(this);

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'last_message')
  final String lastMessage;

  @JsonKey(name: 'members')
  final List<String> members;

  @JsonKey(name: 'topic')
  final String topic;

  @JsonKey(name: 'modified_at')
  final int modifiedAt;

  bool get isGroupConversation {
    if (members.length > 1) {
      return true;
    }

    return false;
  }
}
