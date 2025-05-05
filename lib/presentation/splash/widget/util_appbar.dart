import 'package:flutter/material.dart';

class UtilAppBar extends StatefulWidget {
  const UtilAppBar({super.key});

  @override
  State<UtilAppBar> createState() => _UtilAppBarState();
}

class _UtilAppBarState extends State<UtilAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
