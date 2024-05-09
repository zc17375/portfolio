import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: '微軟雅黑', // 设置全局字体
        brightness: Brightness.dark, // 设置暗模式
      ),
      title: 'e-portfolio',
      home: const HomePage(),
    );
  }
}
