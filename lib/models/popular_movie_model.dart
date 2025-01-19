class PopularMovieModel {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds; // genre_ids는 배열로 처리
  final int id; // id는 int 타입
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity; // popularity는 double 타입
  final String posterPath; // URL 처리는 별도로
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage; // vote_average는 double 타입
  final int voteCount; // vote_count는 int 타입

  // 생성자
  PopularMovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  // JSON 데이터를 모델로 변환
  factory PopularMovieModel.fromJson(Map<String, dynamic> json) {
    return PopularMovieModel(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String,
      genreIds: List<int>.from(json['genre_ids'] as List),
      id: json['id'] as int,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: "https://image.tmdb.org/t/p/w500${json['poster_path']}",
      releaseDate: json['release_date'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );
  }
}
