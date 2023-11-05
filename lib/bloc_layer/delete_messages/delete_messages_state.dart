part of 'delete_messages_cubit.dart';

@immutable
abstract class DeleteMessagesState {}

class DeleteMessagesInitial extends DeleteMessagesState {}

class MessageDeleted extends DeleteMessagesState{}

class MessageDeleteDiscard extends DeleteMessagesState{}

class MessageDeleteError extends DeleteMessagesState{}
