import 'package:flutter/material.dart';


class DialogBox extends StatelessWidget {
  final controller;
  final desc_controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key,required this.controller,required this.onSave,required this.onCancel,required this.desc_controller});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      content: Container(
        height: 200,
        child: Column(
          children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hoverColor: Colors.cyan,
                  border: OutlineInputBorder(
                  ),
                    hintText: "Add New Task"
                  )
                ),
                
            ),
             Padding(
            padding: EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: desc_controller,
                decoration: InputDecoration(
                  hoverColor: Colors.cyan,
                  border: OutlineInputBorder(
                  ),
                    hintText: "Add Description"
                  )
                ),
                
            ),
            
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                ElevatedButton(child:Text( "Save"), onPressed: onSave),
                SizedBox(height: 35,width: 35),
                  ElevatedButton(child:Text( "Cancel"),  onPressed: onCancel)
                ],
              )

          ],

        ),
      ),
    );
  }
}
// AlertDialog(
//           title: Text('Add Task'),
//           content: Column(
//             children: [
//               TextFormField(
//                 controller: _controller,
                

//               ),
//               TextButton(onPressed: () {
                
//               }, child: Text('Save'))
//             ],
//           ),
//         );
