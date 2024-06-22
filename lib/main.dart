import 'package:audio_player/config/theme.dart';
import 'package:audio_player/pages/DemoPage.dart';
import 'package:audio_player/pages/splace_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: darkTheme,
      home: const SplaceScreen(),
      //home: DemoPage(),
    );
  }
}

