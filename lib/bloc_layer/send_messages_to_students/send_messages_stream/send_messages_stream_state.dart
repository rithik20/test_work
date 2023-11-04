part of 'send_messages_stream_bloc.dart';

@immutable
abstract class SendMessagesStreamState {}

class SendMessagesStreamInitial extends SendMessagesStreamState {}

class MessageSendSuccess extends SendMessagesStreamState {}

class MessageSendError extends SendMessagesStreamState {}
