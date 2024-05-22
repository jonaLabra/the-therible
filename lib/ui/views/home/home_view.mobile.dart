import 'package:el_terrible/ui/common/app_colors.dart';
import 'package:el_terrible/ui/common/app_constants.dart';
import 'package:el_terrible/ui/common/ui_helpers.dart';
import 'package:el_terrible/ui/views/carousel/carousel_screen.dart';
import 'package:el_terrible/ui/views/home/wigets/home_image.dart';
import 'package:el_terrible/ui/views/home/wigets/home_subtitle.dart';
import 'package:el_terrible/ui/views/home/wigets/home_title.dart';
import 'package:el_terrible/ui/views/home/wigets/movil/drawer_navigation.dart';
import 'package:el_terrible/ui/views/orders/orders_screen.dart';
import 'package:el_terrible/ui/widgets/common/terrible_icon.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  HomeViewMobile({super.key});
  final ScrollController _controller =
      ScrollController(initialScrollOffset: 0.0);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
        backgroundColor: kcBackgroundColor,
        drawer: const DrawerNavigationMenu(),
        body: NestedScrollView(
            scrollDirection: Axis.vertical,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverOverlapAbsorber(
                    sliver: const SliverSafeArea(
                        top: false,
                        sliver: SliverAppBar(
                          pinned: true,
                          floating: true,
                          snap: true,
                          stretch: true,
                          expandedHeight: 0,
                          backgroundColor: kcBackgroundColor,
                          title: TerribleIcon(),
                          centerTitle: true,
                        )),
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context))
              ];
            },
            body: SingleChildScrollView(
              controller: _controller,
              child: Center(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(left: 60, right: 60, top: 10),
                child: PageView(
                  scrollDirection: Axis.vertical,
                  children: [
                    firScreen(),
                    const CarouselImages(),
                    const Orders()
                  ],
                ),
              )),
            )));
  }

  Widget firScreen() => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Left side of screen
          Expanded(
              child: SizedBox(
            height: kdDesktopMaxContentHeight,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const HomeTitle(),
                verticalSpaceSmall,
                HomeSubtitle(),
              ],
            ),
          )),
          const Expanded(
              child: SizedBox(
                  height: kdDesktopMaxContentHeight, child: HomeImage()))
        ],
      );
}
