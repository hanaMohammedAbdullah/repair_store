// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_stack_listview_transform/models/Craftsman_model.dart';
import 'package:test_stack_listview_transform/screen_layout.dart';
import 'package:test_stack_listview_transform/screens/profile.dart';

import 'login_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // ignore: empty_constructor_bodies

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      home: LoginScreen(),
    );
  }
}
