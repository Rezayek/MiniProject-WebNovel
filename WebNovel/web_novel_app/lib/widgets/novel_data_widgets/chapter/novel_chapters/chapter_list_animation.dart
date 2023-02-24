import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class ChapterListAnimation extends StatefulWidget {
  final double height;
  final double width;
  const ChapterListAnimation({super.key, required this.height, required this.width});

  @override
  State<ChapterListAnimation> createState() => _ChapterListAnimationState();
}

class _ChapterListAnimationState extends State<ChapterListAnimation> with TickerProviderStateMixin {
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
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            height: widget.height,
            width: widget.width,
          ),
        ),
      ));
  }
}