import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/recomendation/tag_recomendation.dart';

class RecomendationContainer extends StatefulWidget {
  final Map<String, List<NovelModel>> novels;

  const RecomendationContainer({Key? key, required this.novels})
      : super(key: key);

  @override
  State<RecomendationContainer> createState() => _RecomendationContainerState();
}

class _RecomendationContainerState extends State<RecomendationContainer> {
  List<TagRecomendation> _tagRecomendation = [];
  @override
  void initState() {
    list();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _tagRecomendation,
      ),
    );
  }

  void list() {
    widget.novels.forEach((key, value) {
      _tagRecomendation.add(TagRecomendation(tag: key, novels: value));
    });
  }
}
