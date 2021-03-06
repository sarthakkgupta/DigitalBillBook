import 'package:digitalbillbook/home.dart';

import 'package:digitalbillbook/settings/aboutus.dart';
import 'package:digitalbillbook/settings/acceptableusepolicy.dart';
import 'package:digitalbillbook/settings/privacypolicy.dart';

import 'package:digitalbillbook/settings/termsofservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Support.dart';
import 'signup_and_loginpages/signup.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff615F86),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => FirebaseAuth.instance.currentUser != null
            ? Home(FirebaseAuth.instance.currentUser.uid)
            : MyHomePage(),
        //   '/signupotp': (BuildContext context) => Signupotp(),

        './AboutUs': (BuildContext context) => AboutUs(),
        './termsofservice': (BuildContext context) => TermsOfService(),
        './privacypolicy': (BuildContext context) => PrivacyPolicy(),
        './acceptableusepolicy.dart': (BuildContext context) =>
            AcceptableUsePolicy(),

        './support': (BuildContext context) => Support(),
      },
    );
  }
}
