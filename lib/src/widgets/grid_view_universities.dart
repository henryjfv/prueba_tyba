import 'package:flutter/material.dart';
import 'package:prueba_tyba/src/models/university.dart';

import 'item_list.dart';

class GridViewUniversities extends StatelessWidget {
  final List<University> universities;

  const GridViewUniversities(this.universities);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      children: [
        ...universities.map((e) => Card(
              child: ItemListUniversity(university: e),
            ))
      ],
    );
  }
}
