import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/signup_screen.dart';
import '../mixins/validation_mixins.dart';
import '../blocs/bloc.dart';
import '../../assets/my_flutter_app_icons.dart';
import '../screens/loggedIn_screen.dart';

class LoginScreen extends StatelessWidget with Validator {
  Widget build(context) {
    return Center (
      child: SingleChildScrollView (
        padding:EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 100.0,
          bottom: 100,
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Login to MyApp',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(margin: EdgeInsets.only(top: 25.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    facebookLogin(),
                    gmailLogin(),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 15.0,
                  ),
                  child: Text(
                    'or use your email',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Container(margin: EdgeInsets.only(top: 10.0)),
                emailField(),
                Container(margin: EdgeInsets.only(top: 25.0)),
                passwordField(),
                Container(margin: EdgeInsets.only(top: 50.0)),
                submitButton(),
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: Text('dont have an account?'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 15.0, left: 80.0, right: 80.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: Colors.blueAccent,
                  child: Text(
                    'SignUp',
//        style: TextStyle(
//          fontSize: 30.0,
//        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget facebookLogin() {
    return IconButton(
        icon: Icon(MyFlutterApp.facebook),
        color: Colors.black,
        onPressed: null);
  }

  Widget gmailLogin() {
    return IconButton(icon: Icon(MyFlutterApp.gplus_circled), onPressed: null);
  }

  Widget emailField() {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: bloc.changeEmail,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
              labelText: 'Email Address',
              hintText: 'you@example.com',
              prefixIcon: Icon(Icons.mail),
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
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            labelText: 'Password',
            hintText: 'Input your Password',
            prefixIcon: Icon(Icons.remove_red_eye),
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton() {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: snapshot.hasData
              ? () {
                  Scaffold.of(context).showSnackBar(snackBar());
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoggedIn()));
                }
              : null,
          padding:
              EdgeInsets.only(top: 15.0, bottom: 15.0, left: 80.0, right: 80.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.blueAccent,
          child: Text('LOGIN'),
        );
      },
    );
  }

  Widget snackBar() {
    return SnackBar(
      content: Text('Login Successful'),
      duration: Duration(seconds: 3),
    );
  }
}
