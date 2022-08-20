import 'package:flutter/material.dart';
import 'package:prueba_tyba/src/pages/univerity_detail_page.dart';

import '../models/university.dart';

class ItemListUniversity extends StatelessWidget {
  final University university;
  const ItemListUniversity({Key? key, required this.university})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(university.name!),
      subtitle: Text(university.country!),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext) {
          return UniversityDetailPage(university: university);
        }));
      },
    );
  }
}
