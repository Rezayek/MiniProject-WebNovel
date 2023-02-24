import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class DefaultView extends StatefulWidget {
  const DefaultView({Key? key}) : super(key: key);

  @override
  State<DefaultView> createState() => _DefaultViewState();
}

class _DefaultViewState extends State<DefaultView> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1500),
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children:[
          FadeTransition(
            opacity: _animation,
            child: Container(
              height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    white,
                    white,
                    darkPurple.withOpacity(0.7),
                    lightPurple.withOpacity(0.7),
                    black
                  ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                ),
            ),
          ),
           Container(
            height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: white.withOpacity(0.2)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 30.h),
                    child: Container(
                      height: 15.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/banner.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow:  [BoxShadow(blurRadius: 1,offset: const Offset(1, 1), color: black.withOpacity(0.7))]
                      ),
                    ),
                  ),
                  const CircularProgressIndicator(
                    color: lightBlue,
                  )
                ],
              ),
          ),
        ]
      ),
    );
  }
}