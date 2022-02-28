import 'package:codelabs_movieapp/themes/themes.dart';
import 'package:flutter/cupertino.dart';

class CastCard extends StatelessWidget {
  const CastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Container(
              width: 82,
              height: 82,
              child: Image.asset(
                'assets/tom_holland.jpeg',
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
                text: "Tom Holland",
                style: subTextStyle.copyWith(
                  fontWeight: semiBold,
                  color: titleBlackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
