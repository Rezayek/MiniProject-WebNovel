import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/carousel/carousal_item.dart';

class Carousel extends StatefulWidget {
  final List<NovelModel> novels;
  const Carousel({Key? key, required this.novels}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Container(
        margin: EdgeInsets.only(top: 7.h, bottom: 9.h),
        height:32.h,
        width: 96.w,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                darkBlue.withOpacity(0.6),
                lightPurple.withOpacity(0.3),
                lightBlue.withOpacity(0.5)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.6),
                  offset: const Offset(2, 2),
                  blurRadius: 2),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CarouselSlider.builder(
                itemCount: widget.novels.length,
                itemBuilder: (context, index, realIndex) {
                  return CarouselItem(novel: widget.novels[index],);
                },
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 28.h,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              AnimatedSmoothIndicator(
                activeIndex: currentIndex, 
                count: widget.novels.length,
                effect: JumpingDotEffect(
                  dotHeight: 2.h,
                  dotWidth: 2.h,
                  activeDotColor: lightBlue,
                  dotColor: lightBlue.withOpacity(0.5)
                ),
                )
            ],
          ),
        ),
      ),
    ));
  }
}
