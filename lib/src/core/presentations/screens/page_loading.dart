import 'package:flutter/material.dart';
import 'package:flutter_application_1/generates/assets.gen.dart';
import 'package:flutter_application_1/src/core/presentations/screens/page_started.dart';

import '../../domains/configs/theme/app_colors.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkColorSystem,
      body: Center(
        child: Assets.svg.logo.svg(),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const StartedPage(),
      ),
    );
  }
}
