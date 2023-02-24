import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';

class GiftPowerContainerAnimation extends StatefulWidget {
  const GiftPowerContainerAnimation({super.key});

  @override
  State<GiftPowerContainerAnimation> createState() => _GiftPowerContainerAnimationState();
}

class _GiftPowerContainerAnimationState extends State<GiftPowerContainerAnimation> with TickerProviderStateMixin {
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
    final width = 95.w;
    final height = 8.h;
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: Container(
        margin: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h,),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          ),
        )
      ),
    );
  }
}