import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:to_do_mina_nasr/view/add_task_screen.dart';
import 'package:to_do_mina_nasr/view_model/todo_view_model.dart';
import 'package:to_do_mina_nasr/widgets/todo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<TodoViewModel>(context, listen: false).fetchTaskList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TodoViewModel viewModel = Provider.of<TodoViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Todo App"),
        ),
        body: viewModel.taskList == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: viewModel.taskList!.length,
                itemBuilder: (context, index) {
                  return TaskItem(viewModel, index);
                },
              ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            openTaskAddPage(context, viewModel);
          },
        ));
  }

  void openTaskAddPage(BuildContext context, TodoViewModel viewModel) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskScreen()),
    ).then((value) {
      viewModel.fetchTaskList();
    });
  }
}
