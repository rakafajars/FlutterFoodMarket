// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'dart:convert';

enum TransactionStatus {
  delivered,
  on_delivery,
  pending,
  cancelled,
}

Transaction transactionFromJson(String str) =>
    Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

class Transaction {
  Transaction({
    this.meta,
    this.data,
  });

  Meta meta;
  Data data;

  Transaction copyWith({
    Meta meta,
    Data data,
  }) =>
      Transaction(
        meta: meta ?? this.meta,
        data: data ?? this.data,
      );

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.foodId,
    this.userId,
    this.quantity,
    this.total,
    this.status,
    this.paymentUrl,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.food,
    this.user,
  });

  int id;
  int foodId;
  int userId;
  int quantity;
  int total;
  String status;
  String paymentUrl;
  dynamic deletedAt;
  int createdAt;
  int updatedAt;
  FoodTransaction food;
  UserTransaction user;

  Data copyWith({
    int id,
    int foodId,
    int userId,
    int quantity,
    int total,
    String status,
    String paymentUrl,
    dynamic deletedAt,
    int createdAt,
    int updatedAt,
    FoodTransaction food,
    UserTransaction user,
  }) =>
      Data(
        id: id ?? this.id,
        foodId: foodId ?? this.foodId,
        userId: userId ?? this.userId,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        status: status ?? this.status,
        paymentUrl: paymentUrl ?? this.paymentUrl,
        deletedAt: deletedAt ?? this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        food: food ?? this.food,
        user: user ?? this.user,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        foodId: json["food_id"],
        userId: json["user_id"],
        quantity: json["quantity"],
        total: json["total"],
        status: json["status"],
        paymentUrl: json["payment_url"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        food: FoodTransaction.fromJson(json["food"]),
        user: UserTransaction.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "food_id": foodId,
        "user_id": userId,
        "quantity": quantity,
        "total": total,
        "status": status,
        "payment_url": paymentUrl,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "food": food.toJson(),
        "user": user.toJson(),
      };
}

class FoodTransaction {
  FoodTransaction({
    this.id,
    this.picturePath,
    this.name,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
    this.types,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String picturePath;
  String name;
  String description;
  String ingredients;
  int price;
  int rate;
  String types;
  dynamic deletedAt;
  int createdAt;
  int updatedAt;

  FoodTransaction copyWith({
    int id,
    String picturePath,
    String name,
    String description,
    String ingredients,
    int price,
    int rate,
    String types,
    dynamic deletedAt,
    int createdAt,
    int updatedAt,
  }) =>
      FoodTransaction(
        id: id ?? this.id,
        picturePath: picturePath ?? this.picturePath,
        name: name ?? this.name,
        description: description ?? this.description,
        ingredients: ingredients ?? this.ingredients,
        price: price ?? this.price,
        rate: rate ?? this.rate,
        types: types ?? this.types,
        deletedAt: deletedAt ?? this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory FoodTransaction.fromJson(Map<String, dynamic> json) =>
      FoodTransaction(
        id: json["id"],
        picturePath: json["picturePath"],
        name: json["name"],
        description: json["description"],
        ingredients: json["ingredients"],
        price: json["price"],
        rate: json["rate"],
        types: json["types"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "picturePath": picturePath,
        "name": name,
        "description": description,
        "ingredients": ingredients,
        "price": price,
        "rate": rate,
        "types": types,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class UserTransaction {
  UserTransaction({
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

  UserTransaction copyWith({
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
      UserTransaction(
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

  factory UserTransaction.fromJson(Map<String, dynamic> json) =>
      UserTransaction(
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
