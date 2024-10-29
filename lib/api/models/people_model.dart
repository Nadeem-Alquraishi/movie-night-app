
class PeopleModelResultsKnownFor {

  String? backdropPath;
  int? id;
  String? title;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  bool? adult;
  String? originalLanguage;
  List<int?>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;

  PeopleModelResultsKnownFor({
    this.backdropPath,
    this.id,
    this.title,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.adult,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
  PeopleModelResultsKnownFor.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path']?.toString();
    id = json['id']?.toInt();
    title = json['title']?.toString();
    originalTitle = json['original_title']?.toString();
    overview = json['overview']?.toString();
    posterPath = json['poster_path']?.toString();
    mediaType = json['media_type']?.toString();
    adult = json['adult'];
    originalLanguage = json['original_language']?.toString();
  if (json['genre_ids'] != null) {
  final v = json['genre_ids'];
  final arr0 = <int>[];
  v.forEach((v) {
  arr0.add(v.toInt());
  });
    genreIds = arr0;
    }
    popularity = json['popularity']?.toDouble();
    releaseDate = json['release_date']?.toString();
    video = json['video'];
    voteAverage = json['vote_average']?.toDouble();
    voteCount = json['vote_count']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['title'] = title;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['adult'] = adult;
    data['original_language'] = originalLanguage;
    if (genreIds != null) {
      final v = genreIds;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v);
  });
      data['genre_ids'] = arr0;
    }
    data['popularity'] = popularity;
    data['release_date'] = releaseDate;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}

class PeopleModelResults {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  List<PeopleModelResultsKnownFor?>? knownFor;

  PeopleModelResults({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.knownFor,
  });
  PeopleModelResults.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender']?.toInt();
    id = json['id']?.toInt();
    knownForDepartment = json['known_for_department']?.toString();
    name = json['name']?.toString();
    originalName = json['original_name']?.toString();
    popularity = json['popularity']?.toDouble();
    profilePath = json['profile_path']?.toString();
  if (json['known_for'] != null) {
  final v = json['known_for'];
  final arr0 = <PeopleModelResultsKnownFor>[];
  v.forEach((v) {
  arr0.add(PeopleModelResultsKnownFor.fromJson(v));
  });
    knownFor = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    if (knownFor != null) {
      final v = knownFor;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v!.toJson());
  });
      data['known_for'] = arr0;
    }
    return data;
  }
}

class PeopleModel {


  int? page;
  List<PeopleModelResults?>? results;
  int? totalPages;
  int? totalResults;

  PeopleModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  PeopleModel.fromJson(Map<String, dynamic> json) {
    page = json['page']?.toInt();
  if (json['results'] != null) {
  final v = json['results'];
  final arr0 = <PeopleModelResults>[];
  v.forEach((v) {
  arr0.add(PeopleModelResults.fromJson(v));
  });
    results = arr0;
    }
    totalPages = json['total_pages']?.toInt();
    totalResults = json['total_results']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      final v = results;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v!.toJson());
  });
      data['results'] = arr0;
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
