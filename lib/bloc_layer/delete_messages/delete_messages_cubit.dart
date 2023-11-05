import 'package:bloc/bloc.dart';
import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:class_alert/data_layer/local_database/delete_messages/delete_messages.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

part 'delete_messages_state.dart';

class DeleteMessagesCubit extends Cubit<DeleteMessagesState> {
  DeleteMessagesCubit() : super(DeleteMessagesInitial());

  Future<void> deleteTheMessage(int index) async {
    try {
      int result = await getIt<DeleteMessageDatabaseDataLayer>()
          .deleteThisMessage(index);

      if (result == 0) {
        emit(MessageDeleted());
      } else {
        emit(MessageDeleteError());
      }
    } catch (_) {
      emit(MessageDeleteError());
    }
  }
}
