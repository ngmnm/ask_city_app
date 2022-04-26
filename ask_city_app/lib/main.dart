import 'package:ask_city_app/app/modules/home/views/screens/home_screen.dart';
import 'package:ask_city_app/app/modules/splash/splash_screen.dart';
import 'package:ask_city_app/app/routes/pages.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ask Cit App',
      theme: ThemeData(
        // Define the default brightness and colors.
        // brightness: Brightness.dark,
        primaryColor: Color(0xFF864ADB),
        accentColor: Colors.white54
      ),
      // home: HomeScreen(),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}
