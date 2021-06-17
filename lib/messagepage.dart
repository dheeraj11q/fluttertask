import 'package:flutter/material.dart';
import 'package:fluttertask/apis/homeApi.dart';

class Messagepage extends StatefulWidget {
  @override
  _MessagepageState createState() => _MessagepageState();
}

class _MessagepageState extends State<Messagepage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Message"),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              String user = HomeApi.images[index];
              return Container(
                  child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: size.width * 0.08,
                        backgroundImage: NetworkImage(user),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Text(
                        'Username',
                        style: TextStyle(fontSize: size.width * 0.05),
                      )
                    ],
                  ),
                ),
              ));
            }));
  }
}
