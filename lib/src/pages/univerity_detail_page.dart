import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prueba_tyba/src/models/university.dart';

class UniversityDetailPage extends StatefulWidget {
  const UniversityDetailPage({Key? key, required this.university})
      : super(key: key);

  final University university;

  @override
  State<UniversityDetailPage> createState() => _UniversityDetailPageState();
}

class _UniversityDetailPageState extends State<UniversityDetailPage> {
  late String _imagePath = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.university.name!),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.of(context).pop();
/*               ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Cambiar vista'))); */
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Name: ${widget.university.name!}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Country: ${widget.university.country!}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Page: ${widget.university.webPages?[0]}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Domain: ${widget.university.domains?[0]}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Code: ${widget.university.alphaTwoCode ?? ''}  ',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Province: ${widget.university.stateProvince ?? ''}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              _imagePath.isNotEmpty ? Image.file(File(_imagePath)) : Container()
            ]),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(50),
        child: Wrap(
          //will break to another line on overflow
          direction: Axis.horizontal, //use vertical to show  on vertical axis
          children: <Widget>[
            Container(
                margin: const EdgeInsets.all(10),
                child: FloatingActionButton(
                  onPressed: () async {
                    try {
                      ImagePicker _picker = ImagePicker();
                      final XFile? pickedFile = await _picker.pickImage(
                        source: ImageSource.camera,
                      );
                      print(pickedFile);
                      setState(() {});
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Icon(Icons.image),
                )), //button first

            Container(
                margin: const EdgeInsets.all(10),
                child: FloatingActionButton(
                  onPressed: () {
                    //action code for button 2
                  },
                  backgroundColor: Colors.deepPurpleAccent,
                  child: const Icon(Icons.camera_alt),
                )),
          ],
        ),
      ),
    );
  }
}
