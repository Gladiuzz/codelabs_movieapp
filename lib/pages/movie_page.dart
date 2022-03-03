import 'package:codelabs_movieapp/cubit/cast_cubit.dart';
import 'package:codelabs_movieapp/models/movie_model.dart';
import 'package:codelabs_movieapp/themes/themes.dart';
import 'package:codelabs_movieapp/widgets/cast_card.dart';
import 'package:codelabs_movieapp/widgets/genre_card.dart';
import 'package:codelabs_movieapp/widgets/companies_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MoviePage extends StatefulWidget {
  final MovieModel movieModel;

  MoviePage(this.movieModel, {Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  bool lastStatus = true;
  double height = 25;
  var cast;

  @override
  void initState() {
    super.initState();
    cast = context.read<CastCubit>();
    cast.fetchCast(widget.movieModel.id);
  }

  @override
  void dispose() {
    super.dispose();
  }

  String getTimeString(int value) {
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    return '${hour.toString().padLeft(2, "")}h ${minutes.toString().padLeft(2, "")}m';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget header() {
      return SliverAppBar(
        expandedHeight: 180,
        floating: false,
        pinned: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 4.0,
        toolbarHeight: 60.0,
        flexibleSpace: Stack(
          children: <Widget>[
            Positioned.fill(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    bannerShaderBgColor.withOpacity(0.3), BlendMode.colorBurn),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${widget.movieModel.backdropPath}',
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget titleMovie() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 198,
                  child: Text(
                    "${widget.movieModel.title}",
                    maxLines: 4,
                    style: titleTextStyle.copyWith(
                      fontSize: 20,
                    ),
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
                      "${widget.movieModel.voteAverage}/10 IMDb",
                      style: ratingTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              child: Image.asset(
                'assets/icn_bookmark.png',
                width: 24,
                color: Colors.black,
              ),
            )
          ],
        ),
      );
    }

    Widget genreType() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        height: 20,
        child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GenreCard(widget.movieModel.genres![index]);
          },
        ),
      );
    }

    Widget infoMovie() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 109,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Length",
                    style: subTextStyle,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(getTimeString(widget.movieModel.runtime),
                      style: subTextStyle.copyWith(
                        fontWeight: semiBold,
                        color: titleBlackColor,
                      )),
                ],
              ),
            ),
            Container(
              width: 109,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Language",
                    style: subTextStyle,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text("${widget.movieModel.spokenLanguages![0].englishName}",
                      style: subTextStyle.copyWith(
                        fontWeight: semiBold,
                        color: titleBlackColor,
                      )),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget descripctionTitle() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          "Description",
          style: titleTextStyle.copyWith(color: subTitleColor),
        ),
      );
    }

    Widget desription() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          "${widget.movieModel.overview}",
          style: subTextStyle,
        ),
      );
    }

    Widget castTitle() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cast",
              style: titleTextStyle.copyWith(color: subTitleColor),
            ),
            GestureDetector(
              onTap: () {
                print('see more showing movie');
              },
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
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
      );
    }

    Widget cast() {
      return BlocBuilder<CastCubit, CastState>(
        builder: (context, state) {
          if (state is CastLoading) {
            return CircularProgressIndicator();
          } else if (state is CastSuccess) {
            return Container(
              height: 180,
              child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CastCard(state.cast[index]);
                },
              ),
            );
          }

          return Center(
            child: Container(),
          );
        },
      );
    }

    Widget productionCompaniesTitle() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Production Companies",
              style: titleTextStyle.copyWith(color: subTitleColor),
            ),
          ],
        ),
      );
    }

    Widget productionCompanies() {
      return Container(
        height: 150,
        child: ListView.builder(
          itemCount: widget.movieModel.productionCompanies!.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CompaniesCard(widget.movieModel.productionCompanies![index]);
          },
        ),
      );
    }

    return Scaffold(
        backgroundColor: whiteColor,
        body: CustomScrollView(
          slivers: <Widget>[
            header(),
            SliverFillRemaining(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  width: size.width,
                  margin: EdgeInsets.only(
                    top: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      titleMovie(),
                      SizedBox(
                        height: 16,
                      ),
                      genreType(),
                      SizedBox(
                        height: 16,
                      ),
                      infoMovie(),
                      SizedBox(
                        height: 24,
                      ),
                      descripctionTitle(),
                      SizedBox(
                        height: 8,
                      ),
                      desription(),
                      SizedBox(
                        height: 24,
                      ),
                      castTitle(),
                      SizedBox(
                        height: 16,
                      ),
                      cast(),
                      SizedBox(
                        height: 24,
                      ),
                      productionCompaniesTitle(),
                      SizedBox(
                        height: 16,
                      ),
                      productionCompanies(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
