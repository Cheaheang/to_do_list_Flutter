import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/widget/showModalButtomSheet.dart';
import 'package:to_do_list_flutter/widget/task.dart';
import 'package:to_do_list_flutter/widget/taskTile.dart';
import 'package:to_do_list_flutter/widget/tasklist.dart';

class HomePageWidget extends StatefulWidget {

  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  List<Task> tasks = [
    Task(name: "buy susage"),
    Task(name: "do excerise"),
    Task(name: "clean house")
  ];

bool check = false;

 

String? taskTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => ShowModalButtomSheet(
                    addFunc: (p0) {
                      setState(() {
                        tasks.add(Task(name: p0));
                
                      });
                     Navigator.pop(context);

                    },
                  ));
        },
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Column(
          
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(12),
                width: double.infinity,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.lightBlueAccent,
                      radius: 30,
                      child: Icon(Icons.clear_all),
                    ),
                    Text(
                      'Today',
                      style: TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(tasks.length.toString()+'list')
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: TaskList(tasks: tasks,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
