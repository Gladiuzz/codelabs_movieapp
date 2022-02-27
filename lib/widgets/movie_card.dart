import 'package:codelabs_movieapp/themes/themes.dart';
import 'package:codelabs_movieapp/widgets/genre_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.only(left: defaultMargin, bottom: 16),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Container(
              child: Image.asset(
                'assets/example_img.jpg',
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
                "Spiderman: No Way Home",
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
                    "9.1/10 IMDb",
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
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GenreCard();
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
                    "1h 47m",
                    style: ratingTextStyle.copyWith(),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
