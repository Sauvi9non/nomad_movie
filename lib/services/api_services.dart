import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/popular_movie_model.dart';

class ApiServices {
  //관련 API 설정들을 하는 곳
  static const String baseURL =
      "https://movies-api.nomadcoders.workers.dev"; //api 요청 보낼 주소의 기본 주소
  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";

  //API 요청
  //인기 있는 영화
  static Future<List<PopularMovieModel>> getPopularMovies() async {
    final url = Uri.parse("$baseURL/$popular"); //요청할 주소
    final response =
        await http.get(url); //받아온 응답, 여기서 results에 있는 List를 분리해야한다.
    print("API SERVICE $response");
    if (response.statusCode == 200) {
      //요청 성공 시
      Map<String, dynamic> parsedJson = jsonDecode(response.body);
      List<dynamic> results = parsedJson['results']; //여기 안에 이제 그 데이터들이...
      print("API SERVICE RESULTS $results");

      List<PopularMovieModel> popularMovies =
          []; //이거 안해주면..타입이 List<dynamic>으로 나와서...
      for (var movie in results) {
        final instance = PopularMovieModel.fromJson(movie);
        popularMovies.add(instance);
      }
      print("popularMoview TYPE ${popularMovies.runtimeType}");
      return popularMovies;
    }
    throw Error();
  }
  //page, results,
}
