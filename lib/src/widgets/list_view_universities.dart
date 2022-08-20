import 'package:flutter/material.dart';
import 'package:prueba_tyba/src/models/university.dart';
import 'package:prueba_tyba/src/widgets/item_list.dart';

class ListViewUniversities extends StatelessWidget {
  final List<University> universities;

  const ListViewUniversities(this.universities);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: universities.length,
        itemBuilder: (BuildContext context, index) {
          return ItemListUniversity(university: universities[index]);
        });
  }
}
