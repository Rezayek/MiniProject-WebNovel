
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/novels_exceptions.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/carousel/carousel.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/home_widgets_animations/container_animation.dart';

import '../../novel_bloc.dart/carousel_bloc/carousel_bloc.dart';
import '../../novel_bloc.dart/carousel_bloc/carousel_event.dart';
import '../../novel_bloc.dart/carousel_bloc/carousel_state.dart';



class CarouselController extends StatefulWidget {
  const CarouselController({Key? key}) : super(key: key);

  @override
  State<CarouselController> createState() => _CarouselControllerState();
}

class _CarouselControllerState extends State<CarouselController> {
  @override
  void initState() {
    context.read<CarouselBloc>().add(NovelEventGetCarouselNovels());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselBloc, CarouselState>(
      builder: (context, state) {
        if (state is NovelStateGetCarouselNovels) {
          if (state.exception is NovelExceptionCantGetNovels) {
            return Container();
          } else if (state.exception is NovelExceptionGeneric) {
            return Container();
          } else {
            return Carousel(novels: state.novels);
          }
        } else {
          return ContainerAnimation(hieght: 32.h, margins: [7.h, 9.h], width: 96.w,);
        }
      },
    );
  }
}
