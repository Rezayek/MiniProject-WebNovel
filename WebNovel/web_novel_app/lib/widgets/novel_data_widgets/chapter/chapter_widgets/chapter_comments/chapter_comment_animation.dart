import 'dart:math';

import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class ChapterCommentAnimation extends StatefulWidget {
  const ChapterCommentAnimation({super.key});

  @override
  State<ChapterCommentAnimation> createState() =>
      _ChapterCommentAnimationState();
}

class _ChapterCommentAnimationState extends State<ChapterCommentAnimation>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers = List.generate(
      6,
      (index) => AnimationController(
            duration: Duration(seconds: Random().nextInt(4) + 3),
            vsync: this,
          )..repeat(reverse: true));

  late final List<Animation<double>> _animations = List.generate(
      6,
      (index) => CurvedAnimation(
            parent: _controllers[index],
            curve: Curves.easeIn,
          ));

  @override
  void dispose() {
    for (var element in _controllers) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 6 ,itemBuilder: (context, index) => commentShadow(index),);
  }

  Widget commentShadow(int index) => FadeTransition(
    opacity: _animations[index],
    child: SizedBox(
          height: 150,
          width: 300,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 35,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(60)
                      ),
                    ),
                    Container(
                      height: 20,
                      margin: const EdgeInsets.only(left: 5),
                      width: (Random().nextDouble() * 130) + 85,
                      decoration: BoxDecoration(
                        color: black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: (Random().nextDouble() * 70) + 40,
                margin: const EdgeInsets.only(left: 5, right: 5),
                width: 280,
                decoration: BoxDecoration(
                  color: black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10)
                ),
              )
            ],
          ),
        ),
  );
}
