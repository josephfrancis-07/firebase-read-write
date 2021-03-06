

import 'package:firebase_demo/repository/interns_repo.dart';
import 'package:flutter/material.dart';

class ViewDetails extends StatefulWidget {
  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  DetailsRepository detailsRepository;

  @override
  @override
  void initState() {
    detailsRepository = DetailsRepository();

    super.initState();
  }

  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DetailsRepository().getItemsStream(),
        builder: (BuildContext buildContext, AsyncSnapshot snapshot) =>
            !snapshot.hasData
                ? Center(child: CircularProgressIndicator())
                : Scaffold(
                                  body: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20),
                      child: ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          return snapshot.data.documents[index]['name']!=null?snapshot.data.documents[index]['dept']!=null?ListTile(
                            title: Text(snapshot.data.documents[index]['name']+"\n"+snapshot.data.documents[index]['dept'],)
                          ):ListTile(title:Text("null value")):ListTile(title:Text("Null Value"));
                        },
                      ),
                    ),
                ));
  }
}
