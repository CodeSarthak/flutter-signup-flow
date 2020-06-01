import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signup/Pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _emailID;
  String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In to continue :)"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[

            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return 'Please type a valid email';
                }
              },
              onSaved: (input)  => _emailID = input ,
              decoration: InputDecoration(
                labelText: "Enter your email"
              ),

            ),

            TextFormField(
              validator: (input){
                if(input.length < 6){
                  return 'Please type a valid password';
                }
              },
              onSaved: (input)  => _password = input ,
              decoration: InputDecoration(
                  labelText: "Enter your password"
              ),
              obscureText: true,

            ),

            RaisedButton(
              onPressed: () => signIn(context),
              child: Text("Sign In"),
            )


          ],
        ),
      ),
    );

  }

  Future<void> signIn(context) async{

    final _form = _formKey.currentState;
    if(_form.validate()) {
      _form.save();
      try{
        AuthResult user =  await FirebaseAuth.instance. signInWithEmailAndPassword(email: _emailID, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));




      }catch(e) {
        print(e.message);

      }
      }


      //login to firebase
    }
    }