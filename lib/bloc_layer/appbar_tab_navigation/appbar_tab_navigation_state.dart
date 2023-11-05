part of 'appbar_tab_navigation_cubit.dart';

@immutable
abstract class AppbarTabNavigationState extends Equatable {
  final Widget appbarTab;
  final int index;

  const AppbarTabNavigationState(
      {required this.appbarTab, required this.index});
}

class AppbarTabNavigationInitial extends AppbarTabNavigationState {
  const AppbarTabNavigationInitial(
      {required super.appbarTab, required super.index});

  @override
  List<Object?> get props => [appbarTab, index];
}

class AnnouncementSessionsTab extends AppbarTabNavigationState {
  const AnnouncementSessionsTab(
      {required super.appbarTab, required super.index});

  @override
  List<Object?> get props => [appbarTab, index];
}

class NotesSessionsTab extends AppbarTabNavigationState {
  const NotesSessionsTab({required super.appbarTab, required super.index});

  @override
  List<Object?> get props => [appbarTab, index];
}
