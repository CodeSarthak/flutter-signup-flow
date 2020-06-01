import 'package:flutter/material.dart';
import 'signUp.dart';
import 'signIn.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () => navigateToSignIn(context),
            child: Text("Sign In"),
          ),

          RaisedButton(
            onPressed: () => navigateToSignUp(context),
            child: Text("Sign Up"),
          )


        ],
      ),
    );
  }


}


void navigateToSignIn(context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
}

void navigateToSignUp(context){

  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));

}