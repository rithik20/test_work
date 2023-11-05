part of 'send_messages_stream_bloc.dart';

@immutable
abstract class SendMessagesStreamEvent {}

class SendMessage extends SendMessagesStreamEvent{
  final String message;
  final List<dynamic>? attachment;
  SendMessage({required this.message, required this.attachment});
}
