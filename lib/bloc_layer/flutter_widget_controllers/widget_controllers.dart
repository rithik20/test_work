import 'package:class_alert/bloc_layer/service_locators/get_it_service_locators.dart';
import 'package:flutter/material.dart';

class TextEditingControllers{
  TextEditingController sendMessage = TextEditingController();
}

class ScrollControllers{
  ScrollController chatScrollController = ScrollController();
}

void widgetControllers(){
  getIt.registerSingleton(TextEditingControllers());
  getIt.registerSingleton(ScrollControllers());
}