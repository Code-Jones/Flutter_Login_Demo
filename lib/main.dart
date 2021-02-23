import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          // you add this to avoid keyboard overlap
          child: Scaffold(
            body: LogIn(),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LogInState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class LogInState extends State<LogIn> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  //  This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  // custom gradient
  final Shader lg = LinearGradient(
    colors: <Color>[Color(0xff05ffe2), Color(0xffd913b9)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 20.0));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        border: new Border.all(color: Colors.transparent),
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.9,
          colors: [
            Color.fromRGBO(209, 12, 183, 0.3),
            Color.fromRGBO(18, 226, 191, 0.30196078431372547),
            Colors.transparent
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: <Widget>[
                  Text("RETRO",
                      textAlign: TextAlign.center,
                      textScaleFactor: 5,
                      style: TextStyle(
                          fontFamily: 'TrueLies',
                          foreground: Paint()..shader = lg)),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',

                      // the blue edges
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(32.0)),),

                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),),

                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),),
                    ),

                    // validation & saved
                    onSaved: (String value) {
                      return value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: isPasswordVisible,
                    decoration: const InputDecoration(
                      hintText: 'Tell me your secret code',
                      labelText: 'Password',

                      // the blue edges
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),

                    // validation & saved
                    onSaved: (String value) {
                      return value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FlatButton(
                    onPressed: () {
                      // if valid show 'processing bar'
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text('Log In',
                        textAlign: TextAlign.center,
                        textScaleFactor: 2,
                        style: TextStyle(
                            fontFamily: 'TrueLies',
                            foreground: Paint()..shader = lg
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
