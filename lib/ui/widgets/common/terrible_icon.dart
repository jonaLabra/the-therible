import 'package:el_terrible/ui/common/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class TerribleIcon extends StatelessWidget {
  const TerribleIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        GradientText(
          'THE TERRIBLE',
          style: ktsTitleText.copyWith(
            fontSize: getValueForScreenType<double>(
              context: context,
              mobile: 8,
              desktop: 12,
            ),
          ),
          colors: const [
            Color.fromARGB(255, 243, 255, 12),
            Color.fromARGB(255, 251, 142, 0)
          ],
        ),
        CircleAvatar(
            radius: 30,
            child: Image.asset(
              height: 100,
              'assets/images/logo_terrible.png',
              fit: BoxFit.fill,
            ))
      ],
    );
  }
}
