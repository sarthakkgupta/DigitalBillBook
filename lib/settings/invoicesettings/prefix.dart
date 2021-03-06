import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitalbillbook/models/invoicesettingsmodel.dart';
import 'package:flutter/material.dart';

class SetPrefix extends StatelessWidget {
  final invoicePrefixController = TextEditingController();
  final startingserialnoController = TextEditingController();
  final settings = new InvoiceSettingsmodel(null, null);
  final _keyForm = GlobalKey<FormState>();
  final String uid;
  SetPrefix(this.uid);
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    Future<void> invoicebutton() {
      settings.invoiceprefix = invoicePrefixController.text;
      settings.startingserialno = startingserialnoController.text;
      // Call the user's CollectionReference to add a new user
      return db
          .collection("userData")
          .doc(uid)
          .collection("invoiceSettings")
          .doc('invoiceSettings')
          .set(settings.toJson());
    }

    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _keyForm,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: <Color>[
                Color(0xff573666),
                Color(0xff1B1B2A)
              ], // red to yellow
              // repeats the gradient over the canvas
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Edit Invoice Prefix & Starting \nSerial Number',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 24,
                  color: const Color(0xfff1f3f6),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Invoice Prefix',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 12,
                            color: const Color(0xfff1f3f6),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextFormField(
                            decoration:
                                InputDecoration(fillColor: Colors.white),
                            controller: invoicePrefixController,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Starting Serial No.',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 12,
                            color: const Color(0xfff1f3f6),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextFormField(
                            controller: startingserialnoController,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                  onPressed: () => {invoicebutton(), Navigator.pop(context)},
                  child: Container(
                    width: 100,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Text(
                      'SET',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16,
                        color: const Color(0xff2f2e41),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
