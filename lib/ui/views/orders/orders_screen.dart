import 'package:el_terrible/ui/common/app_colors.dart';
import 'package:el_terrible/ui/common/app_constants.dart';
import 'package:el_terrible/ui/common/ui_helpers.dart';
import 'package:el_terrible/ui/widgets/mouse_transforms/translate_on_hover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => mobileScreen(),
      desktop: (_) => desktopScreen(),
    );
  }

  Widget mobileScreen() => Center(
      child: SizedBox(
          height: kdDesktopMaxContentHeight,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                      color: kcPrimaryColor, fontSize: 30),
                                  children: [
                            TextSpan(text: 'Donde nos encontramos \t'),
                            TextSpan(
                                text: 'Puntos de venta',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ]))
                          .animate()
                          .shimmer(duration: 1600.ms, color: kcPrimaryColor)
                          .animate()
                          .flipH()
                          .slide(),
                      verticalSpaceMedium,
                      googleMap(false).animate().flipV(),
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: kcPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        bannerSocialMedia(false),
                        verticalSpaceSmall,
                        const Text(
                          "COPYRIGHT &COPY 2023 MEZCAL UNIÓN\n PROHIBIDO COMPARTIR O REENVIAR NUESTRO CONTENIDO A MENORES DE EDAD.\nBEBA RESPONSABLEMENTE.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ))
            ],
          )));

  Widget desktopScreen() => Center(
      child: SizedBox(
          height: kdDesktopMaxContentHeight,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                      color: kcPrimaryColor, fontSize: 30),
                                  children: [
                            TextSpan(text: 'Donde nos encontramos \t'),
                            TextSpan(
                                text: 'Puntos de venta',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ]))
                          .animate()
                          .shimmer(duration: 1600.ms, color: kcPrimaryColor)
                          .animate()
                          .flipH()
                          .slide(),
                      verticalSpaceMedium,
                      googleMap(true).animate().flipV(),
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: kcPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        bannerSocialMedia(true),
                        verticalSpaceSmall,
                        const Text(
                          "COPYRIGHT &COPY 2023 MEZCAL UNIÓN\n PROHIBIDO COMPARTIR O REENVIAR NUESTRO CONTENIDO A MENORES DE EDAD.\nBEBA RESPONSABLEMENTE.",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ))
            ],
          )));

  Widget googleMap(bool isDesktop) => SizedBox(
        height: isDesktop
            ? kdDesktopMaxContentHeight * 0.7
            : kdDesktopMaxContentHeight * 0.5,
        width: kdDesktopMaxContentWidth * 0.8,
        child: const GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition:
              CameraPosition(zoom: 12, target: LatLng(18.644616, -99.1618996)),
          myLocationEnabled: true,
          buildingsEnabled: true,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: true,
        ),
      );

  Widget bannerSocialMedia(bool isDesktop) =>
      Row(mainAxisSize: MainAxisSize.min, children: [
        TranslateOnHover(
          builder: (isHovered) => Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                  size: isDesktop ? 30 : 15,
                  weight: isDesktop ? 50 : 15,
                  FontAwesomeIcons.facebook,
                  color: isHovered ? kcFacebook : kcWhite),
              const Text(
                'FACEBOOK',
                style: TextStyle(color: kcWhite, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const VerticalDivider(color: kcWhite, thickness: 2, width: 60),
        TranslateOnHover(
          builder: (isHovered) => Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                size: isDesktop ? 30 : 15,
                weight: isDesktop ? 50 : 25,
                FontAwesomeIcons.instagram,
                color: isHovered ? kcInstagram : kcWhite,
              ),
              const Text(
                'INSTAGRAM',
                style: TextStyle(color: kcWhite, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const VerticalDivider(color: kcWhite, thickness: 2, width: 60),
        TranslateOnHover(
          builder: (isHovered) => Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                size: isDesktop ? 30 : 15,
                weight: isDesktop ? 50 : 25,
                FontAwesomeIcons.tiktok,
                color: isHovered ? kcBlack : kcWhite,
              ),
              const Text(
                'TIK TOK',
                style: TextStyle(color: kcWhite, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ]);
}
