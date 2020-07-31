import 'package:FireBaseApp/services/datamgmt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  QuerySnapshot user;
  DataManagement _user = new DataManagement();
  @override
  void initState(){
    _user.getCurretntUser().then((result){
      setState(() {
        user = result;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FireBaseApp',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => MyApp(),
        '/signup': (BuildContext context) => new SignUp(),
        '/homepage': (BuildContext context) => new HomePage()
      },
      home: user == null ? MyHomePage() : HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.8, 0.0),
                  child: Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.8, 0.0),
                  child: Text(
                    'There',
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right:20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (value){
                    setState(() {
                      _email = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      )
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  onChanged: (value){
                    setState(() {
                      _password = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      )
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height:15.0,),
                Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top: 1.5, left:20.0),
                  child: InkWell(
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      )
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.green,
                    
                  ),
                  child: InkWell(
                    onTap: (){
                      FirebaseAuth.instance
                      .signInWithEmailAndPassword(email: _email, password: _password)
                      .then((user) {
                        Navigator.of(context).pushReplacementNamed('/homepage');
                      })
                      .catchError((e){
                        print(e);
                      });
                    },
                    child: Center(
                      child: Text('Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.transparent,
                    
                  ),
                  child: Center(
                    child: Text('Log in With Google',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      )
                    ),
                  ),
                ),
              ]
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'New to here ?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed('/signup');
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                  ),
                )
              )
            ]
          )
        ]
      ),
    );
  }
}
