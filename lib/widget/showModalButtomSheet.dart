import 'package:flutter/material.dart';
  
class ShowModalButtomSheet extends StatelessWidget {
  final Function(String) addFunc;
  ShowModalButtomSheet({required this.addFunc});
  
  @override
  Widget build(BuildContext context) {
  String? userInput;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(14),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Text(
                textAlign: TextAlign.center,
                'Add list ',
                style: TextStyle(fontSize: 24, color: Colors.blueAccent),
              ),
            ),
            Container(
              child: TextField(
                onChanged: (value) {
                  userInput = value;
                  print(userInput);
                  
                },
                // controller: myController,
                autofocus: true,
              ),
            ),
            Container(
              // padding: EdgeInsets.symmetric(vertical:18),

              child: ElevatedButton(
                onPressed: () {
                  // setState(() {
                  //   tasks.add(Task(name:myController.text,isDone: false));
                  // },
                  // );
                  addFunc(userInput.toString());
                  
                


                 },
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
