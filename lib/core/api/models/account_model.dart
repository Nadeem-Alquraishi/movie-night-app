class AccountModelAvatarTmdb {
  String? avatarPath;

  AccountModelAvatarTmdb({
    this.avatarPath,
  });
  AccountModelAvatarTmdb.fromJson(Map<String, dynamic> json) {
    avatarPath = json['avatar_path']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['avatar_path'] = avatarPath;
    return data;
  }
}

class AccountModelAvatarGravatar {
  String? hash;

  AccountModelAvatarGravatar({
    this.hash,
  });
  AccountModelAvatarGravatar.fromJson(Map<String, dynamic> json) {
    hash = json['hash']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['hash'] = hash;
    return data;
  }
}

class AccountModelAvatar {
  AccountModelAvatarGravatar? gravatar;
  AccountModelAvatarTmdb? tmdb;

  AccountModelAvatar({
    this.gravatar,
    this.tmdb,
  });
  AccountModelAvatar.fromJson(Map<String, dynamic> json) {
    gravatar = (json['gravatar'] != null)
        ? AccountModelAvatarGravatar.fromJson(json['gravatar'])
        : null;
    tmdb = (json['tmdb'] != null)
        ? AccountModelAvatarTmdb.fromJson(json['tmdb'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (gravatar != null) {
      data['gravatar'] = gravatar!.toJson();
    }
    if (tmdb != null) {
      data['tmdb'] = tmdb!.toJson();
    }
    return data;
  }
}

class AccountModel {
  AccountModelAvatar? avatar;
  int? id;
  String? iso_639_1;
  String? iso_3166_1;
  String? name;
  bool? includeAdult;
  String? username;

  AccountModel({
    this.avatar,
    this.id,
    this.iso_639_1,
    this.iso_3166_1,
    this.name,
    this.includeAdult,
    this.username,
  });
  AccountModel.fromJson(Map<String, dynamic> json) {
    avatar = (json['avatar'] != null)
        ? AccountModelAvatar.fromJson(json['avatar'])
        : null;
    id = json['id']?.toInt();
    iso_639_1 = json['iso_639_1']?.toString();
    iso_3166_1 = json['iso_3166_1']?.toString();
    name = json['name']?.toString();
    includeAdult = json['include_adult'];
    username = json['username']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (avatar != null) {
      data['avatar'] = avatar!.toJson();
    }
    data['id'] = id;
    data['iso_639_1'] = iso_639_1;
    data['iso_3166_1'] = iso_3166_1;
    data['name'] = name;
    data['include_adult'] = includeAdult;
    data['username'] = username;
    return data;
  }
}
