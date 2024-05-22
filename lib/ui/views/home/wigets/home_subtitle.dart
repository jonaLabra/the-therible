import 'package:el_terrible/ui/common/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';
//import 'package:simple_gradient_text/simple_gradient_text.dart';

// ignore: must_be_immutable
class HomeSubtitle extends StatelessWidget {
  HomeSubtitle({Key? key}) : super(key: key);

  var children = Flexible(
      child: Text(
    'NUESTRO MEZCAL ES 100% ARTESANAL Y SE ELABORA EN OAXACA, UNO DE LOS ESTADOS DE MÉXICO CON MÁS RIQUEZA GASTRONÓMICA, CULTURAL Y ARQUITECTÓNICA.',
    style: ktsBodyLarge.copyWith(fontWeight: FontWeight.w600),
  )
          .animate()
          .shimmer(
              duration: 1600.ms, color: const Color.fromARGB(255, 251, 167, 0))
          .animate()
          .fadeIn(duration: 1600.ms, curve: Curves.easeOutQuad)
          .slide());

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => Row(
        children: [children],
      ),
      desktop: (_) => Row(
        children: [
          children,
        ],
      ),
    );
  }
}
