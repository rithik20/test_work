import 'package:bloc/bloc.dart';
import 'package:class_alert/presentation_layer/announcement_send_page/announcement_send_screen.dart';
import 'package:class_alert/presentation_layer/announcement_send_page/widgets/notes_page/notes_page.dart';
import 'package:flutter/material.dart';

part 'appbar_tab_navigation_state.dart';

class AppbarTabNavigationCubit extends Cubit<AppbarTabNavigationState> {
  AppbarTabNavigationCubit()
      : super(const AppbarTabNavigationInitial(
            appbarTab: AnnouncementMessageSendScreen(), index: 0));

  void navigateToNotesTab() {
    emit(const NotesSessionsTab(appbarTab: StudentNotesPage(), index: 1));
  }

  void navigateToAnnouncementTab() {
    emit(const NotesSessionsTab(appbarTab: AnnouncementMessageSendScreen(), index: 0));
  }
}
