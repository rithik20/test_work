import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'like_messages_state.dart';

class LikeMessagesCubit extends Cubit<LikeMessagesState> {
  LikeMessagesCubit()
      : super(const LikeMessagesInitial(likesCount: 0, messageIndex: 0));

  int count = 0;

  void likeTheMessage(int indexNumber) {
    count++;
    emit(MessageLiked(likesCount: count, messageIndex: indexNumber));
  }

  void countAdjuster(int itemIndex, int selectedItemCurrentCount) {
    if (itemIndex != state.messageIndex) {
      count = selectedItemCurrentCount;
    }
  }
}
