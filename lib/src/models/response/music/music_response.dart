// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MusicResponse welcomeFromJson(String str) => MusicResponse.fromJson(json.decode(str));

String welcomeToJson(MusicResponse data) => json.encode(data.toJson());

class MusicResponse {
    MusicResponse({
        this.resultCount,
        this.results,
    });

    int resultCount;
    List<Result> results;

    factory MusicResponse.fromJson(Map<String, dynamic> json) => MusicResponse(
        resultCount: json["resultCount"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resultCount": resultCount,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.wrapperType,
        this.kind,
        this.artistId,
        this.trackId,
        this.artistName,
        this.trackName,
        this.trackCensoredName,
        this.artistViewUrl,
        this.trackViewUrl,
        this.previewUrl,
        this.artworkUrl30,
        this.artworkUrl60,
        this.artworkUrl100,
        this.collectionPrice,
        this.trackPrice,
        this.releaseDate,
        this.collectionExplicitness,
        this.trackExplicitness,
        this.trackTimeMillis,
        this.country,
        this.currency,
        this.primaryGenreName,
        this.collectionId,
        this.collectionName,
        this.collectionCensoredName,
        this.collectionViewUrl,
        this.discCount,
        this.discNumber,
        this.trackCount,
        this.trackNumber,
        this.isStreamable,
        this.collectionArtistId,
        this.collectionArtistName,
    });

    WrapperType wrapperType;
    Kind kind;
    int artistId;
    int trackId;
    String artistName;
    String trackName;
    String trackCensoredName;
    String artistViewUrl;
    String trackViewUrl;
    String previewUrl;
    String artworkUrl30;
    String artworkUrl60;
    String artworkUrl100;
    double collectionPrice;
    double trackPrice;
    DateTime releaseDate;
    Explicitness collectionExplicitness;
    Explicitness trackExplicitness;
    int trackTimeMillis;
    Country country;
    Currency currency;
    PrimaryGenreName primaryGenreName;
    int collectionId;
    String collectionName;
    String collectionCensoredName;
    String collectionViewUrl;
    int discCount;
    int discNumber;
    int trackCount;
    int trackNumber;
    bool isStreamable;
    int collectionArtistId;
    String collectionArtistName;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        wrapperType: wrapperTypeValues.map[json["wrapperType"]],
        kind: kindValues.map[json["kind"]],
        artistId: json["artistId"],
        trackId: json["trackId"],
        artistName: json["artistName"],
        trackName: json["trackName"],
        trackCensoredName: json["trackCensoredName"],
        artistViewUrl: json["artistViewUrl"],
        trackViewUrl: json["trackViewUrl"],
        previewUrl: json["previewUrl"],
        artworkUrl30: json["artworkUrl30"],
        artworkUrl60: json["artworkUrl60"],
        artworkUrl100: json["artworkUrl100"],
        collectionPrice: json["collectionPrice"] == null ? null : json["collectionPrice"].toDouble(),
        trackPrice: json["trackPrice"] == null ? null : json["trackPrice"].toDouble(),
        releaseDate: DateTime.parse(json["releaseDate"]),
        collectionExplicitness: explicitnessValues.map[json["collectionExplicitness"]],
        trackExplicitness: explicitnessValues.map[json["trackExplicitness"]],
        trackTimeMillis: json["trackTimeMillis"],
        country: countryValues.map[json["country"]],
        currency: currencyValues.map[json["currency"]],
        primaryGenreName: primaryGenreNameValues.map[json["primaryGenreName"]],
        collectionId: json["collectionId"] == null ? null : json["collectionId"],
        collectionName: json["collectionName"] == null ? null : json["collectionName"],
        collectionCensoredName: json["collectionCensoredName"] == null ? null : json["collectionCensoredName"],
        collectionViewUrl: json["collectionViewUrl"] == null ? null : json["collectionViewUrl"],
        discCount: json["discCount"] == null ? null : json["discCount"],
        discNumber: json["discNumber"] == null ? null : json["discNumber"],
        trackCount: json["trackCount"] == null ? null : json["trackCount"],
        trackNumber: json["trackNumber"] == null ? null : json["trackNumber"],
        isStreamable: json["isStreamable"] == null ? null : json["isStreamable"],
        collectionArtistId: json["collectionArtistId"] == null ? null : json["collectionArtistId"],
        collectionArtistName: json["collectionArtistName"] == null ? null : json["collectionArtistName"],
    );

    Map<String, dynamic> toJson() => {
        "wrapperType": wrapperTypeValues.reverse[wrapperType],
        "kind": kindValues.reverse[kind],
        "artistId": artistId,
        "trackId": trackId,
        "artistName": artistName,
        "trackName": trackName,
        "trackCensoredName": trackCensoredName,
        "artistViewUrl": artistViewUrl,
        "trackViewUrl": trackViewUrl,
        "previewUrl": previewUrl,
        "artworkUrl30": artworkUrl30,
        "artworkUrl60": artworkUrl60,
        "artworkUrl100": artworkUrl100,
        "collectionPrice": collectionPrice == null ? null : collectionPrice,
        "trackPrice": trackPrice == null ? null : trackPrice,
        "releaseDate": releaseDate.toIso8601String(),
        "collectionExplicitness": explicitnessValues.reverse[collectionExplicitness],
        "trackExplicitness": explicitnessValues.reverse[trackExplicitness],
        "trackTimeMillis": trackTimeMillis,
        "country": countryValues.reverse[country],
        "currency": currencyValues.reverse[currency],
        "primaryGenreName": primaryGenreNameValues.reverse[primaryGenreName],
        "collectionId": collectionId == null ? null : collectionId,
        "collectionName": collectionName == null ? null : collectionName,
        "collectionCensoredName": collectionCensoredName == null ? null : collectionCensoredName,
        "collectionViewUrl": collectionViewUrl == null ? null : collectionViewUrl,
        "discCount": discCount == null ? null : discCount,
        "discNumber": discNumber == null ? null : discNumber,
        "trackCount": trackCount == null ? null : trackCount,
        "trackNumber": trackNumber == null ? null : trackNumber,
        "isStreamable": isStreamable == null ? null : isStreamable,
        "collectionArtistId": collectionArtistId == null ? null : collectionArtistId,
        "collectionArtistName": collectionArtistName == null ? null : collectionArtistName,
    };
}

enum Explicitness { NOT_EXPLICIT }

final explicitnessValues = EnumValues({
    "notExplicit": Explicitness.NOT_EXPLICIT
});

enum Country { USA }

final countryValues = EnumValues({
    "USA": Country.USA
});

enum Currency { USD }

final currencyValues = EnumValues({
    "USD": Currency.USD
});

enum Kind { MUSIC_VIDEO, SONG }

final kindValues = EnumValues({
    "music-video": Kind.MUSIC_VIDEO,
    "song": Kind.SONG
});

enum PrimaryGenreName { INDO_POP, R_B_SOUL, POP, TURKISH, WORLDWIDE }

final primaryGenreNameValues = EnumValues({
    "Indo Pop": PrimaryGenreName.INDO_POP,
    "Pop": PrimaryGenreName.POP,
    "R&B/Soul": PrimaryGenreName.R_B_SOUL,
    "Turkish": PrimaryGenreName.TURKISH,
    "Worldwide": PrimaryGenreName.WORLDWIDE
});

enum WrapperType { TRACK }

final wrapperTypeValues = EnumValues({
    "track": WrapperType.TRACK
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
