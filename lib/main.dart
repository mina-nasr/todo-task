import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_mina_nasr/model/task.dart';
import 'package:to_do_mina_nasr/view/home.dart';
import 'package:to_do_mina_nasr/view_model/todo_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoViewModel(),
      child: MaterialApp(
        title: 'Todo App Mina Nasr',
        theme: ThemeData.dark(),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
