import 'package:firebase_demo/pages/add_details.dart';
import 'package:firebase_demo/pages/view_details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        child: Center(
          child: Column(children: [
            Spacer(),
            GestureDetector(
              child:Container(alignment: Alignment.center,
                color: Colors.blue,
              height: 35,
              width: 100,
              child: Text("Add User"),),
              onTap : (){Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AddDetails();
                                  },
                                ),
                              );},
            ),

          SizedBox(height:20),
             
            GestureDetector(
              child:Container(alignment: Alignment.center,
                color: Colors.blue,
              height: 35,
              width: 100,
              child: Text("View Interns"),),
              onTap: (){Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ViewDetails();
                                  },
                                ),
                              );},
            ),
            Spacer(),

          ],)
        ),
      ),
    );
  }
}
