import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/home_widgets_animations/default_container.dart';

class NovelTagAnimation extends StatefulWidget {
  final bool isHoizontal;
  final double height;
  const NovelTagAnimation({Key? key, required this.isHoizontal, required this.height}) : super(key: key);

  @override
  State<NovelTagAnimation> createState() => _NovelTagAnimationState();
}

class _NovelTagAnimationState extends State<NovelTagAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        padding: EdgeInsets.only(
        top: 1.5.h,
        bottom: 1.5.h,
        ),
        height: widget.height,
        width: 100.w,
        child: ListView.builder(
          scrollDirection: widget.isHoizontal?Axis.horizontal : Axis.vertical,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Container(
            height: 13.h,
            width: 80.w,
            margin: EdgeInsets.only(
                left: 5.w,
                right: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DefaultContainer(
                    height: 18.h,
                    width: 25.w),
                Padding(
                  padding: EdgeInsets.only(
                      left: 5.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultContainer(
                          height: 2.h,
                          width: 40.w),
                      DefaultContainer(
                          height: 3.h,
                          width: 50.w),
                      DefaultContainer(
                          height: 2.h,
                          width: 30.w),
                    ],
                  ),
                )
              ],
            ),
          );
          },
          
        ),
      ),
    );
  }
}
