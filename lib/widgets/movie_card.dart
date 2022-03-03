import 'package:codelabs_movieapp/models/movie_model.dart';
import 'package:codelabs_movieapp/pages/movie_page.dart';
import 'package:codelabs_movieapp/themes/themes.dart';
import 'package:codelabs_movieapp/widgets/genre_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  const MovieCard(this.movie, {Key? key}) : super(key: key);

  String getTimeString(int value) {
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    return '${hour.toString().padLeft(2, "")}h ${minutes.toString().padLeft(2, "")}m';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoviePage(movie),
          ),
        );
      },
      child: Container(
        width: size.width,
        margin: EdgeInsets.only(left: defaultMargin, bottom: 16),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                  width: 85,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${movie.title}",
                  maxLines: 15,
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
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 20,
                  child: ListView.builder(
                    itemCount: movie.genres?.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GenreCard(movie.genres![index]);
                    },
                  ),
                ),
                SizedBox(
                  height: 10.64,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      color: Colors.black,
                      size: 14,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      getTimeString(movie.runtime),
                      style: ratingTextStyle.copyWith(),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
