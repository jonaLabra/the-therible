import 'package:el_terrible/ui/common/app_colors.dart';
import 'package:el_terrible/ui/common/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: getValueForScreenType<CrossAxisAlignment>(
        context: context,
        mobile: CrossAxisAlignment.center,
        desktop: CrossAxisAlignment.start,
      ),
      children: [
        GradientText(
          'THE\nTERRIBLE',
          style: ktsTitleText.copyWith(
            fontSize: getValueForScreenType<double>(
              context: context,
              mobile: 60,
              desktop: 80,
            ),
          ),
          colors: kgTitle,
        )
            .animate()
            .shimmer(duration: 1600.ms, color: kcPrimaryColor)
            .animate()
            .fadeIn(duration: 1600.ms, curve: Curves.easeInBack)
            .slide(),
        GradientText('MEZCAL',
                style: ktsTitleText.copyWith(
                  fontSize: getValueForScreenType<double>(
                    context: context,
                    mobile: 60,
                    desktop: 80,
                  ),
                ),
                colors: kgSubTitle)
            .animate()
            .shimmer(duration: 1600.ms, color: kcPrimaryColor)
            .animate()
            .fadeIn(duration: 1600.ms, curve: Curves.easeInBack)
            .slide()
      ],
    );
  }
}
