import 'package:to_do_mina_nasr/utils/database_provider.dart';

import '../model/task.dart';

class TaskRepository {
  final databaseProvider = DatabaseProvider();
  static const taskTable = 'Task';

  Future<List<TaskModel>> getAllTasks() async {
    final db = await databaseProvider.database;
    final result = await db.rawQuery('SELECT * FROM $taskTable');
    return result.map((json) => TaskModel.fromMap(json)).toList();
  }

  Future<void> insertTask(TaskModel task) async {
    final db = await databaseProvider.database;
    await db.insert(taskTable, task.toMap());
  }

  Future<void> updateTask(TaskModel task) async {
    final db = await databaseProvider.database;
    await db
        .update(taskTable, task.toMap(), where: 'id =?', whereArgs: [task.id]);
  }

  Future<void> deleteTask(int id) async {
    final db = await databaseProvider.database;
    await db.rawDelete('DELETE FROM $taskTable WHERE id =?', [id]);
  }
}
