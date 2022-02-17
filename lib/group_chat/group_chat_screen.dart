import 'package:flutter/material.dart';
import 'package:flutter_chatapp/group_chat/create_group/add_members.dart';
import 'package:flutter_chatapp/group_chat/group_chat_room.dart';

class GroupChatHomeScreen extends StatefulWidget {
  const GroupChatHomeScreen({Key? key}) : super(key: key);

  @override
  _GroupChatHomeScreenState createState() => _GroupChatHomeScreenState();
}

class _GroupChatHomeScreenState extends State<GroupChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
      ),
      body: ListView.builder(
        itemCount: 5,
          itemBuilder: (context,index){
              return ListTile(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => GroupChatRoom(),
                      ),
                  );
                },
                leading: Icon(Icons.group),
                title: Text("Group $index"),
              );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AddMembersInGroup(),
              ),

            );

          },
        tooltip: "Create Group",
        ),
    );
  }

}
