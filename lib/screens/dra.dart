import 'package:flutter/material.dart';
import 'package:todo_notes_app/screens/settings_page.dart';

class DrawerCustomer extends StatelessWidget {
  const DrawerCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // shadowColor: Colors.black,
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture:
               CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('data:image/png;base64,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'),
              ),
              accountName: Text('Ananthu'), accountEmail: Text('ananthu@gmail.com')),
               Container(
                color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Row(
                children:[
                  Icon(Icons.info),
                  SizedBox(width: 16.0),
                  Text('Additional Information'),
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
          ],
    
        ),
      );
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


// drawerTile(text: "Notes", iconName: Icons.lightbulb_outline),
//               drawerTile(
//                   text: "Reminders",
//                   iconName: Icons.notifications_none_outlined),
//               drawerTile(text: "Create new label", iconName: Icons.add),
//               drawerTile(text: "Archive", iconName: Icons.archive_outlined),
//               drawerTile(
//                   text: "Deleted", iconName: Icons.delete_outline_outlined),
//               InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SettingsPage(),
//                       ));
//                 },
//                 child: drawerTile(
//                     text: "Settings", iconName: Icons.settings_outlined),
//               ),
//               drawerTile(
//                   text: "Help & feedback",
//                   iconName: Icons.help_outline_outlined)