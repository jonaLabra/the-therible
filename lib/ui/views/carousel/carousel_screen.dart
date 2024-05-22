import 'package:el_terrible/ui/common/app_colors.dart';
import 'package:el_terrible/ui/common/app_constants.dart';
import 'package:el_terrible/ui/common/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselImages extends StatefulWidget {
  const CarouselImages({super.key});

  @override
  State<CarouselImages> createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    '/images/logo_terrible.png',
    '/images/banner_terrible.jpeg',
    '/images/mezcal.jpeg',
    '/images/logo_terrible.png',
    '/images/banner_terrible.jpeg',
    '/images/mezcal.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => mobileScreen(),
      desktop: (_) => desktopScreen(),
    );
  }

  Widget mobileScreen() => Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                  flex: 6,
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      child: carouselWidget(false)
                          .animate()
                          .slideY(duration: 2000.ms, curve: Curves.easeInBack)
                          .fadeIn())),
              Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: kdDesktopMaxContentHeight,
                    child: Column(
                      children: [
                        Flexible(
                            child: Text(
                          'Sunt sit pariatur ut nisi adipisicing deserunt proident ex nostrud. Qui ut dolor adipisicing esse ex est ad elit qui eiusmod aute qui enim. Ipsum dolore nisi aliquip excepteur. Eu nisi laborum exercitation do commodo adipisicing aute sint irure nostrud. Anim pariatur amet proident deserunt ea consequat et incididunt.',
                          textAlign: TextAlign.center,
                          style: ktsBodyLarge.copyWith(
                              fontWeight: FontWeight.w600),
                        )
                                .animate()
                                .shimmer(
                                    duration: 1600.ms,
                                    color: kcSubTitleGradientLeft)
                                .animate()
                                .flip()
                                .slide()),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );

  Widget desktopScreen() => Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: [
              Expanded(
                  flex: 6,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: carouselWidget(true)
                        .animate()
                        .slideY(duration: 2000.ms, curve: Curves.easeInBack)
                        .fadeIn(),
                  )),
              Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: kdDesktopMaxContentHeight,
                    child: Column(
                      children: [
                        Flexible(
                            child: Text(
                          'Sunt sit pariatur ut nisi adipisicing deserunt proident ex nostrud. Qui ut dolor adipisicing esse ex est ad elit qui eiusmod aute qui enim. Ipsum dolore nisi aliquip excepteur. Eu nisi laborum exercitation do commodo adipisicing aute sint irure nostrud. Anim pariatur amet proident deserunt ea consequat et incididunt.',
                          textAlign: TextAlign.center,
                          style: ktsBodyLarge.copyWith(
                              fontWeight: FontWeight.w600),
                        )
                                .animate()
                                .shimmer(
                                    duration: 1600.ms,
                                    color: kcSubTitleGradientLeft)
                                .animate()
                                .flip()
                                .slide()),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );

  Widget carouselWidget(bool isDesktop) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
              disableGesture: true,
              carouselController: controller,
              itemCount: urlImages.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = urlImages[index];
                return buildImage(urlImage, index, isDesktop);
              },
              options: CarouselOptions(
                  height: isDesktop
                      ? kdDesktopMaxContentHeight * 0.7
                      : kdDesktopMaxContentHeight * 0.5,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  aspectRatio: 2.0,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index))),
          const SizedBox(height: 12),
          buildIndicator()
        ],
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
            dotWidth: 15, activeDotColor: Colors.blue),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String img, int index, bool isDesktop) => Container(
      height: kdDesktopMaxContentHeight * 0.5,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.white),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
                height: kdDesktopMaxContentHeight * 0.5,
                width: kdDesktopMaxContentWidth,
              )),
          Positioned(
              top: 0,
              child: Container(
                width: kdDesktopMaxContentWidth,
                height: isDesktop ? 50 : 25,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        spreadRadius: 0,
                      )
                    ]),
                child: Text(
                  '\t Jesus Martinez Domiguez (GOGOY)',
                  style: TextStyle(
                      fontSize: isDesktop ? 25 : 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )),
          Positioned(
              bottom: 0,
              child: Container(
                width: kdDesktopMaxContentWidth,
                height: isDesktop ? 50 : 25,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        spreadRadius: 0,
                      )
                    ]),
                child: const Text(
                    'No ps pinche mezcal esta poca madre le pegue a mi mama y no me acuerdo'),
              ))
        ],
      ),
    );
