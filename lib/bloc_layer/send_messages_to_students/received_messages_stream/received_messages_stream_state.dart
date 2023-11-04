part of 'received_messages_stream_bloc.dart';

@immutable
abstract class ReceivedMessagesStreamState {
  final List<dynamic> messageFromOther;

  const ReceivedMessagesStreamState({required this.messageFromOther});
}

class ReceivedMessagesStreamInitial extends ReceivedMessagesStreamState {
  const ReceivedMessagesStreamInitial({required super.messageFromOther});
}

class MessageReceivedSuccessfully extends ReceivedMessagesStreamState{
  const MessageReceivedSuccessfully({required super.messageFromOther});
}

class MessageReceivedError extends ReceivedMessagesStreamState{
  const MessageReceivedError({required super.messageFromOther});
}
