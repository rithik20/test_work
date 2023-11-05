import 'package:bloc/bloc.dart';
import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/data_layer/local_database/send_messages/send_messages_to_students.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'send_messages_stream_event.dart';

part 'send_messages_stream_state.dart';

class SendMessagesStreamBloc
    extends Bloc<SendMessagesStreamEvent, SendMessagesStreamState> {
  SendMessagesStreamBloc()
      : super(SendMessagesStreamInitial()) {
    on<SendMessage>((event, emit) async {
      try {
        if(event.attachment == null) {
          await getIt<SendMessagesToStudentsStreamDataLayer>()
              .sendMessagesToUser(event.message);
          emit(MessageSendSuccess());
        }else{
          await getIt<SendMessagesToStudentsStreamDataLayer>()
              .sendMessagesToUser(event.message, event.attachment);
          emit(MessageSendSuccess());
        }
      } catch (_) {
        emit(MessageSendError());
      }
    });
  }
}
