part of 'like_messages_cubit.dart';

@immutable
abstract class LikeMessagesState {
  final int likesCount;
  final int messageIndex;
  const LikeMessagesState({required this.likesCount, required this.messageIndex});
}

class LikeMessagesInitial extends LikeMessagesState {
  const LikeMessagesInitial({required super.likesCount, required super.messageIndex});
}

class MessageLiked extends LikeMessagesState{
  const MessageLiked({required super.likesCount, required super.messageIndex});
}
