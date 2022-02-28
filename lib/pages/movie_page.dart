import 'package:codelabs_movieapp/themes/themes.dart';
import 'package:codelabs_movieapp/widgets/cast_card.dart';
import 'package:codelabs_movieapp/widgets/genre_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 100;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController!.removeListener(_scrollListener);
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget header() {
      return SliverAppBar(
        expandedHeight: 200,
        floating: false,
        pinned: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: _isShrink ? Colors.black : whiteColor,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        elevation: 0.0,
        flexibleSpace: FlexibleSpaceBar(
          background: ColorFiltered(
            colorFilter: ColorFilter.mode(
                bannerShaderBgColor.withOpacity(0.2), BlendMode.colorBurn),
            child: Image.asset(
              'assets/example_img.jpg',
              fit: BoxFit.cover,
            ),
          ),
          title: _isShrink ? Container() : Container(),
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
                    "Spiderman: No Way Home",
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
                      "9.1/10 IMDb",
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
            return GenreCard();
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
                  Text("2h 28min",
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
                  Text("English",
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
                    "Rating",
                    style: subTextStyle,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text("PG-13",
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
          "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.",
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
      return Container(
        height: 120,
        child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CastCard();
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            header(),
          ];
        },
        body: Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
