import 'package:codelabs_movieapp/cubit/moviePopular_cubit.dart';
import 'package:codelabs_movieapp/cubit/movienewplaying_cubit.dart';
import 'package:codelabs_movieapp/providers/page_provider.dart';
import 'package:codelabs_movieapp/themes/themes.dart';
import 'package:codelabs_movieapp/widgets/headerMovie_card.dart';
import 'package:codelabs_movieapp/widgets/movie_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var playing, popular;

  @override
  void initState() {
    super.initState();
    popular = context.read<MoviePopularCubit>();
    playing = context.read<MovienewplayingCubit>();
    popular.fetchMoviePopular();
    playing.fetchMoviePlaying();
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        title: Row(
          children: [
            Container(
              child: Image.asset(
                'assets/icn_movie.png',
                color: primaryColor,
                height: 34,
              ),
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              "My Movie",
              style: headerTextStyle.copyWith(fontSize: 16),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        elevation: 0.0,
        bottomOpacity: 0.0,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(
              right: defaultMargin,
              top: 8,
            ),
            child: Container(
              child: GestureDetector(
                onTap: () {
                  print('open notification');
                },
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget popularMovieTitle() {
      return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: 16, left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Popular Movie",
                  style: titleTextStyle,
                ),
                GestureDetector(
                  onTap: () {
                    print('see more showing movie');
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: buttonGrayBgColor)),
                    child: Center(
                      child: Text(
                        "See more",
                        style: buttonTextStyle,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }

    Widget popularMovie() {
      return Container(
        height: 279,
        child: BlocBuilder<MoviePopularCubit, MoviePopularState>(
          builder: (context, state) {
            if (state is MoviePopularLoading) {
              return CircularProgressIndicator();
            } else if (state is MoviePopularSuccess) {
              return ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 20, right: 5),
                    child: Row(
                      children: [
                        HeaderMovieCard(state.movie[index]),
                      ],
                    ),
                  );
                },
              );
            }
            return Center(
              child: Text('Popular List'),
            );
          },
        ),
      );
    }

    Widget newMovieTitle() {
      return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: 16, left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "New Movie",
                  style: titleTextStyle,
                ),
                GestureDetector(
                  onTap: () {
                    print('see more new movie');
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: buttonGrayBgColor)),
                    child: Center(
                      child: Text(
                        "See more",
                        style: buttonTextStyle,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }

    Widget newMovie() {
      return Container(
        child: BlocBuilder<MovienewplayingCubit, MovienewplayingState>(
          builder: (context, state) {
            if (state is MovienewplayingLoading) {
              return CircularProgressIndicator();
            } else if (state is MovienewplayingSuccess) {
              return ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    child: MovieCard(state.movie[index]),
                  );
                },
              );
            }
            return Center(
              child: Text('Popular List'),
            );
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: header(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            popularMovieTitle(),
            SizedBox(
              height: 16,
            ),
            popularMovie(),
            SizedBox(
              height: 24,
            ),
            newMovieTitle(),
            SizedBox(
              height: 15,
            ),
            newMovie(),
          ],
        ),
      ),
    );
  }
}
