import 'package:accounts_pro_task2/desktopBody.dart';
import 'package:accounts_pro_task2/mobileBody.dart';
import 'package:accounts_pro_task2/responsive/responsive.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:ResponsiveLayout(mobileBody: MobileBody(), desktopBody: DesktopBody())
    );
  }
}
