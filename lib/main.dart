import 'package:flutter/material.dart';
import 'package:skeleton_demo/pages/home_page.dart';
import 'package:skeleton_demo/pages/skeleton_demo_page.dart';
import 'package:skeleton_demo/pages/carousel_demo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'skeleton Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 196, 17, 166),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/skeleton': (context) => const SkeletonDemoPage(),
        '/carousel': (context) => const CarouselDemoPage(),
      },
    );
  }
}
