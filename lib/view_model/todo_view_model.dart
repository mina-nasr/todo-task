import 'package:flutter/cupertino.dart';
import 'package:to_do_mina_nasr/model/task.dart';
import 'package:to_do_mina_nasr/repository/task_repository.dart';

class TodoViewModel extends ChangeNotifier {
  List<TaskModel>? _todoList = [];

  List<TaskModel>? get taskList => _todoList;

  bool isLoading = true;

  final TaskRepository _taskRepository = TaskRepository();

  Future<void> fetchTaskList() {
    debugPrint("fetching taskList...");
    return _taskRepository.getAllTasks().then((value) {
      _todoList = value;
      debugPrint("succeeded fetch: $_todoList");
    }).catchError((error) {
      debugPrint('failed to fetch task list: ${error.toString()}');
    }).whenComplete(notifyListeners);
  }

  Future<void> addTask(TaskModel task) {
    return _taskRepository
        .insertTask(task)
        .catchError((error) {})
        .whenComplete(() {
      notifyListeners();
    });
  }

  Future<void> onCompletedTask(int index, bool isChecked) {
    dynamic updatedTaskMap =
        _todoList![index].changeIsDone(_todoList![index].toMap(), isChecked);
    TaskModel updatedTask = TaskModel.fromMap(updatedTaskMap);
    return _taskRepository
        .updateTask(updatedTask)
        .catchError((error) {})
        .whenComplete(() {
      _todoList![index] = updatedTask;
      notifyListeners();
    });
  }

  Future<void> deleteTask(int index) {
    return _taskRepository.deleteTask(index).catchError((error) {
      debugPrint('failed to delete task: ${error.toString()}');
    }).whenComplete(() {
      notifyListeners();
      fetchTaskList();
    });
  }
}
