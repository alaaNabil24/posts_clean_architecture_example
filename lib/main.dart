import 'package:flutter/material.dart';
import 'package:posts/presentation/pages/main/main_page.dart';
import 'package:posts/presentation/pages/posts/posts_page.dart';
import 'package:posts/shared/di/di.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home:  MainPage(),
    );
  }
}


