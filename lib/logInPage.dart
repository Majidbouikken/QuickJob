import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'HomePage.dart';
import 'signUpPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogInPage extends StatefulWidget {

  @override
  State createState() {
    return new LogInPageState();
  }
}

class LogInPageState extends State<LogInPage> {

  String _email, _password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GoogleSignIn googleAuth = new GoogleSignIn();

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    CircularProgressIndicator();
    if (validateAndSave()) {
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: _email,
            password: _password);


        var query = await Firestore.instance.collection('/etudiants').where(
            'user_ID', isEqualTo: user.uid).getDocuments();
        print(query.documents[0].data['nom']);



        // Retrieving User's DATA
        Etudiant.setAdresseMail(user.email);
        Etudiant.setID(user.uid);
        Etudiant.setNom(query.documents[0].data['nom']);
        Etudiant.setUniv(query.documents[0].data['univ']);
        Etudiant.setBranch(query.documents[0].data['branch']);
        Etudiant.setCompetence(query.documents[0].data['competence']);
        Etudiant.setNumTel(query.documents[0].data['numTel']);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeSreen()),
        );
        print('heyyyyyyyyyyyy');

      }
      catch (e) {

      }}}
      @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return new Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /*Image.asset(
                    'assets/images/logo.png',
                    width: 80,
                    height: 30,
                  ),*/
                  Text(
                    "Connection",
                    style: TextStyle(
                        color: QuickJobColors.Blue,
                        fontFamily: 'Quicksand',fontWeight: FontWeight.w700,
                        fontSize: 28),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 1080,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: QuickJobColors.BlueGrey,
                    ),
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(value))
                            return 'Entrez une adresse valide!';
                          else
                            return null;
                        },
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                        decoration: InputDecoration(
                          hintText: 'Email',
                            prefixIcon: Icon(FontAwesomeIcons.userAlt, size: 18,),
                            border: InputBorder.none),
                        onSaved: (input) {
                          setState(() {
                            _email = input;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    width: 1080,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: QuickJobColors.BlueGrey,
                    ),
                    child: Center(
                      child: TextFormField(
                        validator: (value) {
                          if (value.length < 6)
                            return 'Mot de passe incorrecte';
                          else
                            return null;
                        },
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                            prefixIcon: Icon(FontAwesomeIcons.key, size: 18,),
                            border: InputBorder.none),
                        onSaved: (input) {
                          setState(() {
                            _password = input;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    width: 1080,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: QuickJobColors.Blue,
                    ),
                    child: FlatButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: validateAndSubmit,
                        child: Text(
                          "Log In",
                          style: new TextStyle(
                              color: Colors.white,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        )),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                          child: Text("Inscrivez-vous", style: TextStyle(
                              color: QuickJobColors.Blue,
                              fontFamily: 'OpenSans',
                              fontSize: 11,)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpPage2()),
                            );
                          }
                      ),
                      Text("  ou  ", style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'OpenSans',
                          fontSize: 11),),
                      GestureDetector(
                          child: Text("mot de passe oublié?", style: TextStyle(
                              color: QuickJobColors.Blue,
                              fontFamily: 'OpenSans',
                              fontSize: 11),),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpPage2()),
                            );
                          }
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

        );
      }
    }
