import 'package:firebase_demo/models/intern_model.dart';
import 'package:firebase_demo/repository/interns_repo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddDetails extends StatefulWidget {
  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  DetailsRepository detailsRepository;

  String name;
  String dept;
  @override
  @override
  void initState() {
    detailsRepository = DetailsRepository();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Full Name'),
              onChanged: (value) {
                name = value;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(hintText: 'Department'),
              onChanged: (value) {
                dept = value;
              },
            ),
            SizedBox(height: 35),
            RaisedButton(
              color: Colors.red,
              child: Text("Add Dtails"),
              onPressed: () async {
                Internship internship = Internship(
                  name: name,
                  dept: dept,
                );
                name != null
                    ? dept != null
                        ? detailsRepository.addItem(internship)
                        : Fluttertoast.showToast(
                        msg: "Department Should not be null",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0)
                    : Fluttertoast.showToast(
                        msg: "Name Should not be null",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
