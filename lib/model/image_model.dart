import 'dart:convert';

Verifyclass verifyclassFromJson(String str) => Verifyclass.fromJson(json.decode(str));

class Verifyclass {
    final bool unsafe;
    final List<Object> objects;

    Verifyclass({
        required this.unsafe,
        required this.objects,
    });

    factory Verifyclass.fromJson(Map<String, dynamic> json) => Verifyclass(
        unsafe: json["unsafe"],
        objects: List<Object>.from(json["objects"].map((x) => Object.fromJson(x))),
    );
}

class Object {
    final List<int> box;
    final double score;
    final String label;

    Object({
        required this.box,
        required this.score,
        required this.label,
    });

    factory Object.fromJson(Map<String, dynamic> json) => Object(
        box: List<int>.from(json["box"].map((x) => x)),
        score: json["score"]?.toDouble(),
        label: json["label"],
    );
}
