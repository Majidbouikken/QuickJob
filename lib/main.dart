import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signUpPage.dart';
import 'CreateAnnounce.dart';
import 'Posts.dart';
import 'choice.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new SplashScreen(),
      theme: new ThemeData(
          primaryColor: QuickJobColors.Blue,
          textTheme: Theme.of(context).textTheme.copyWith(
                title: new TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Oxygen',
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),),debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State createState() {
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => First(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: Center(child: Image.asset('assets/img/Logo.png',width: MediaQuery.of(context).size.width * 0.6,),)
    );
  }
}

class QuickJobColors {
  static const Color PrimaryColor = Color(0xFFF2FCFE); //#58e3ff
  static const Color SecondaryColor = Color(0xFF1C92D2);

  static const Color Red = Color(0xFFFF5C3E);
  static const Color Yellow = Color(0xFFffbf3e);
  static const Color lightYellow = Color(0xFFffee7c);
  static const Color Green = Color(0xFF00f5a1);
  static const Color Blue = Color(0xFF1C92D2);

  static const BlueGrey = Color(0xFFECEFF1);
  static const BlueGrey1 = Color(0xFFCFD8DC);
  static const BlueGrey2 = Color(0xFFB0BEC5);
  static const BlueGrey4 = Color(0xFF78909C);
  static const BlueGrey6 = Color(0xFF546E7A);
  static const BlueGrey9 = Color(0xFF263238);
}

class BlueGrey {

}

class ShadowColors {
  static const lightShadow = Color(0x11000000);
  static const midShadow = Color(0x32000000);
  static const deepShadow = Color(0x75000000);
}

class Etudiant {

  static String AdresseMail ;
  static String NumTel ;
  static String Nom ;
  static String Prenom;
  static String Pass ;
  static int annee = 1999 ;
  static int mois = 12;
  static int jour=12;
  static String branch;
  static String univ;
  static String competence;
  static String hobbies;
  static String ID;
  static String DocID;
/*
  static bool exist;
*/
  // setters and getters
  static void setAdresseMail(String value){AdresseMail = value;}
  static String getAdresseMail(){return AdresseMail;}
  static void setID(String value){ID = value;}
  static String getID(){return ID;}
  static void setNumTel(String value){NumTel = value;}
  static String getNumTel(){return NumTel;}
  static void setNom(String value){Nom = value;}
  static String getNom(){return Nom;}
  static void setPrenom(String value){Prenom = value;}
  static String getPrenom(){return Prenom;}
  static void setPass(String value){Pass = value;}
  static String getPass (){return Pass;}
  static int getAnnee(){return annee;}
  static void setAnnee(int value){annee = value;}
  static int getMois(){return mois;}
  static void setMois(int v){mois=v;}
  static int getJour(){return jour;}
  static void setJour(int v){jour=v;}
  static void setDocID(String value){DocID = value;}
  static String getDocID(){return DocID;}
  static void setBranch(String value){branch = value;}
  static String getBranch(){return branch;}
  static void setUniv(String value){univ = value;}
  static String getUniv(){return univ;}
  static void setCompetence(String value){competence = value;}
  static String getComptence(){return competence;}
  static void setHobbies(String value){hobbies = value;}
  static String getHobbies(){return hobbies;}
  /*static void setExist(bool value){exist = value;}
  static bool getExist(){return exist;}*/

}