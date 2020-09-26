class RegionalBloc {
    String acronym;
    String name;
    List<String> otherAcronyms;
    List<String> otherNames;

    RegionalBloc({
        this.acronym,
        this.name,
        this.otherAcronyms,
        this.otherNames,
    });

    factory RegionalBloc.fromJson(Map<String, dynamic> json) => new RegionalBloc(
        acronym: json["acronym"],
        name: json["name"],
        otherAcronyms: new List<String>.from(json["otherAcronyms"].map((x) => x)),
        otherNames: new List<String>.from(json["otherNames"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "acronym": acronym,
        "name": name,
        "otherAcronyms": new List<dynamic>.from(otherAcronyms.map((x) => x)),
        "otherNames": new List<dynamic>.from(otherNames.map((x) => x)),
    };
}