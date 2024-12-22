import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/training_model.dart';

class HomeProvider extends ChangeNotifier{
  late List<Training> training = [];

  List<Training> get trainings => training;

  Future<void> loadJsonAsset() async {
    final String jsonString =
    await rootBundle.loadString('assets/training.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
      training = TrainingModel.fromJson(jsonMap).training;
    notifyListeners();
  }
}