import 'package:el_terrible/ui/common/app_colors.dart';
import 'package:el_terrible/ui/common/ui_helpers.dart';
import 'package:el_terrible/ui/widgets/mouse_transforms/scale_on_hover.dart';
import 'package:flutter/material.dart';

List<Widget> get navBar => [
      ScaleOnHover(builder: (bool isHovered) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Nostros',
            style: TextStyle(
                fontSize: 20, color: isHovered ? kcPrimaryColor : Colors.white),
          ),
        );
      }),
      horizontalSpaceMedium,
      ScaleOnHover(builder: (bool isHovered) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Nuestros Mezcales',
            style: TextStyle(
                fontSize: 20, color: isHovered ? kcPrimaryColor : Colors.white),
          ),
        );
      }),
      horizontalSpaceMedium,
      ScaleOnHover(builder: (bool isHovered) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Cocteles',
            style: TextStyle(
                fontSize: 20, color: isHovered ? kcPrimaryColor : Colors.white),
          ),
        );
      }),
      horizontalSpaceMedium,
      ScaleOnHover(builder: (bool isHovered) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Comprar',
            style: TextStyle(
                fontSize: 20, color: isHovered ? kcPrimaryColor : Colors.white),
          ),
        );
      }),
    ];
