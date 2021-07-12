// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.user,
    required this.token,
  });

  final User user;
  final String token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  User({
    required this.institution,
    required this.blockchain,
    required this.fullName,
    required this.emailVerified,
    required this.userRole,
    required this.avatar,
    required this.bvn,
    required this.totalUploads,
    required this.specialization,
    required this.interests,
    required this.status,
    required this.id,
    required this.fName,
    required this.lName,
    required this.email,
    required this.phone,
    required this.address,
    required this.dob,
    required this.password,
    required this.narrEmail,
    required this.bank,
    required this.lastLoggedIn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final Institution institution;
  final Blockchain blockchain;
  final String fullName;
  final bool emailVerified;
  final String userRole;
  final String avatar;
  final String bvn;
  final int totalUploads;
  final List<String> specialization;
  final List<String> interests;
  final String status;
  final String id;
  final String fName;
  final String lName;
  final String email;
  final String phone;
  final String address;
  final DateTime dob;
  final String password;
  final String narrEmail;
  final List<dynamic> bank;
  final DateTime lastLoggedIn;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        institution: Institution.fromJson(json["institution"]),
        blockchain: Blockchain.fromJson(json["blockchain"]),
        fullName: json["fullName"],
        emailVerified: json["emailVerified"],
        userRole: json["userRole"],
        avatar: json["avatar"],
        bvn: json["bvn"],
        totalUploads: json["totalUploads"],
        specialization: List<String>.from(json["specialization"].map((x) => x)),
        interests: List<String>.from(json["interests"].map((x) => x)),
        status: json["status"],
        id: json["_id"],
        fName: json["fName"],
        lName: json["lName"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        dob: DateTime.parse(json["dob"]),
        password: json["password"],
        narrEmail: json["narrEmail"],
        bank: List<dynamic>.from(json["bank"].map((x) => x)),
        lastLoggedIn: DateTime.parse(json["lastLoggedIn"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "institution": institution.toJson(),
        "blockchain": blockchain.toJson(),
        "fullName": fullName,
        "emailVerified": emailVerified,
        "userRole": userRole,
        "avatar": avatar,
        "bvn": bvn,
        "totalUploads": totalUploads,
        "specialization": List<dynamic>.from(specialization.map((x) => x)),
        "interests": List<dynamic>.from(interests.map((x) => x)),
        "status": status,
        "_id": id,
        "fName": fName,
        "lName": lName,
        "email": email,
        "phone": phone,
        "address": address,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "password": password,
        "narrEmail": narrEmail,
        "bank": List<dynamic>.from(bank.map((x) => x)),
        "lastLoggedIn": lastLoggedIn.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Blockchain {
  Blockchain({
    required this.tokens,
    required this.gasBalance,
    required this.publicKey,
  });

  final String tokens;
  final String gasBalance;
  final String publicKey;

  factory Blockchain.fromJson(Map<String, dynamic> json) => Blockchain(
        tokens: json["tokens"],
        gasBalance: json["gasBalance"],
        publicKey: json["publicKey"],
      );

  Map<String, dynamic> toJson() => {
        "tokens": tokens,
        "gasBalance": gasBalance,
        "publicKey": publicKey,
      };
}

class Institution {
  Institution({
    required this.acronym,
    required this.ownership,
    required this.url,
    required this.year,
    required this.logo,
    required this.name,
    required this.type,
  });

  final String acronym;
  final String ownership;
  final String url;
  final String year;
  final String logo;
  final String name;
  final String type;

  factory Institution.fromJson(Map<String, dynamic> json) => Institution(
        acronym: json["acronym"],
        ownership: json["ownership"],
        url: json["url"],
        year: json["year"],
        logo: json["logo"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "acronym": acronym,
        "ownership": ownership,
        "url": url,
        "year": year,
        "logo": logo,
        "name": name,
        "type": type,
      };
}
