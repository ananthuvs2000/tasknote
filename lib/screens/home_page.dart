import 'package:flutter/material.dart';
import 'package:todo_notes_app/models/task_screen.dart';
import 'package:todo_notes_app/screens/add_notes_screen.dart';
import 'package:todo_notes_app/screens/dialog.dart';
import 'package:todo_notes_app/screens/expanded_screen.dart';
import 'package:todo_notes_app/screens/settings_page.dart';


class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  late TextEditingController taskNameController;
  late TextEditingController descriptionController;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController _controller= TextEditingController();
  late TextEditingController desccontroller=TextEditingController();
  
  //  @override
  // void initState() {
  //   super.initState();
  //   taskNameController = TextEditingController(text: _controller.text);
  //   descriptionController = TextEditingController(text: desccontroller.text);
  // }
  
  List toDoList = [];

  void SaveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false,desccontroller.text,false]);
      desccontroller.clear();
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
  void edittheTask(int index){
  setState(() {
   toDoList[index][0]= _controller.text;
   toDoList[index][2]=desccontroller.text; 
   _controller.clear();

  });
     
   
   Navigator.of(context).pop();
  }

  void editTask(int index){
   showDialog(context: context, builder: (context){
        return DialogBox(
          controller: _controller,
          desc_controller: desccontroller,
          onSave: ()=>edittheTask(index),

          onCancel: ()=>Navigator.of(context).pop(),
        );
      }); 

  }

  

  void createNewTask(){
      showDialog(context: context, builder: (context){
        return DialogBox(
          controller: _controller,
          desc_controller: desccontroller,
          onSave: SaveNewTask,
          onCancel: ()=>Navigator.of(context).pop(),
        );
      });
  }


  void deleteTask(int index){
     
    setState(() {
       toDoList.removeAt(index);
    });

  }
  void navigateTask(int index)async{
   await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FullScreen(
        taskName: toDoList[index][0],
        description: toDoList[index][2], 
       
      ),
    ),
  );
  }


  void checkBoxChanged(bool? value,int index){
  setState(() {
    toDoList[index][1]=!toDoList[index][1];
  });
}

  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade800,
        title:const Center(child: Text("ToDo          ",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
    ),),
    floatingActionButton: FloatingActionButton(
    onPressed: createNewTask,
    child:const Icon(Icons.add)
    ),
      drawer: Drawer(
          child: Column(
           
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                
                decoration: BoxDecoration(color: Colors.blue),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/images/download.png'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Ananthu Vs",style: TextStyle(fontSize: 18),),
                  Row(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  Text("ananthuv009@gmail.com")
                ],
              )),
             
              drawerTile(text: "Notes", iconName: Icons.lightbulb_outline),
              drawerTile(
                  text: "Reminders",
                  iconName: Icons.notifications_none_outlined),
              drawerTile(text: "Create new label", iconName: Icons.add),
              drawerTile(text: "Archive", iconName: Icons.archive_outlined),
              drawerTile(
                  text: "Deleted", iconName: Icons.delete_outline_outlined),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ));
                },
                child: drawerTile(
                    text: "Settings", iconName: Icons.settings_outlined),
              ),
              drawerTile(
                  text: "Help & feedback",
                  iconName: Icons.help_outline_outlined)
            ],
          ),
        ),
      bottomNavigationBar: Container(
          color: Colors.grey.shade900,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.check_box_outlined,
                color: Colors.white54,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.brush_outlined, color: Colors.white54),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.mic_none_sharp, color: Colors.white54),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.image_outlined, color: Colors.white54),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
    body:Container(
      color: Colors.grey.shade100,
    child:ListView.builder(
      itemCount: toDoList.length,
      itemBuilder: ((context, index) {
        return ToDoList(taskName: toDoList[index][0], description: toDoList[index][2],taskCompleted: toDoList[index][1], onChanged: (value)=>checkBoxChanged(value,index),deleteFunction: (context)=>deleteTask(index),editFunction: (context)=>editTask(index),navigateFunction: () => navigateTask(index),);
      }),

    )
    ),);

  }
  drawerTile({String? text, IconData? iconName}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        selectedColor: Colors.black87,
        selected: true,
        title: Text(text!),
        leading: Icon(iconName!),
      ),
    );
  }
}

