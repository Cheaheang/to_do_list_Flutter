import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/homePage.dart';

class TaskTile extends StatelessWidget {
  final bool check;
  final String? taskTile;
  final Function(bool?) checkboxCallback;
  TaskTile({required this.check, this.taskTile, required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskTile.toString(),
          style:
              TextStyle(decoration: check ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          // checkboxState: check,
          value: check,
          onChanged: checkboxCallback,
        ));
  }
}

// class TaskTile extends StatefulWidget {
//   const TaskTile({super.key});

// TaskTile({
//   this.text,
//   this.check ,
// });
// final String? text;
// final bool? check;
//   @override
//   State<TaskTile> createState() => _TaskTileState();
// }

// class _TaskTileState extends State<TaskTile> {

// void toggleFunctionCalledBack(bool? checkboxState) {
//     setState(() {
//       check = checkboxState ?? true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         title: Text(
//            'what the hilde'
//           ,style:
//               TextStyle(decoration: check ? TextDecoration.lineThrough : null),
//         )
// trailing: CheckedBox(
//     checkboxState: check,
//     toggleCheckboxState: toggleFunctionCalledBack));
//   }
// }

class CheckedBox extends StatelessWidget {
  final bool? checkboxState;
  final Function(bool?) toggleCheckboxState;
  const CheckedBox({this.checkboxState, required this.toggleCheckboxState});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}
