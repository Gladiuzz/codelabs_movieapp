import 'package:codelabs_movieapp/models/movie_model.dart';
import 'package:codelabs_movieapp/pages/movie_page.dart';
import 'package:codelabs_movieapp/services/movie_service.dart';
import 'package:codelabs_movieapp/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderMovieCard extends StatelessWidget {
  final MovieModel movie;
  const HeaderMovieCard(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print(movie);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoviePage(movie),
          ),
        );
      },
      child: Container(
        width: 139,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                  width: 143,
                  height: 212,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "${movie.title}",
              style: titleTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: starColor,
                  size: 14,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "${movie.voteAverage}/10 IMDb",
                  style: ratingTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
