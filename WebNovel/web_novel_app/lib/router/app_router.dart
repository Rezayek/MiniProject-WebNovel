import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_novel_app/views/other_views/novel_views/novel_view.dart';

import '../app_controller.dart';
import '../services/Auth/auth_bloc/auth_bloc.dart';
import '../services/Auth/auth_services.dart';
import '../services/Auth/firebase_auth_provider.dart';
import '../services/novel_services/novel_bloc.dart/carousel_bloc/carousel_bloc.dart';
import '../services/novel_services/novel_bloc.dart/filter_bloc/filter_bloc.dart';
import '../services/novel_services/novel_bloc.dart/index_bloc/index_bloc.dart';
import '../services/novel_services/novel_bloc.dart/new_bloc/new_bloc.dart';
import '../services/novel_services/novel_bloc.dart/rank_blocs/power_rank_bloc/power_rank_bloc.dart';
import '../services/novel_services/novel_bloc.dart/rank_blocs/reader_rank_bloc/reader_rank_bloc.dart';
import '../services/novel_services/novel_bloc.dart/recomend_bloc/recomend_bloc.dart';
import '../services/novel_services/novel_bloc.dart/search_bloc.dart/search_bloc.dart';
import '../services/novel_services/novel_bloc.dart/weekly_bloc/weekly_bloc.dart';
import '../services/novel_services/novel_services.dart';
import '../services/novel_services/search/history_search.dart';

class AppRouter {
  final AuthBloc authBloc = AuthBloc(AuthServices(FirebaseAuthProvider()));
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider.value(
            value: authBloc,
            child: MultiBlocProvider(
              providers: [
                BlocProvider<CarouselBloc>(
                    create: ((context) => CarouselBloc(NovelServices()))),
                BlocProvider<WeeklyBloc>(
                    create: ((context) => WeeklyBloc(NovelServices()))),
                BlocProvider<NewBloc>(
                    create: ((context) => NewBloc(NovelServices()))),
                BlocProvider<PowerRankBloc>(
                    create: ((context) => PowerRankBloc(NovelServices()))),
                BlocProvider<ReaderRankBloc>(
                    create: ((context) => ReaderRankBloc(NovelServices()))),
                BlocProvider<RecomendBloc>(
                    create: ((context) => RecomendBloc(NovelServices()))),
                BlocProvider<FilterBloc>(
                    create: ((context) => FilterBloc(NovelServices()))),
                BlocProvider<IndexBloc>(create: ((context) => IndexBloc())),
                BlocProvider<SearchBloc>(
                    create: ((context) =>
                        SearchBloc(NovelServices(), HistorySearch()))),
              ],
              child: const AppController(),
            ),
          ),
        );
      case "/novel":
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) =>
                BlocProvider.value(value: authBloc, child: const NovelView()));
    }
    return null;
  }

  void dispose() {
    authBloc.close();
  }
}
