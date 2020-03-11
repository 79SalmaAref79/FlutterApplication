import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help Page',
          style: TextStyle(color: Colors.pink),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  "To Be Happy And successful In Your Life You Should Balance Between "
                  "Your Work, Family ,And Your Relation With Yor God."
                  "So All You Have To Done To Determine Your Tasks And Goals In Each Categoty "
                  "And Check That You Have Did It.",
                  style: TextStyle(color: Colors.pink, fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
