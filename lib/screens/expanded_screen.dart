import 'package:flutter/material.dart';
import 'package:todo_notes_app/models/task_screen.dart';
import 'package:todo_notes_app/screens/home_page.dart';


class FullScreen extends StatefulWidget {
  late  String taskName;
  late  String description;
 

  FullScreen({required this.taskName, required this.description});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  late TextEditingController taskNameController;
  late TextEditingController descriptionController;
  @override
  void initState() {
    super.initState();
    taskNameController = TextEditingController(text: widget.taskName);
    descriptionController = TextEditingController(text: widget.description);
  }
  @override
  void dispose() {
    taskNameController.dispose();
    descriptionController.dispose();
    super.dispose();

  }
  void _saveChanges() {
    // Save edited content
    setState(() {
      widget.taskName = taskNameController.text;
      widget.description = descriptionController.text;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo',style: TextStyle(color: Colors.black,fontSize: 20),),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
         
          children: [
           
           
              TextField(controller: taskNameController,style: TextStyle(fontSize: 26),decoration: InputDecoration(
                enabledBorder: InputBorder.none,focusedBorder: InputBorder.none
              ),),
            TextField(controller: descriptionController,style: TextStyle(fontSize: 20),decoration: InputDecoration(
                enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
              ),),
          //  TextButton(onPressed: () {
            
          //    _saveChanges();
          //   Navigator.pop(context);
             
          //  }, child: Text('Save')),
          ],
        ),
      ),
    );
  }
}
