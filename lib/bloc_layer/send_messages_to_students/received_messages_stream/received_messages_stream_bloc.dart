import 'package:bloc/bloc.dart';
import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/data_layer/local_database/send_messages/send_messages_to_students.dart';
import 'package:flutter/material.dart';

part 'received_messages_stream_event.dart';

part 'received_messages_stream_state.dart';

class ReceivedMessagesStreamBloc
    extends Bloc<ReceivedMessagesStreamEvent, ReceivedMessagesStreamState> {
  ReceivedMessagesStreamBloc()
      : super(const ReceivedMessagesStreamInitial(messageFromOther: [])) {
    on<ReceivedMessage>((event, emit) async {
      try {
        await emit.forEach(getIt<HiveMessageStreamBox>().chatController.stream,
            onData: (data) {
          return MessageReceivedSuccessfully(messageFromOther: data);
        });
      } catch (_) {
        emit(const MessageReceivedError(messageFromOther: []));
      }
    });
  }
}
