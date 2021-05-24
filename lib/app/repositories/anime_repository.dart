import 'dart:convert';
import 'package:anima_app/app/models/anime_model.dart';
import 'package:http/http.dart' as http;

class AnimeRepository {
  Future<List<AnimeModel>> fechAnimeSearch(String anime) async {
    final response = await http.get(
      Uri.parse("https://api.jikan.moe/v3/search/anime?q=" + anime),
    );
    final result = jsonDecode(response.body);
    final list = result['results'] as List;
    return list.map((json) => AnimeModel.fromJson(json)).toList();
  }
}
