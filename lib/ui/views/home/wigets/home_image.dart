import 'package:el_terrible/ui/common/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          '/images/banner_terrible.jpeg',
          width: kdDesktopMaxContentWidth * 0.4,
          height: getValueForScreenType<double>(
            context: context,
            mobile: 650,
            desktop: double.infinity,
          ),
          fit: BoxFit.fill,
        ),
      ).animate().slideX(duration: 2000.ms, curve: Curves.easeInBack).fadeIn(),
    );
  }
}
