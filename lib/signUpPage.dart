import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'gestionCompte.dart';
import 'signUpPage1.dart';

class SignUpPage2 extends StatefulWidget {
  @override
  State createState() => new SignUpPage2State();
}

///i tried to implement a stepper in the Sign Up Page for a good looking page

class SignUpPage2State extends State<SignUpPage2> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Body
      body: PageView(children: <Widget>[
        SignUpPagePage1(),
        SignUpPagePage(),

      ],));
  }}

  class SignUpPagePage extends StatefulWidget {
    @override
    State createState() => new SignUpPageState();
    }

    ///i tried to implement a stepper in the Sign Up Page for a good looking page

    class SignUpPageState extends State<SignUpPagePage> {

    bool _autoValidate = false;
    final _formKey = GlobalKey<FormState>();
    String _email, _password;

    @override
    Widget build(BuildContext context) {
    return new Scaffold(
    // Body
    body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: QuickJobColors.BlueGrey,
                    ),
                    child: Center(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        onChanged: (String value) {
                          Etudiant.setPrenom(value);
                        },
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          border: InputBorder.none,
                          hintText: "Prénom",
                          /*hintStyle: Theme
                          .of(context)
                          .textTheme
                          .display2,*/
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 150,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: QuickJobColors.BlueGrey,
                    ),
                    child: Center(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        onChanged: (String value) {
                          Etudiant.setNom(value);
                        },
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          border: InputBorder.none,
                          hintText: "Nom",
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(
                height: 16,
              ),
              Container(
                width: 1080,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: QuickJobColors.BlueGrey,
                ),
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    onChanged: (String value) {
                      Etudiant.setNumTel(value);
                    },
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      border: InputBorder.none,
                      hintText: "Numéro de téléphone",
                      /*hintStyle: Theme
                          .of(context)
                          .textTheme
                          .display2,*/
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: 1080,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: QuickJobColors.BlueGrey,
                ),
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (String value) {
                      _email = value;
                    },
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      border: InputBorder.none,
                      hintText: "Adresse mail",
                      /*hintStyle: Theme
                          .of(context)
                          .textTheme
                          .display2,*/
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: 1080,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: QuickJobColors.BlueGrey,
                ),
                child: Center(
                  child: TextField(
                    onChanged: (String value) {
                      Etudiant.setPass(value);
                      _password = value;
                    },
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.verified_user),
                      border: InputBorder.none,
                      hintText: "Mot de passe",
                      /*hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Oxygen',
                          fontSize: 18),*/
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: 1080,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: QuickJobColors.Blue,
                ),
                child: FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onPressed: () {
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _email,
                        password: _password,
                      ).then((signedInUser) {
                        signedInUser.sendEmailVerification();
                        gestionCompte().storeNewUser(signedInUser, context);
                      }
                      ).catchError((e) {
                        print(e);
                      });
                    },
                    child: Text(
                      "S'INSCRIRE",
                      style: new TextStyle(
                          color: Colors.white,
                          fontFamily: 'Oxygen',
                          fontSize: 16),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

}



