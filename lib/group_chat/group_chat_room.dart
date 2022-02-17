import 'package:flutter/material.dart';
import 'package:flutter_chatapp/group_chat/group_info.dart';

class GroupChatRoom extends StatelessWidget {
  GroupChatRoom({Key? key}) : super(key: key);

  final TextEditingController _message = TextEditingController();
  String currentUserName = "User1";
  List<Map<String, dynamic>> dummyList = [
    {"message": "User1 created this group", "type": "Notify"},
    {
      "message": "Hello this is User1",
      "sendby": "User1",
      "type": "Text",
    },
    {
      "message": "Hello this is User6",
      "sendby": "User6",
      "type": "Text",
    },
    {
      "message": "Hello this is User4",
      "sendby": "User4",
      "type": "Text",
    },
    {
      "message": "Hello this is User2",
      "sendby": "User2",
      "type": "Text",
    },
    {
      "message": "User1 added User8",
      "type": "Notify",
    }
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Group Name'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => GroupInfo(),
                  )),
              icon: Icon(Icons.more_vert)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height / 1.27,
              width: size.width,
              child: ListView.builder(
                itemCount: dummyList.length,
                itemBuilder: (context, index) {
                  return messageTile(size, dummyList[index]);
                },
              ),
            ),
            Container(
              height: size.height / 10,
              width: size.width,
              alignment: Alignment.center,
              child: Container(
                height: size.height / 12,
                width: size.width / 1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height / 17,
                      width: size.width / 1.3,
                      child: TextField(
                        controller: _message,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.photo),
                            ),
                            hintText: "Send Message",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                      ),
                    ),
                    IconButton(icon: Icon(Icons.send), onPressed: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageTile(Size size, Map<String, dynamic> chatMap) {
    return Builder(builder: (_) {
      if (chatMap['type'] == "Text") {
        return Container(
          width: size.width,
          alignment: chatMap['sendby'] == currentUserName
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Text(
                  chatMap['sendby'],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height / 200,
                ),
                Text(
                  chatMap['message'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (chatMap['type'] == 'img') {
        return Container(
          width: size.width,
          alignment: chatMap['sendby'] == currentUserName
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            height: size.height / 2,
            child: Image.network(chatMap['message']),
          ),
        );
      } else if (chatMap['type'] == 'Notify') {
        return Container(
          width: size.width,
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black38,
            ),
            child: Text(
              chatMap['message'],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    });
  }
}
