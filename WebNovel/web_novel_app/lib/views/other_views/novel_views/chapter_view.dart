import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_novel_app/constants/colors.dart';


import '../../../services/novel_services/novel_bloc.dart/chapter_bloc/chapter_bloc.dart';

import '../../../services/novel_services/novel_controllers/novel_controller/chapters_controller/chapter_content_controller.dart';
import '../../../services/novel_services/novel_services.dart';


class ChapterView extends StatefulWidget {
  const ChapterView({super.key});

  @override
  State<ChapterView> createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView> {
  
  @override
  Widget build(BuildContext context) {
    final chapterId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          defaultAppBar()
        ],
        body: MultiBlocProvider(
          providers: [
            BlocProvider<ChapterBloc>(
                create: ((context) => ChapterBloc(NovelServices()))),
          ],
          child: ChapterContentController(chapterId: chapterId,)),
      ),
    );
  }

  SliverAppBar defaultAppBar() => SliverAppBar(
        floating: true,
        snap: true,
        elevation: 0,
        centerTitle: true,
        title: const Icon(FontAwesomeIcons.book, size: 45,),
        backgroundColor: darkBlue.withOpacity(0.5),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: black,
                  size: 30,
                ),
                onPressed: () => Navigator.pop(context));
          },
        ),
      );

  
}
