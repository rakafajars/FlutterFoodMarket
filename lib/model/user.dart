import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.meta,
    this.data,
  });

  Meta meta;
  DataUser data;

  User copyWith({
    Meta meta,
    DataUser data,
  }) =>
      User(
        meta: meta ?? this.meta,
        data: data ?? this.data,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        meta: Meta.fromJson(json["meta"]),
        data: DataUser.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
      };
}

class DataUser {
  DataUser({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.roles,
    this.currentTeamId,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoPath,
    this.profilePhotoUrl,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String roles;
  dynamic currentTeamId;
  String address;
  String houseNumber;
  String phoneNumber;
  String city;
  int createdAt;
  int updatedAt;
  String profilePhotoPath;
  String profilePhotoUrl;

  DataUser copyWith({
    int id,
    String name,
    String email,
    dynamic emailVerifiedAt,
    String roles,
    dynamic currentTeamId,
    String address,
    String houseNumber,
    String phoneNumber,
    String city,
    int createdAt,
    int updatedAt,
    String profilePhotoPath,
    String profilePhotoUrl,
  }) =>
      DataUser(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        roles: roles ?? this.roles,
        currentTeamId: currentTeamId ?? this.currentTeamId,
        address: address ?? this.address,
        houseNumber: houseNumber ?? this.houseNumber,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        city: city ?? this.city,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        profilePhotoPath: profilePhotoPath ?? this.profilePhotoPath,
        profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
      );

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        roles: json["roles"],
        currentTeamId: json["current_team_id"],
        address: json["address"],
        houseNumber: json["houseNumber"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        profilePhotoPath: json["profile_photo_path"],
        profilePhotoUrl: json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "roles": roles,
        "current_team_id": currentTeamId,
        "address": address,
        "houseNumber": houseNumber,
        "phoneNumber": phoneNumber,
        "city": city,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "profile_photo_path": profilePhotoPath,
        "profile_photo_url": profilePhotoUrl,
      };
}

class Meta {
  Meta({
    this.code,
    this.status,
    this.message,
  });

  int code;
  String status;
  String message;

  Meta copyWith({
    int code,
    String status,
    String message,
  }) =>
      Meta(
        code: code ?? this.code,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
