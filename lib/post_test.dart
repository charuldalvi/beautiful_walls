import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Firestore Example'),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('post').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('Loading...'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot mypost = snapshot.data.documents[index];
                return Stack(
                  children: <Widget>[
                    Column(

                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 350.0,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Material(
                              color: Colors.white,
                              elevation: 8.0,
                              shadowColor: Color(0x802196F3),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 200.0,
                                        child: Image.network(
                                          '${mypost['image']}',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      
                                      SizedBox(height: 10.0),
                                      
                                      Text(
                                        '${mypost['title']}',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      
                                      SizedBox(height: 10.0),
                                      
                                      Text(
                                        '${mypost['subtitle']}',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .40,
                        left: MediaQuery.of(context).size.height * .48,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: CircleAvatar(
                          backgroundColor: Color(0xff543b7a),
                          child: Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}