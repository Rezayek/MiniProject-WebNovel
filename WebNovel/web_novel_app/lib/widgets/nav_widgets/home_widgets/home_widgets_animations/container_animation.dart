import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class ContainerAnimation extends StatefulWidget {
  final double hieght;
  final double width;
  final List<double> margins;
  const ContainerAnimation({Key? key, required this.hieght, required this.width, required this.margins})
      : super(key: key);

  @override
  State<ContainerAnimation> createState() => _ContainerAnimationState();
}

class _ContainerAnimationState extends State<ContainerAnimation>
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
    return Center(
      child: SafeArea(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
              margin: EdgeInsets.only(
                  top: widget.margins[0],
                  bottom: widget.margins[1]),
              height: widget.hieght,
              width: widget.width,
              decoration: BoxDecoration(
                  color: black.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(15))),
        ),
      ),
    );
  }
}
