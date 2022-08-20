import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tyba/src/pages/univerities_page.dart';
import 'package:prueba_tyba/src/services/universities_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UniversitiesServices())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UniversitiesPage(title: 'Tyba'),
      ),
    );
  }
}
