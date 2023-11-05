part of 'send_messages_stream_bloc.dart';

@immutable
abstract class SendMessagesStreamState extends Equatable{}

class SendMessagesStreamInitial extends SendMessagesStreamState {
  @override
  List<Object?> get props => [];
}

class MessageSendSuccess extends SendMessagesStreamState {
  @override
  List<Object?> get props => [];
}

class MessageSendError extends SendMessagesStreamState {
  @override
  List<Object?> get props => [];
}
