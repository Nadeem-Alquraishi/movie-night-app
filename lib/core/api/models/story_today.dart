
class StoryTodayResults {


  bool? adult;
  String? backdropPath;
  List<int?>? genreIds;
  int? id;
  List<String?>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  String? firstAirDate;
  String? name;
  double? voteAverage;
  int? voteCount;

  StoryTodayResults({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  });
  StoryTodayResults.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path']?.toString();
  if (json['genre_ids'] != null) {
  final v = json['genre_ids'];
  final arr0 = <int>[];
  v.forEach((v) {
  arr0.add(v.toInt());
  });
    genreIds = arr0;
    }
    id = json['id']?.toInt();
  if (json['origin_country'] != null) {
  final v = json['origin_country'];
  final arr0 = <String>[];
  v.forEach((v) {
  arr0.add(v.toString());
  });
    originCountry = arr0;
    }
    originalLanguage = json['original_language']?.toString();
    originalName = json['original_name']?.toString();
    overview = json['overview']?.toString();
    popularity = json['popularity']?.toDouble();
    posterPath = json['poster_path']?.toString();
    firstAirDate = json['first_air_date']?.toString();
    name = json['name']?.toString();
    voteAverage = json['vote_average']?.toDouble();
    voteCount = json['vote_count']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    if (genreIds != null) {
      final v = genreIds;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v);
  });
      data['genre_ids'] = arr0;
    }
    data['id'] = id;
    if (originCountry != null) {
      final v = originCountry;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v);
  });
      data['origin_country'] = arr0;
    }
    data['original_language'] = originalLanguage;
    data['original_name'] = originalName;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['first_air_date'] = firstAirDate;
    data['name'] = name;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}

class StoryToday {


  int? page;
  List<StoryTodayResults?>? results;
  int? totalPages;
  int? totalResults;

  StoryToday({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  StoryToday.fromJson(Map<String, dynamic> json) {
    page = json['page']?.toInt();
  if (json['results'] != null) {
  final v = json['results'];
  final arr0 = <StoryTodayResults>[];
  v.forEach((v) {
  arr0.add(StoryTodayResults.fromJson(v));
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
