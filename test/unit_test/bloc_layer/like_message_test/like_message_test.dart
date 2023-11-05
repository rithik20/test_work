import 'package:class_alert/bloc_layer/like_messages/like_messages_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test("Message Like Cubit Test", () {

    final LikeMessagesCubit likeMessagesCubit = LikeMessagesCubit();

    ///passed
    expect(likeMessagesCubit.count, 0);
    expect(likeMessagesCubit.state.likesCount, 0);
    expect(likeMessagesCubit.state.messageIndex, 0);

    ///passed
    likeMessagesCubit.likeTheMessage(0);
    expect(likeMessagesCubit.count, 1);
    expect(likeMessagesCubit.state.likesCount, 1);
    expect(likeMessagesCubit.state.messageIndex, 0);
  });
}