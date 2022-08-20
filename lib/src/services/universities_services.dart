import 'package:flutter/material.dart';
import 'package:prueba_tyba/src/models/university.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const _URL =
    'https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/universities.json';

class UniversitiesServices with ChangeNotifier {
  List<University> universities = [];

  UniversitiesServices() {
    getUniversities();
  }

  getUniversities() async {
    try {
      final response = await http.get(Uri.parse(_URL));
      final responseMapper = universityFromJson(response.body);
      universities.addAll(responseMapper);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
