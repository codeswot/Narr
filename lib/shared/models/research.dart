import 'dart:convert';

class ResearchModel {
  ResearchModel({
    required this.description,
    required this.authors,
    required this.category,
    required this.genre,
    required this.accessType,
    required this.monthlyFee,
    required this.status,
    required this.uploader,
    required this.readPath,
    required this.thumbnail,
    required this.cover,
    required this.hits,
    required this.likes,
    required this.dislikes,
    required this.ratings,
    required this.favorited,
    required this.reading,
    required this.read,
    required this.paidSubscriptions,
    required this.id,
    required this.researchTitle,
    required this.year,
    required this.citations,
    required this.hashSignature,
    required this.nPages,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String description;
  final List<String> authors;
  final List<String> category;
  final String genre;
  final String accessType;
  final int monthlyFee;
  final String status;
  final String uploader;
  final String readPath;
  final String thumbnail;
  final String cover;
  final int hits;
  final int likes;
  final int dislikes;
  final int ratings;
  final int favorited;
  final int reading;
  final int read;
  final int paidSubscriptions;
  final String id;
  final String researchTitle;
  final String year;
  final List<dynamic> citations;
  final String hashSignature;
  final int nPages;
  final List<dynamic> comments;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory ResearchModel.fromRawJson(String str) =>
      ResearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResearchModel.fromJson(Map<String, dynamic> json) => ResearchModel(
        description: json["description"],
        authors: List<String>.from(json["authors"].map((x) => x)),
        category: List<String>.from(json["category"].map((x) => x)),
        genre: json["genre"],
        accessType: json["accessType"],
        monthlyFee: json["monthlyFee"],
        status: json["status"],
        uploader: json["uploader"],
        readPath: json["readPath"],
        thumbnail: json["thumbnail"],
        cover: json["cover"],
        hits: json["hits"],
        likes: json["likes"],
        dislikes: json["dislikes"],
        ratings: json["ratings"],
        favorited: json["favorited"],
        reading: json["reading"],
        read: json["read"],
        paidSubscriptions: json["paidSubscriptions"],
        id: json["_id"],
        researchTitle: json["researchTitle"],
        year: json["year"],
        citations: List<dynamic>.from(json["citations"].map((x) => x)),
        hashSignature: json["hashSignature"],
        nPages: json["nPages"],
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "authors": List<dynamic>.from(authors.map((x) => x)),
        "category": List<dynamic>.from(category.map((x) => x)),
        "genre": genre,
        "accessType": accessType,
        "monthlyFee": monthlyFee,
        "status": status,
        "uploader": uploader,
        "readPath": readPath,
        "thumbnail": thumbnail,
        "cover": cover,
        "hits": hits,
        "likes": likes,
        "dislikes": dislikes,
        "ratings": ratings,
        "favorited": favorited,
        "reading": reading,
        "read": read,
        "paidSubscriptions": paidSubscriptions,
        "_id": id,
        "researchTitle": researchTitle,
        "year": year,
        "citations": List<dynamic>.from(citations.map((x) => x)),
        "hashSignature": hashSignature,
        "nPages": nPages,
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
