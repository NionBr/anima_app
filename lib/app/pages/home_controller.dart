import 'package:anima_app/app/models/anime_model.dart';
import 'package:anima_app/app/repositories/anime_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<AnimeModel> animeList = [];
  final repository = AnimeRepository();
  final state = ValueNotifier(HomeState.start);

  Future search(String anime) async {
    state.value = HomeState.loading;
    try {
      animeList = await repository.fechAnimeSearch(anime);
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
