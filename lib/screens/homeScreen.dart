import 'package:flutter/material.dart';
import 'package:nomad_movie/screens/detailScreen.dart';
import 'package:nomad_movie/services/api_services.dart';
import '../models/popular_movie_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<PopularMovieModel>> populars =
      ApiServices.getPopularMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Popular Movies",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder(
              future: populars,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Failed to load movies."),
                  );
                } else if (snapshot.hasData) {
                  final popularMovies = snapshot.data!;
                  return Expanded(
                    child: Carousel(popularMovies),
                  );
                } else {
                  return Center(child: Text("No data available."));
                }
              },
            ),
            SizedBox(height: 20),
            Text(
              "Now in Cinemas",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Coming soon",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView Carousel(List<dynamic> movies) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(
                        title: movie.title,
                        posterPath: movie.posterPath,
                        voteAverage: movie.voteAverage,
                        overview: movie.overview,
                        releaseDate: movie.releaseDate,
                        id: movie.id)));
          },
          child: Hero(
            tag: movie.id,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                movie.posterPath,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 20),
    );
  }
}
