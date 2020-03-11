//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/help.dart';
import 'package:flutter_app/social_page.dart';
import 'work_page.dart';
import 'religion_page.dart';
//import 'package:shared_preferences/shared_preferences.dart';

main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  // var ff=[WorkPage(),ReligionPage()];
  List<String> total_tasks_list = [
    'You Have Not Did Any Task Yet',
    'You Have Already begin Congratulations',
    'Go On You Will Be Successful Soon'
  ];
  int total_tasks = religion + social + work;
  var cat_list = ['Work', '  Social', 'Religion', ''];
  var image_list = [
    'assets/img0.jpg',
    'assets/img1.jpg',
    'assets/img2.jpg',
    'assets/img3.jpg'
  ];
  void St() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: ('Your Inspector'),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.red,
        fontFamily: 'Georgia',
        textTheme: TextTheme(
            headline: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 35, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 25, fontFamily: 'Hind')),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome To Your Inspector",
              style: TextStyle(color: Colors.pink)),
        ),
        body: Column(children: <Widget>[
          Container(
            height: 150,
            width: 400,
            child: Center(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    '  You Should Always Be A Man Of Success And Value',
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.blue,
                  ),
                )
              ],
            )

                ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, var index) {
                  return Stack(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            if (image_list[index] == 'assets/img0.jpg') {
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => WorkPage()));
                              });
                            } else if (image_list[index] == 'assets/img2.jpg') {
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ReligionPage()));
                              });
                            } else if (image_list[index] == 'assets/img1.jpg') {
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SocialPage()));
                              });
                            }else { setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Help()));
                            });

                            }
                          },
                          child: Center(
                            child: Image.asset(
                              image_list[index],
                              fit: BoxFit.cover,
                              width: 200,
                            ),
                          )),
                      Center(
                        child: Text(
                          cat_list[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.pink),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Center(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (total_tasks == 0)
                        print(total_tasks_list[0]);
                      else if (total_tasks <= 10)
                        print(total_tasks_list[1]);
                      else
                        print(total_tasks_list[2]);
                    },
                    child: RaisedButton(
                      child: Text(
                        'Show My Status',
                        style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
