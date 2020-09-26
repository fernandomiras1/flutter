// To parse this JSON data, do
//
//     final reqResRespuesta = reqResRespuestaFromJson(jsonString);

import 'dart:convert';

import 'package:paquetes/classes/persona.dart';

ReqResRespuesta reqResRespuestaFromJson(String str) =>
    ReqResRespuesta.fromJson(json.decode(str));

String reqResRespuestaToJson(ReqResRespuesta data) =>
    json.encode(data.toJson());

class ReqResRespuesta {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<Persona> data;

  ReqResRespuesta({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  factory ReqResRespuesta.fromJson(Map<String, dynamic> json) =>
      new ReqResRespuesta(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: new List<Persona>.from(
            json["data"].map((x) => Persona.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
