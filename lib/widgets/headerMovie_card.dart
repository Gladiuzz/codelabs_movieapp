import 'package:codelabs_movieapp/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderMovieCard extends StatelessWidget {
  const HeaderMovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 139,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                child: Image.asset(
                  'assets/example_img.jpg',
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
          ],
        ),
      ),
    );
  }
}
