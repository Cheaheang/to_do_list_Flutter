import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/widget/task.dart';
import 'package:to_do_list_flutter/widget/taskList.dart';
import 'package:to_do_list_flutter/widget/taskTile.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  TaskList({required this.tasks});
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
   
  @override
  Widget build(BuildContext context) {
    return ListView.builder(



      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {

              final String task = widget.tasks[index].toString(); 
        return Dismissible(

              key: Key(task as String),
              onDismissed: (direction) {
                 setState(() {
                  widget.tasks.removeAt(index);
                });

                // Then show a snackbar.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$task+ index') ));
              },
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.red),
              child: TaskTile(
          check:widget.tasks[index].isDone,
          taskTile: widget.tasks[index].name,
          checkboxCallback: (bool? checkboxState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        ) 
            ); 
      //   return TaskTile(
      //     check:widget.tasks[index].isDone,
      //     taskTile: widget.tasks[index].name,
      //     checkboxCallback: (bool? checkboxState) {
      //       setState(() {
      //         widget.tasks[index].toggleDone();
      //       });
      //     },
      //   );
      // },
      // itemCount: widget.tasks.length,
      }
    );
  }
}
