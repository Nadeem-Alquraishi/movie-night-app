class MovieDetailsModelSpokenLanguages {
  String? englishName;
  String? iso_639_1;
  String? name;

  MovieDetailsModelSpokenLanguages({
    this.englishName,
    this.iso_639_1,
    this.name,
  });
  MovieDetailsModelSpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name']?.toString();
    iso_639_1 = json['iso_639_1']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['english_name'] = englishName;
    data['iso_639_1'] = iso_639_1;
    data['name'] = name;
    return data;
  }
}

class MovieDetailsModelProductionCountries {
  String? iso_3166_1;
  String? name;

  MovieDetailsModelProductionCountries({
    this.iso_3166_1,
    this.name,
  });
  MovieDetailsModelProductionCountries.fromJson(Map<String, dynamic> json) {
    iso_3166_1 = json['iso_3166_1']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['iso_3166_1'] = iso_3166_1;
    data['name'] = name;
    return data;
  }
}

class MovieDetailsModelProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  MovieDetailsModelProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });
  MovieDetailsModelProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    logoPath = json['logo_path']?.toString();
    name = json['name']?.toString();
    originCountry = json['origin_country']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['logo_path'] = logoPath;
    data['name'] = name;
    data['origin_country'] = originCountry;
    return data;
  }
}

class MovieDetailsModelGenres {
  int? id;
  String? name;

  MovieDetailsModelGenres({
    this.id,
    this.name,
  });
  MovieDetailsModelGenres.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class MovieDetailsModel {
  bool? adult;
  String? backdropPath;
  String? belongsToCollection;
  int? budget;
  List<MovieDetailsModelGenres?>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String?>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<MovieDetailsModelProductionCompanies?>? productionCompanies;
  List<MovieDetailsModelProductionCountries?>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<MovieDetailsModelSpokenLanguages?>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieDetailsModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path']?.toString();
    belongsToCollection = json['belongs_to_collection']?.toString();
    budget = json['budget']?.toInt();
    if (json['genres'] != null) {
      final v = json['genres'];
      final arr0 = <MovieDetailsModelGenres>[];
      v.forEach((v) {
        arr0.add(MovieDetailsModelGenres.fromJson(v));
      });
      genres = arr0;
    }
    homepage = json['homepage']?.toString();
    id = json['id']?.toInt();
    imdbId = json['imdb_id']?.toString();
    if (json['origin_country'] != null) {
      final v = json['origin_country'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      originCountry = arr0;
    }
    originalLanguage = json['original_language']?.toString();
    originalTitle = json['original_title']?.toString();
    overview = json['overview']?.toString();
    popularity = json['popularity']?.toDouble();
    posterPath = json['poster_path']?.toString();
    if (json['production_companies'] != null) {
      final v = json['production_companies'];
      final arr0 = <MovieDetailsModelProductionCompanies>[];
      v.forEach((v) {
        arr0.add(MovieDetailsModelProductionCompanies.fromJson(v));
      });
      productionCompanies = arr0;
    }
    if (json['production_countries'] != null) {
      final v = json['production_countries'];
      final arr0 = <MovieDetailsModelProductionCountries>[];
      v.forEach((v) {
        arr0.add(MovieDetailsModelProductionCountries.fromJson(v));
      });
      productionCountries = arr0;
    }
    releaseDate = json['release_date']?.toString();
    revenue = json['revenue']?.toInt();
    runtime = json['runtime']?.toInt();
    if (json['spoken_languages'] != null) {
      final v = json['spoken_languages'];
      final arr0 = <MovieDetailsModelSpokenLanguages>[];
      v.forEach((v) {
        arr0.add(MovieDetailsModelSpokenLanguages.fromJson(v));
      });
      spokenLanguages = arr0;
    }
    status = json['status']?.toString();
    tagline = json['tagline']?.toString();
    title = json['title']?.toString();
    video = json['video'];
    voteAverage = json['vote_average']?.toDouble();
    voteCount = json['vote_count']?.toInt();
  }

  List<MovieDetailsModel>? get similarMovies => null;
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['belongs_to_collection'] = belongsToCollection;
    data['budget'] = budget;
    if (genres != null) {
      final v = genres;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['genres'] = arr0;
    }
    data['homepage'] = homepage;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    if (originCountry != null) {
      final v = originCountry;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['origin_country'] = arr0;
    }
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    if (productionCompanies != null) {
      final v = productionCompanies;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['production_companies'] = arr0;
    }
    if (productionCountries != null) {
      final v = productionCountries;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['production_countries'] = arr0;
    }
    data['release_date'] = releaseDate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    if (spokenLanguages != null) {
      final v = spokenLanguages;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['spoken_languages'] = arr0;
    }
    data['status'] = status;
    data['tagline'] = tagline;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
