import 'package:class_alert/bloc_layer/appbar_tab_navigation/appbar_tab_navigation_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test("Appbar Navigation Test", () {

    final AppbarTabNavigationCubit appbarTabNavigationCubit = AppbarTabNavigationCubit();

    expect(appbarTabNavigationCubit.state.index, 0);//passed

    appbarTabNavigationCubit.navigateToNotesTab();

    expect(appbarTabNavigationCubit.state.index, 1);//passed

    appbarTabNavigationCubit.navigateToAnnouncementTab();

    expect(appbarTabNavigationCubit.state.index, 0);//passed
  });
}