import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive(
      {super.key,
      required this.mobile,
      required this.desktop,
      required this.table});
  final Widget mobile;
  final Widget desktop;
  final Widget table;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
  static bool isTable(BuildContext context) =>
      MediaQuery.of(context).size.width < 1200;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1200) {
        return desktop;
      } else if (constraints.maxWidth >= 600) {
        return mobile;
      } else {
        return table;
      }
    });
  }
}
