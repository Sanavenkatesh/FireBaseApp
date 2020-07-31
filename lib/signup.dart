import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                    'SignUp',
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

                // SizedBox(height: 20.0,),
                // TextField(
                //   decoration: InputDecoration(
                //     labelText: 'Nick Name',
                //     labelStyle: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       color: Colors.grey,
                //     ),
                //     focusedBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(
                //         color: Colors.green,
                //       )
                //     ),
                //   ),
                // ),
                
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
                      .createUserWithEmailAndPassword(email: _email, password: _password)
                      .then((value) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacementNamed('/homepage');
                      }).catchError((e){
                        print(e);
                      });
                    },
                    child: Center(
                      child: Text('Sign Up',
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
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Center(
                      child: Text('Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        )
                      ),
                    ),
                  ),
                ),
              ]
            ),
          ),        
        ]
      ),
    );
  }
}
