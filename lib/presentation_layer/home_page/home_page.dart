import 'package:class_alert/bloc_layer/appbar_tab_navigation/appbar_tab_navigation_cubit.dart';
import 'package:class_alert/presentation_layer/create_announcement_page/widgets/announcement_sessions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120.0,
        automaticallyImplyLeading: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: (){
                      ///Navigate to Previous Widget
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.purple,
                    )),
                const Text(
                  "Announcement",
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const AnnouncementSessions(),
          ],
        ),
      ),
      body: BlocBuilder<AppbarTabNavigationCubit, AppbarTabNavigationState>(
          builder: (context, appBarNavigation) {
            return appBarNavigation.appbarTab;
          }),
    );
  }
}
