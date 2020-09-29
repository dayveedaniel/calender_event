import 'package:flutter/material.dart';
import '../mixins/validation_mixins.dart';
import '../app.dart';
import '../blocs/signup_bloc.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SignupScreen(),
    );
  }
}

class SignupScreen extends StatelessWidget with Validator {
  final bloc = new Bloc();

  Widget build(context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(),
          passwordField(),
          confirmPasswordField(),
          Container(margin: EdgeInsets.only(top: 25.0)),
          RaisedButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(snackBar());
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
            color: Colors.white,
            padding: EdgeInsets.only(
                top: 15.0, bottom: 15.0, left: 80.0, right: 80.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder (
                  borderSide: BorderSide(color: Colors.white)
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelText: 'Email Address',
              hintText: 'you@example.com',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget passwordField() {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            obscureText: true,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder (
                  borderSide: BorderSide(color: Colors.white)
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelText: 'Password',
              hintText: 'Input your Password',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget confirmPasswordField() {
    return StreamBuilder(
        stream: bloc.confirmPassword,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeConfirmPassword,
            obscureText: true,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder (
                borderSide: BorderSide(color: Colors.white)
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelText: 'Confirm Password',
              hintText: 'Confirm your Password',
              errorText: snapshot.error,
            ),
          );
        });
  }

//  Widget submitButton() {
//    return RaisedButton(
//      onPressed: () {
//          Scaffold.of(context).showSnackBar(snackBar());
//          Navigator.push(
//              context, MaterialPageRoute(builder: (context) => MyApp()));
//
//      },
//      color: Colors.white,
//      padding:
//          EdgeInsets.only(top: 15.0, bottom: 15.0, left: 80.0, right: 80.0),
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
//      child: Text('Submit'),
//    );
//  }

  Widget snackBar() {
    return SnackBar(
      content: Text('SignUp Successful'),
      duration: Duration(seconds: 3),
    );
  }
}
