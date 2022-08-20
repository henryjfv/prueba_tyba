import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tyba/src/services/universities_services.dart';
import 'package:prueba_tyba/src/widgets/list_view_universities.dart';

import '../widgets/grid_view_universities.dart';

class UniversitiesPage extends StatefulWidget {
  const UniversitiesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UniversitiesPage> createState() => _UniversitiesPageState();
}

class _UniversitiesPageState extends State<UniversitiesPage> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    final universitiesService = Provider.of<UniversitiesServices>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.line_style),
            onPressed: () {
              flag = !flag;
              setState(() {});
/*               ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Cambiar vista'))); */
            },
          ),
        ],
      ),
      body: Center(
        child: universitiesService.universities.isNotEmpty
            ? Container(
                child: flag
                    ? ListViewUniversities(universitiesService.universities)
                    : GridViewUniversities(universitiesService.universities))
            : const Text('Lo sentimos!. Algo no va bien'),
      ),
    );
  }
}
