import 'package:flutter/material.dart';
import 'package:to_do_mina_nasr/model/task.dart';
import 'package:to_do_mina_nasr/view_model/todo_view_model.dart';

class TaskItem extends StatelessWidget {
  TaskItem(this._viewModel, this._index);

  // final void Function(TaskModel) onTap;
  final TodoViewModel _viewModel;
  final int _index;

  @override
  Widget build(BuildContext context) {
    TaskModel _task = _viewModel.taskList![_index];

    return Container(
      margin: const EdgeInsets.all(4),
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          _viewModel.deleteTask(_task.id!);
        },
        direction: DismissDirection.startToEnd,
        background: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.centerLeft,
          color: Colors.redAccent,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          margin: EdgeInsets.all(0),
          elevation: 2,
          child: InkWell(
            // onTap: () => onTap(_task),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _task.isDone == 1 ? true : false,
                    onChanged: (bool? value) {
                      _viewModel.onCompletedTask(_index, value ?? false);
                    },
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: DefaultTextStyle(
                            child: Text(
                              'Task: ${_task.title}',
                              // style: TextStyle(
                              //     decoration: _task.isDone
                              //         ? TextDecoration.lineThrough
                              //         : null),
                            ),
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.subtitle1!,
                            maxLines: 1,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: DefaultTextStyle(
                            child: Text('Description: ${_task.description}'),
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.caption!,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
