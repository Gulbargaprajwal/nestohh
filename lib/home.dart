import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/authentication_service.dart';
class Home1 extends StatelessWidget {
  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
var dict=[
    {
      "name":"REVA HOSTEL",
      "img":"https://revaeduin.s3.ap-south-1.amazonaws.com/uploads/images/1636547200_e82554ecc4162dbb2377.jpg",
      "desc":"Rukmani Knowledge",
      "price":"11000/month"
    },{
      "name":"RRR residency",
      "img":"https://mediacdn.99acres.com/media1/12658/2/253162491M-1602050380586.jpg",
      "desc":"near lake",
      "price":"8000/month"
    },{
      "name":"KGF residency",
      "img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUv8GvpMGnH5BC2RE9IrIfxBPuwUk3Dq9XrQ&usqp=CAU",
      "desc":"near court",
      "price":"8500/month"
    }
    ,{
      "name":"Friends residency",
      "img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8AbGnQZ_-eHh7XqB9kq1mUYyT2Qk8I7TF9A&usqp=CAU",
      "desc":"near ground",
      "price":"13000/month"}

    ,{
      "name":"Friends residency",
      "img":"",
      "desc":"near ground",
      "price":"13000/month"}

    ,{
      "name":"Friends residency",
      "img":"",
      "desc":"near ground",
      "price":"13000/month"}
  ];
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text("NESTOHH.."),
          centerTitle: true,
          actions: [
            IconButton(icon: Icon(Icons.logout_rounded,color: Colors.white,),color: Colors.white,onPressed: (){
              context
                  .read<AuthenticationService>().signOut();
            },)
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: listview(context),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orangeAccent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:"Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label:"Explore",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
              label:"Profile",
            ),
          ],
        ),
      ));

  }
  ListView listview(BuildContext context) {
    return ListView.builder(
        itemCount: dict.length,

        itemBuilder: (BuildContext context,int index){
          return Container(
            margin: EdgeInsets.all(10),
            height: 125,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 5,)],
              color: Colors.white
            ),
            child: Row(
              children:[
                Container(
                  height: 125,
                  width: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image:NetworkImage(
                        dict[index]["img"]
                    )),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dict[index]["name"],style: TextStyle(
                        fontWeight: FontWeight.w500
                      ),),
                      SizedBox(
                        height: 7,
                      ),
                      Text(dict[index]["desc"],style: TextStyle(
                          fontSize: 12,
                        color: Colors.black54
                      ),),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: Row(


                          children: [
                            SizedBox(
                              width: 50,
                            ),
                            Container(child:Text(dict[index]["price"],
                            textScaleFactor: 0.8,
                                style:TextStyle(
                                    fontWeight: FontWeight.w500
                                )))
                          ],
                        ),
                      )
                    ],
                  ),
                )



              ]
            )
          );
        }
    );
  }
}
