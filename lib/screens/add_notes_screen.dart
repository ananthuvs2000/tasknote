import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_notes_app/screens/expanded_screen.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final String description;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function (BuildContext)? deleteFunction;
  Function (BuildContext)? editFunction;
 VoidCallback navigateFunction;

   ToDoList({super.key,
       required this.taskName,
       required this.description,
       required this.taskCompleted,
       required this.onChanged,
        required this.deleteFunction,
        required this.editFunction,
        required this.navigateFunction,
       });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15,right:15,bottom: 1,top:15),
        
        child:Slidable(
          endActionPane: ActionPane(
            motion: ScrollMotion(), 
            children: [
              
              SlidableAction(onPressed: deleteFunction,
              
              borderRadius: BorderRadius.circular(12),
              icon: Icons.delete,
              backgroundColor: Color.fromRGBO(46, 78, 104, 1),),
              SlidableAction(onPressed: editFunction,
             
              borderRadius: BorderRadius.circular(12),
              icon: Icons.edit,
              backgroundColor: Colors.grey.shade700,)
            ],
          ),
        child:InkWell(
          onTap: () {
            navigateFunction!();
          },
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(25),
            child: Row(
              children: [
                //checkbox
        
                Checkbox(value: taskCompleted, onChanged: onChanged),
                Column(
                  children: [
                    Text(taskName,
                    style: taskCompleted? TextStyle(decoration: TextDecoration.lineThrough,fontSize: 22):TextStyle(decoration: TextDecoration.none,fontSize: 24),),
                    Text(description,style: TextStyle(fontSize: 16),),
                  ],
                ),
        
              ],
            )
            ,decoration: BoxDecoration(color:Colors.purple,borderRadius: BorderRadius.circular(12)
          ),
          ),
        )
    ),);
  }
}
