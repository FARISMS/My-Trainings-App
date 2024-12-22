import 'dart:convert';

class TrainingModel {
  final List<Training> training;

  TrainingModel({
    required this.training,
  });

  factory TrainingModel.fromRawJson(String str) => TrainingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrainingModel.fromJson(Map<String, dynamic> json) => TrainingModel(
    training: List<Training>.from(json["training"].map((x) => Training.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "training": List<dynamic>.from(training.map((x) => x.toJson())),
  };
}

class Training {
  final String name;
  final String date;
  final String startTime;
  final String endTime;
  final String venue;
  final String trainerName;
  final String trainerImage;

  Training({
    required this.name,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.venue,
    required this.trainerName,
    required this.trainerImage,
  });

  factory Training.fromRawJson(String str) => Training.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Training.fromJson(Map<String, dynamic> json) => Training(
    name: json["name"],
    date: json["date"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    venue: json["venue"],
    trainerName: json["trainer_name"],
    trainerImage: json["trainer_image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "date": date,
    "startTime": startTime,
    "endTime": endTime,
    "venue": venue,
    "trainer_name": trainerName,
    "trainer_image": trainerImage,
  };
}
