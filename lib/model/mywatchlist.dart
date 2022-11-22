// To parse this JSON data, do
//
//     final myWatchlist = myWatchlistFromJson(jsonString);
import 'dart:convert';

List<MyWatchlist> myWatchlistFromJson(String str) => List<MyWatchlist>.from(
    json.decode(str).map((x) => MyWatchlist.fromJson(x)));

String myWatchlistToJson(List<MyWatchlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchlist {
  MyWatchlist({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory MyWatchlist.fromJson(Map<String, dynamic> json) => MyWatchlist(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  bool watched;
  String title;
  int rating;
  DateTime releaseDate;
  String review;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        watched: json["watched"],
        title: json["title"],
        rating: json["rating"],
        releaseDate: DateTime.parse(json["release_date"]),
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "watched": watched,
        "title": title,
        "rating": rating,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "review": review,
      };
}
