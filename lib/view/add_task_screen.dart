import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_mina_nasr/model/task.dart';
import 'package:to_do_mina_nasr/view_model/todo_view_model.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final taskTitleController = TextEditingController();
  final taskDescriptionController = TextEditingController();

  @override
  void dispose() {
    taskTitleController.dispose();
    super.dispose();
  }

  void onAdd() {
    final String textVal = taskTitleController.text;
    final String descriptionVal = taskTitleController.text;
    if (textVal.isNotEmpty) {
      final TaskModel todo = TaskModel(
        title: textVal,
        description: descriptionVal,
      );
      Provider.of<TodoViewModel>(context, listen: false).addTask(todo);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Task'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(controller: taskTitleController),
                  TextField(controller: taskDescriptionController),
                  ElevatedButton(
                    child: const Text('Add'),
                    onPressed: onAdd,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
