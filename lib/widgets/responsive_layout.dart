import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  const ResponsiveLayout(
      {super.key, required this.mobile, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < AppSizes.mobileWidth) {
        return mobile;
      }
      return desktop;
    });
  }
}
