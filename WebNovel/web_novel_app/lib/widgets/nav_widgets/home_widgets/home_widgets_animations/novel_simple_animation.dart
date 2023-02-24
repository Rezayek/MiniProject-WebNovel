import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:web_novel_app/widgets/nav_widgets/home_widgets/home_widgets_animations/default_container.dart';

class NovelSimpleAnimation extends StatefulWidget {
  const NovelSimpleAnimation({Key? key}) : super(key: key);

  @override
  State<NovelSimpleAnimation> createState() => _NovelSimpleAnimationState();
}

class _NovelSimpleAnimationState extends State<NovelSimpleAnimation>
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
        padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h, ),
        height: 30.h,
        width: 100.w ,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              height: 20.h,
              width: 28.w,
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultContainer(
                      height: 17.h,
                      width: 28.w),
                  DefaultContainer(
                      height: 1.5.h,
                      width: 28.w),
                  DefaultContainer(
                      height: 1.5.h,
                      width: 28.w),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
