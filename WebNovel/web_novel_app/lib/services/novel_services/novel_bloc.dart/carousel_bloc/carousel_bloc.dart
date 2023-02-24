import 'package:bloc/bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_provider.dart';

import 'carousel_event.dart';
import 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {

  CarouselBloc(NovelProvider provider): super(CarouselStateInit()){
    on<NovelEventGetCarouselNovels>((event, emit)  async {
      try {
        final novel = await provider.getCarouselNovel();
        emit(NovelStateGetCarouselNovels(novels: novel, exception: null));
      } on Exception catch (e) {
        emit(NovelStateGetCarouselNovels(novels: [], exception: e));
      }
    });
  }
}
