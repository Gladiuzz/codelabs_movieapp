import 'package:codelabs_movieapp/models/cast_model.dart';
import 'package:codelabs_movieapp/themes/themes.dart';
import 'package:flutter/cupertino.dart';

class CastCard extends StatelessWidget {
  final CastModel castModel;

  const CastCard(this.castModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Container(
              width: 104,
              height: 92,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${castModel.profilePath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 80,
            child: RichText(
              overflow: TextOverflow.visible,
              text: TextSpan(
                text: "${castModel.name}",
                style: subTextStyle.copyWith(
                  fontWeight: semiBold,
                  color: titleBlackColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 80,
            child: RichText(
              overflow: TextOverflow.visible,
              text: TextSpan(
                text: "${castModel.character}",
                style: subTextStyle.copyWith(
                  fontWeight: reguler,
                  color: titleBlackColor,
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
