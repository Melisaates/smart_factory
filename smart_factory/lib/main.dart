import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_factory/auth/register_screens/add_machine.dart';
import 'package:smart_factory/auth/register_screens/bottomNavigationBar.dart';
import 'package:smart_factory/auth/register_screens/door_model.dart';
import 'package:smart_factory/auth/register_screens/doors.dart';
import 'package:smart_factory/auth/register_screens/feedback_failure.dart';
import 'package:smart_factory/auth/register_screens/machines.dart';
import 'package:smart_factory/auth/register_screens/record_failure.dart';
import 'package:smart_factory/auth/register_screens/worker.dart';
import 'package:smart_factory/auth/register_screens/worker_model.dart';
import 'package:smart_factory/auth/register_screens/feedback_failure.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // routes: {
      // '/': (context) => const Machines(),
      // '/makine_ekleme': (context) => const AddMachine(),
      // '/isci': (context) => const Workers(),
      // '/kapilar': (context) => const Doors()},
      theme: ThemeData(
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color.fromARGB(255, 249, 60, 123),
              onPrimary: Colors.white,
              secondary: Colors.red,
              onSecondary: Colors.red,
              error: Colors.red,
              onError: Colors.red,
              background: Colors.red,
              onBackground: Colors.red,
              surface: Colors.red,
              onSurface: Colors.red)),
      home: MyNavigationBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
