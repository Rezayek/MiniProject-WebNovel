import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:web_novel_app/constants/colors.dart';

import 'package:web_novel_app/services/novel_services/novel_controllers/home_controllers/power_rank_controller.dart';
import 'package:web_novel_app/services/novel_services/novel_controllers/home_controllers/reader_rank_controller.dart';
import 'package:web_novel_app/services/novel_services/novel_controllers/home_controllers/recomend_controller.dart';
import 'package:web_novel_app/services/novel_services/novel_controllers/home_controllers/weekly_controller.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/label/label.dart';


import '../../../services/novel_services/novel_controllers/home_controllers/carousel_controller.dart';
import '../../../services/novel_services/novel_controllers/home_controllers/new_controller.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          height: 430.h,
          width: 100.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [darkPurple, lighGreen.withOpacity(0.6), lighGreen.withOpacity(0.6), white, black.withOpacity(0.5), black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CarouselController(),
              Label(title: "Weekly", gradiantColors: [lightPurple, lightPurple.withOpacity(0.5), lightPurple.withOpacity(0.1)], margin: [0.5.h, 2.5.h, 3.w], expanded: 0,),
              const WeeklyController(),
              Label(title: "New", gradiantColors: [lightPurple, lightPurple.withOpacity(0.5), lightPurple.withOpacity(0.1)], margin: [0.5.h, 2.5.h, 3.w], expanded: 13.w,),
              const NewController(),
              Label(title: "Ranking", gradiantColors: [lightPurple, lightPurple.withOpacity(0.5), lightPurple.withOpacity(0.1)], margin: [0.5.h, 2.5.h, 3.w], expanded: 0,),
              Padding(
                padding: EdgeInsets.only(left:5.w),
                child: Label(title: "Power", gradiantColors: [lightPurple, lightBlue.withOpacity(0.5), lightBlue.withOpacity(0.1)], margin: [0.25.h, 0, 3.w], expanded: 13.w,),
              ),
              const PowerRankController(),
              Padding(
                padding: EdgeInsets.only(left:5.w),
                child: Label(title: "Readers", gradiantColors: [lightPurple, lightBlue.withOpacity(0.5), lightBlue.withOpacity(0.1)], margin: [0.5.h, 0, 3.w], expanded: 0,),
              ),
              const ReaderRankController(),
              Label(title: "Tags", gradiantColors: [lightPurple, lightPurple.withOpacity(0.5), lightPurple.withOpacity(0.1)], margin: [0.5.h, 2.5.h, 3.w], expanded: 13.w,),
              const RecomendController(),
            ],
          )),
      );
  }
}