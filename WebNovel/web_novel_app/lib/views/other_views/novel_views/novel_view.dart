import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';

import 'package:web_novel_app/services/novel_services/novel_bloc.dart/novel_chapters_bloc/novel_chapters_bloc.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/review_input/review_holder.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/novel_chapters/novel_chapters_holder.dart';

import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/gift/gifts_holder.dart';



import '../../../services/novel_services/novel_bloc.dart/gifts_bloc/users_gifts_bloc/users_gifts_bloc.dart';

import '../../../services/novel_services/novel_bloc.dart/power_bloc/power_bloc.dart';

import '../../../services/novel_services/novel_services.dart';
import '../../../widgets/drawer/app_drawer.dart';
import '../../../widgets/nav_widgets/upper_app_bar.dart';
import '../../../widgets/novel_data_widgets/gifts_power/power/power_holder.dart';
import '../../../widgets/novel_data_widgets/novel_infos_container/novel_buttons_data/novel_general_container.dart';
import '../../../widgets/novel_data_widgets/novel_infos_container/novel_other_widgets/novel_tags_container.dart';
import '../../../widgets/novel_data_widgets/novel_infos_container/novel_other_widgets/novels_description.dart';
import '../../../widgets/novel_data_widgets/novel_infos_container/novel_stack/novel_stack.dart';


class NovelView extends StatefulWidget {
  const NovelView({super.key});

  @override
  State<NovelView> createState() => _NovelViewState();
}

class _NovelViewState extends State<NovelView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) { 
    final novel = ModalRoute.of(context)!.settings.arguments as NovelModel;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      appBar: UpperAppBar(context: context, scaffoldKey: scaffoldKey),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<UsersGiftsBloc>(
              create: ((context) => UsersGiftsBloc(NovelServices()))),
          BlocProvider<PowerBloc>(
              create: ((context) => PowerBloc(NovelServices()))),
          BlocProvider<NovelChaptersBloc>(
              create: ((context) => NovelChaptersBloc(NovelServices()))),
        ],
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 350.h +
            novel.tags.length * 2.h +
            (novel.description.length * 100.h) * 0.0015,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NovelStack(
                height: 50.h,
                width: 100.w,
                novelName: novel.name,
                novelAuthor: novel.author[0],
                novelTranslator: novel.translator[0],
                novelRank: novel.currentRank.toString(),
                url: novel.url),
            NovelGeneralContainer(
                height: 30.h,
                width: 100.w,
                novel: novel),
            NovelTagsContainer(
                width: 100.w, tags: novel.tags),
            NovelDescription(
                width: 100.w,
                description: novel.description),
            GiftsHolder(
              novelId: novel.id,
            ),
            PowerHolder(
              novelId: novel.id,
            ),
            NovelChaptersHolder(
              novelId: novel.id,
            ),
            const ReviewHolder(),
            SizedBox(
              height: 0.3.h,
            )
          ],
        ),
      ),
    ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
