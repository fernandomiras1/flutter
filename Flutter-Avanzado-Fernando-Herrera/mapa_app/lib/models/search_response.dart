// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
    SearchResponse({
        this.type,
        this.query,
        this.features,
        this.attribution,
    });

    String type;
    List<String> query;
    List<Feature> features;
    String attribution;

    factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        type: json["type"],
        query: List<String>.from(json["query"].map((x) => x)),
        features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
        attribution: json["attribution"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "query": List<dynamic>.from(query.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "attribution": attribution,
    };
}

class Feature {
    Feature({
        this.id,
        this.type,
        this.placeType,
        this.relevance,
        this.properties,
        this.textEs,
        this.languageEs,
        this.placeNameEs,
        this.text,
        this.language,
        this.placeName,
        this.bbox,
        this.center,
        this.geometry,
        this.context,
        this.matchingText,
        this.matchingPlaceName,
    });

    String id;
    String type;
    List<String> placeType;
    int relevance;
    Properties properties;
    String textEs;
    Language languageEs;
    String placeNameEs;
    String text;
    Language language;
    String placeName;
    List<double> bbox;
    List<double> center;
    Geometry geometry;
    List<Context> context;
    String matchingText;
    String matchingPlaceName;

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json["id"],
        type: json["type"],
        placeType: List<String>.from(json["place_type"].map((x) => x)),
        relevance: json["relevance"],
        properties: Properties.fromJson(json["properties"]),
        textEs: json["text_es"],
        languageEs: languageValues.map[json["language_es"]],
        placeNameEs: json["place_name_es"],
        text: json["text"],
        language: languageValues.map[json["language"]],
        placeName: json["place_name"],
        bbox: json["bbox"] == null ? null : List<double>.from(json["bbox"].map((x) => x.toDouble())),
        center: List<double>.from(json["center"].map((x) => x.toDouble())),
        geometry: Geometry.fromJson(json["geometry"]),
        context: List<Context>.from(json["context"].map((x) => Context.fromJson(x))),
        matchingText: json["matching_text"] == null ? null : json["matching_text"],
        matchingPlaceName: json["matching_place_name"] == null ? null : json["matching_place_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "place_type": List<dynamic>.from(placeType.map((x) => x)),
        "relevance": relevance,
        "properties": properties.toJson(),
        "text_es": textEs,
        "language_es": languageValues.reverse[languageEs],
        "place_name_es": placeNameEs,
        "text": text,
        "language": languageValues.reverse[language],
        "place_name": placeName,
        "bbox": bbox == null ? null : List<dynamic>.from(bbox.map((x) => x)),
        "center": List<dynamic>.from(center.map((x) => x)),
        "geometry": geometry.toJson(),
        "context": List<dynamic>.from(context.map((x) => x.toJson())),
        "matching_text": matchingText == null ? null : matchingText,
        "matching_place_name": matchingPlaceName == null ? null : matchingPlaceName,
    };
}

class Context {
    Context({
        this.id,
        this.wikidata,
        this.shortCode,
        this.textEs,
        this.languageEs,
        this.text,
        this.language,
    });

    Id id;
    Wikidata wikidata;
    String shortCode;
    Text textEs;
    Language languageEs;
    Text text;
    Language language;

    factory Context.fromJson(Map<String, dynamic> json) => Context(
        id: idValues.map[json["id"]],
        wikidata: wikidataValues.map[json["wikidata"]],
        shortCode: json["short_code"] == null ? null : json["short_code"],
        textEs: textValues.map[json["text_es"]],
        languageEs: languageValues.map[json["language_es"]],
        text: textValues.map[json["text"]],
        language: languageValues.map[json["language"]],
    );

    Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "wikidata": wikidataValues.reverse[wikidata],
        "short_code": shortCode == null ? null : shortCode,
        "text_es": textValues.reverse[textEs],
        "language_es": languageValues.reverse[languageEs],
        "text": textValues.reverse[text],
        "language": languageValues.reverse[language],
    };
}

enum Id { REGION_8385999877823510, COUNTRY_9654124497801190, PLACE_8666728248786980 }

final idValues = EnumValues({
    "country.9654124497801190": Id.COUNTRY_9654124497801190,
    "place.8666728248786980": Id.PLACE_8666728248786980,
    "region.8385999877823510": Id.REGION_8385999877823510
});

enum Language { ES }

final languageValues = EnumValues({
    "es": Language.ES
});

enum Text { PROVINCIA_DE_CRDOBA, ARGENTINA, CRDOBA }

final textValues = EnumValues({
    "Argentina": Text.ARGENTINA,
    "Córdoba": Text.CRDOBA,
    "Provincia de Córdoba": Text.PROVINCIA_DE_CRDOBA
});

enum Wikidata { Q44759, Q414, Q44210 }

final wikidataValues = EnumValues({
    "Q414": Wikidata.Q414,
    "Q44210": Wikidata.Q44210,
    "Q44759": Wikidata.Q44759
});

class Geometry {
    Geometry({
        this.type,
        this.coordinates,
    });

    String type;
    List<double> coordinates;

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    };
}

class Properties {
    Properties({
        this.wikidata,
        this.shortCode,
        this.landmark,
        this.address,
        this.foursquare,
        this.category,
        this.maki,
    });

    String wikidata;
    String shortCode;
    bool landmark;
    String address;
    String foursquare;
    String category;
    String maki;

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        wikidata: json["wikidata"],
        shortCode: json["short_code"] == null ? null : json["short_code"],
        landmark: json["landmark"] == null ? null : json["landmark"],
        address: json["address"] == null ? null : json["address"],
        foursquare: json["foursquare"] == null ? null : json["foursquare"],
        category: json["category"] == null ? null : json["category"],
        maki: json["maki"] == null ? null : json["maki"],
    );

    Map<String, dynamic> toJson() => {
        "wikidata": wikidata,
        "short_code": shortCode == null ? null : shortCode,
        "landmark": landmark == null ? null : landmark,
        "address": address == null ? null : address,
        "foursquare": foursquare == null ? null : foursquare,
        "category": category == null ? null : category,
        "maki": maki == null ? null : maki,
    };
}

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
