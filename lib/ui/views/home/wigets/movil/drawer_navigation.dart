import 'package:el_terrible/ui/common/app_colors.dart';
import 'package:el_terrible/ui/widgets/mouse_transforms/scale_on_hover.dart';
import 'package:flutter/material.dart';

class DrawerNavigationMenu extends StatelessWidget {
  const DrawerNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      )),
      backgroundColor: kcBackgroundColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [_buildMenuItems(context)],
        ),
      ),
    );
  }
}

Widget _buildMenuItems(
  BuildContext context,
) =>
    Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(children: [
          ListTile(
              title: ScaleOnHover(
                builder: (isHovered) => Text(
                  'Nostros',
                  style: TextStyle(
                      fontSize: 20,
                      color: isHovered ? kcPrimaryColor : Colors.white),
                ),
              ),
              onTap: () => null),
          const Divider(),
          ListTile(
              title: ScaleOnHover(
                builder: (isHovered) => Text(
                  'Nuestros Mezcales',
                  style: TextStyle(
                      fontSize: 20,
                      color: isHovered ? kcPrimaryColor : Colors.white),
                ),
              ),
              onTap: () => null),
          const Divider(),
          ListTile(
              title: ScaleOnHover(
                builder: (isHovered) => Text(
                  'Cocteles',
                  style: TextStyle(
                      fontSize: 20,
                      color: isHovered ? kcPrimaryColor : Colors.white),
                ),
              ),
              onTap: () => null),
          const Divider(),
          ListTile(
              title: ScaleOnHover(
                builder: (isHovered) => Text(
                  'Comprar',
                  style: TextStyle(
                      fontSize: 20,
                      color: isHovered ? kcPrimaryColor : Colors.white),
                ),
              ),
              onTap: () => null)
        ]));
