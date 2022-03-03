import 'package:codelabs_movieapp/models/production_model.dart';
import 'package:codelabs_movieapp/themes/themes.dart';
import 'package:flutter/cupertino.dart';

class CompaniesCard extends StatelessWidget {
  final ProductionCompaniesModel productionCompaniesModel;

  const CompaniesCard(this.productionCompaniesModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Container(
              width: 104,
              height: 72,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${productionCompaniesModel.logoPath}',
                fit: BoxFit.scaleDown,
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
                text: "${productionCompaniesModel.name}",
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
