import 'package:ask_city_app/app/modules/home/views/screens/home_screen.dart';
import 'package:ask_city_app/app/modules/splash/splash_screen.dart';
import 'package:ask_city_app/app/routes/pages.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ask Cit App',
      // home: HomeScreen(),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
    );
  }
}
