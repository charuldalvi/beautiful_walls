import 'package:firestore_example/show_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GridViewExample extends StatefulWidget {
  @override
  _GridViewExampleState createState() => new _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {
  AnimationController controller;

  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Beautiful Walls',
          style: TextStyle(
              letterSpacing: 10.0,
              color: Colors.indigoAccent,
              fontFamily: 'Stylish'),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 16.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.info,
          color: Colors.white,
        ),
        backgroundColor: Colors.indigoAccent,
        elevation: 4.0,
      ),
      body: Container(
        child: StreamBuilder(
            stream: Firestore.instance.collection('post').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot mypost = snapshot.data.documents[index];
                    return Stack(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            var imgurl = mypost['image'];

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowImage(
                                          imgurl,
                                        )));
                          },
                          child: Hero(
                            tag: '${mypost['image']}',
                            child: Container(
                              child: Image.network(
                                '${mypost['image']}',
                                fit: BoxFit.cover,
                                width: 300.0,
                                height: 300.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
