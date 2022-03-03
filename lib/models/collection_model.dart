import 'package:equatable/equatable.dart';

class BelongsToCollectionModel extends Equatable {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollectionModel(
      {this.id, this.name, this.posterPath, this.backdropPath});

  BelongsToCollectionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['poster_path'] = this.posterPath;
    data['backdrop_path'] = this.backdropPath;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        posterPath,
        backdropPath,
      ];
}
