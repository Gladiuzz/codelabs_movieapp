import 'package:equatable/equatable.dart';

class ProductionCompaniesModel extends Equatable {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompaniesModel(
      {this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompaniesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        logoPath,
        name,
        originCountry,
      ];
}

class ProductionCountriesModel extends Equatable {
  String? iso31661;
  String? name;

  ProductionCountriesModel({this.iso31661, this.name});

  ProductionCountriesModel.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        iso31661,
        name,
      ];
}
