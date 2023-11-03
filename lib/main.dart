import 'package:class_alert/presentation_layer/create_announcement_page/create_announcement_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const ClassAlert());
}

class ClassAlert extends StatelessWidget {
  const ClassAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true),
          home: const CreateAnnouncementButtonPage(),
        );
      },
    );
  }
}
