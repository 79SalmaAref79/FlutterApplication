import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

int social = 0;

class SocialPage extends StatefulWidget {
  @override
  State<SocialPage> createState() => SocialPageState();
}

class SocialPageState extends State<SocialPage> {
  TextEditingController _controller = TextEditingController();
  List<String> tasks = [];

  getdata() async {
    SharedPreferences preferences1 = await SharedPreferences.getInstance();
    setState(() {
      tasks = preferences1.getStringList('Tasks') ?? [];
      //    return tasks;
    });
  }

  savedata() async {
    SharedPreferences preferences1 = await SharedPreferences.getInstance();
    preferences1.setStringList('Tasks', tasks);
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Social Tasks',
          style: TextStyle(color: Colors.pink),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
                itemCount: tasks.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4),
                itemBuilder: (_, index) {
                  return InkWell(
                    splashColor: Colors.blueGrey,
                    highlightColor: Colors.grey,
                    onDoubleTap: () {
                      setState(() {
                        tasks.removeAt(index);
                        savedata();
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.pink,
                          )),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              tasks[index],
                              style: TextStyle(color: Colors.pink),
                            )),
                            Card(
                              child: IconButton(
                                color: Colors.blue,
                                icon: Icon(Icons.done),
                                onPressed: () {
                                  social++;
                                },
                              ),
                            )
                          ]),
                    ),
                  );
                }),
          ),
          Card(
            elevation: 2,
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _controller,
                  cursorColor: Colors.red,
                  maxLength: 20,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Enter Your  Task',
                  ),
                ),
              ],
            ),
          ),
          RaisedButton(
            child: Text('Add A Task'),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                setState(() {
                  tasks.add(_controller.text);

                  _controller.clear();
                  savedata();
                });
              }
            },
          )
        ],
      ),
    );
  }
}
