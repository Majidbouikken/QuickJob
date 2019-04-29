import 'package:flutter/material.dart';
import 'main.dart';
import 'gestionCompte.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'HomePage.dart';

class gestionCompte {
  Future storeNewUser(user, context) async {
    String temp;
    Etudiant.setAdresseMail(user.email);
    Etudiant.setID(user.uid);
    final docRef = await Firestore.instance.collection('/etudiants').add({
      'email': user.email,
      'user_ID': user.uid,
      'numTel': Etudiant.getNumTel(),
      'nom': Etudiant.getNom(),
      'prenom': Etudiant.getPrenom(),
      /*'annee': Etudiant.getAnnee,
      'mois': Etudiant.getMois,
      'jour' : Etudiant.getJour,*/
      'password' : Etudiant.getPass(),
      'branch' : Etudiant.getBranch(),
      'competence' : Etudiant.getComptence(),
      'univ': Etudiant.getUniv(),
/*
      'hobbies' : Etudiant.getHobbies,
*/

    });
    Etudiant.setDocID(docRef.documentID);
    Firestore.instance
        .collection("etudiants")
        .document(docRef.documentID)
        .updateData({'DocID': docRef.documentID}).catchError((e) {
      print(e);
    });
    /*temp = User.getID();
    getdata(temp);*/
    Navigator.of(context).pop();
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => HomeSreen()),
    );

  }

}