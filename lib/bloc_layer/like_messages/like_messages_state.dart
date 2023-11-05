part of 'like_messages_cubit.dart';

@immutable
abstract class LikeMessagesState extends Equatable {
  final int likesCount;
  final int messageIndex;

  const LikeMessagesState(
      {required this.likesCount, required this.messageIndex});
}

class LikeMessagesInitial extends LikeMessagesState {
  const LikeMessagesInitial(
      {required super.likesCount, required super.messageIndex});

  @override
  List<Object?> get props => [likesCount, messageIndex];
}

class MessageLiked extends LikeMessagesState {
  const MessageLiked({required super.likesCount, required super.messageIndex});

  @override
  List<Object?> get props => [likesCount, messageIndex];
}
