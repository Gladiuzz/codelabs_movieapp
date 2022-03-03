import 'package:equatable/equatable.dart';

class SpokenLanguagesModel extends Equatable {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguagesModel({this.englishName, this.iso6391, this.name});

  SpokenLanguagesModel.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['english_name'] = this.englishName;
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        englishName,
        iso6391,
        name,
      ];
}
