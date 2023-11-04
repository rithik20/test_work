part of 'send_messages_stream_bloc.dart';

@immutable
abstract class SendMessagesStreamEvent {}

class SendMessage extends SendMessagesStreamEvent{
  final String message;
  SendMessage({required this.message});
}
