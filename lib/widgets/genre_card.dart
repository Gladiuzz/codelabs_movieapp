import 'package:codelabs_movieapp/models/genre_model.dart';
import 'package:codelabs_movieapp/themes/themes.dart';
import 'package:flutter/cupertino.dart';

class GenreCard extends StatelessWidget {
  final GenreModel genreModel;

  const GenreCard(this.genreModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: primaryColor,
      ),
      child: Center(
        child: Text(
          "${genreModel.name}",
          style: buttonTextStyle.copyWith(
            fontSize: 8,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
