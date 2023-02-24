import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/new_novels/new_novel_container.dart';
import 'package:web_novel_app/widgets/novel_widgets/novel_image.dart';

class NewNovelsContainer extends StatefulWidget {
  final List<NovelModel> novels;
  const NewNovelsContainer({Key? key, required this.novels}) : super(key: key);

  @override
  State<NewNovelsContainer> createState() => _NewNovelsContainerState();
}

class _NewNovelsContainerState extends State<NewNovelsContainer> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 45.h,
        width: 97.w,
        margin: EdgeInsets.only(bottom: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: black.withOpacity(0.6), offset: const Offset(2, 2), blurRadius: 3)],
            gradient: const LinearGradient(colors: [
              lightBlue,
              lightBlue,
              white,
              lighGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight  
              )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  height: 14.h,
                  width: 90.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.novels.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: NovelImage(
                              url: widget.novels[index].url,
                              height: 1.2.h,
                              width: 20.w,
                              opacity: 0.3),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            NewNovelContainer(novel: widget.novels[_currentIndex], height: 29.5.h, width: 90.w)
          ],
        ),
      ),
    );
  }
}
