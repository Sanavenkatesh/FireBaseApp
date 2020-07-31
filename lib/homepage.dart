import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'listPage.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 0.0,top: 10.0,right: 15.0,bottom: 10.0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.black,
                    iconSize: 30.0,
                    onPressed: (){
                      exit(0);
                    },
                  ),
                  Text("Designs",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0 ,
                  ),
                ),
                  ]
                ),
                IconButton(
                    icon: Icon(Icons.exit_to_app),
                    color: Colors.black,
                    iconSize: 30.0,
                    onPressed: (){
                      FirebaseAuth.instance.signOut().then((value) => {
                       Navigator.of(context).pushReplacementNamed('/landingpage')
                       }).catchError((e){print(e);});
                    },
                  ),

                
               
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.6),
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text("Mahesh",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),

                Tab(
                  child: Text("Allu Arjun",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                Tab(
                  child: Text("Prabhas",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height-161.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                new ListPage(),
                new ListPage2(),
                new ListPage(),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
