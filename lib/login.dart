//The login page for the user

import 'package:flutter/material.dart';
import 'package:flutterapp/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterapp/account.dart';

class LoginSignupPage extends StatefulWidget {
  LoginSignupPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  State<StatefulWidget> createState() =>
      new _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  @override
  final _formKey = new GlobalKey<FormState>();
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  String _email;
  String _password;
  String _errorMessage;

  bool _isLoading;
  bool _isLoginForm;

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null) {
          if(!_isLoginForm) {
            Account account = new Account(userId, "", "", _email, "", "");
//          account.email = "This is a test";
            _database.reference().child("account").child(userId).set(account.toJson());
          }
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return Container(
      height: 0,
      width: 0,
    );
  }

  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
          padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 48,
//            child: Image.asset('img/logo.jpg'),
          )),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.blue,
            child: new Text(_isLoginForm ? 'Login' : 'Create account',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: validateAndSubmit,
          ),
        ));
  }

  Widget showSecondaryButton() {
    return new FlatButton(
        child: new Text(
            _isLoginForm ? 'Create an account' : 'Have an account? Sign in',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
        onPressed: toggleFormMode);
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget _showForm() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              showLogo(),
              showEmailInput(),
              showPasswordInput(),
              showPrimaryButton(),
              showSecondaryButton(),
              showErrorMessage(),
            ],
          ),
        ));
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter login demo"),
        ),
        body: Stack(
          children: <Widget>[
            _showForm(),
            _showCircularProgress(),
          ],
        ));
  }
}

//Set the initial Stateless Widget
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title});

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// //Allow the user input to be saved via two strings
// //Will eventually keep username/password combinations
// //in a separate database and support forgot password
// //and create an account functionalities
// class _MyHomePageState extends State<MyHomePage> {
//   final myControllerUsername = TextEditingController();
//   final myControllerPassword = TextEditingController();

//   //Temporary username and passwords for debugging
//   final String _tempUserName = "BrownBoi";
//   final String _tempPassword = "123";
//   TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 26);

//   @override
//   void dispose() {
//     myControllerPassword.dispose();
//     myControllerUsername.dispose();
//     super.dispose();
//   }

//   void validate() {}

//   Widget build(BuildContext context) {

//     //Define the username section
//     final userNameField = TextField(
//         controller: myControllerUsername,
//         obscureText: false,
//         style: style,
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//             hintText: 'Username',
//             border:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(32))));

//     //Define the password section
//     final passwordField = TextField(
//         controller: myControllerPassword,
//         obscureText: true,
//         style: style,
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//             hintText: 'Password',
//             border:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(32))));

//     //Define the blue login section
//     final loginButton = Material(
//         elevation: 10.0,
//         borderRadius: BorderRadius.circular(30),
//         color: Colors.lightBlue,
//         child: MaterialButton(
//             minWidth: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//             onPressed: () {
//               setState(() {
//                 //Add logic about whether an account exists in the database
//                 //The key will be a pair of a username and password
//                 //The value will be an Account object (Account will be its own class)
//                 if (myControllerUsername.text == _tempUserName &&
//                     myControllerPassword.text == _tempPassword) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => NextScreen()),
//                   );
//                 }
//               });
//             },
//             child: Text('Login',
//                 textAlign: TextAlign.center,
//                 style: style.copyWith(
//                     color: Colors.white, fontWeight: FontWeight.bold))));

//     //The scaffold should actually create the buttons and
//     //appear on the center of the screen
//     return Scaffold(
//       body: Center(
//         child: Container(
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.all(36),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(
//                     height: 60,
//                     child: Text('BrownBois',
//                         style: TextStyle(
//                             fontSize: 48,
//                             color: Colors.blue,
//                             fontStyle: FontStyle.italic,
//                             fontWeight: FontWeight.bold))),
//                 SizedBox(
//                   height: 75,
//                   child: Image.asset(
//                     'assets/checkin.png',
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 SizedBox(height: 45),
//                 userNameField,
//                 SizedBox(height: 25),
//                 passwordField,
//                 SizedBox(height: 35),
//                 loginButton,
//                 SizedBox(height: 15),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
