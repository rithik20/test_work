part of 'delete_messages_cubit.dart';

@immutable
abstract class DeleteMessagesState extends Equatable{}

class DeleteMessagesInitial extends DeleteMessagesState {
  @override
  List<Object?> get props => [];
}

class MessageDeleted extends DeleteMessagesState{
  @override
  List<Object?> get props => [];
}

class MessageDeleteDiscard extends DeleteMessagesState{
  @override
  List<Object?> get props => [];
}

class MessageDeleteError extends DeleteMessagesState{
  @override
  List<Object?> get props => [];
}
