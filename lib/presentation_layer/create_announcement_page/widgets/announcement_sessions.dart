import 'package:class_alert/bloc_layer/appbar_tab_navigation/appbar_tab_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///This [AnnouncementSessions] widget is for navigating between two sessions
class AnnouncementSessions extends StatelessWidget {
  const AnnouncementSessions({super.key});

  @override
  Widget build(BuildContext context) {
    final appTabBarNavigation =
        BlocProvider.of<AppbarTabNavigationCubit>(context);

    return Material(
        color: Colors.transparent,
        child: BlocBuilder<AppbarTabNavigationCubit, AppbarTabNavigationState>(
          builder: (context, appbarTab) {
            return Row(
              children: [
                TextButton(
                  onPressed: () {
                    appTabBarNavigation.navigateToAnnouncementTab();
                  },
                  child: appbarTab.index == 0
                      ? Container(
                          alignment: Alignment.center,
                          height: 30.0,
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          decoration: const BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0))),
                          child: const Text("Announcement",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        )
                      : const Text("Announcement",
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.w500)),
                ),
                TextButton(
                  onPressed: () {
                    appTabBarNavigation.navigateToNotesTab();
                  },
                  child: appbarTab.index == 1
                      ? Container(
                          alignment: Alignment.center,
                          height: 30.0,
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          decoration: const BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0))),
                          child: const Text("Notes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        )
                      : const Text("Notes",
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.w500)),
                )
              ],
            );
          },
        ));
  }
}
