import 'package:digitalbillbook/models/partydetails.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Eachrow extends StatelessWidget {
  final TextEditingController controller1, controller2;
  final String s1, s2;
  Eachrow(this.controller1, this.s1, this.controller2, this.s2);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Card(
            elevation: 4,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 50,
              child: TextFormField(
                maxLines: 1,
                controller: controller1,
                decoration: InputDecoration(
                  labelText: s1,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter ' + s1;
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Card(
            elevation: 4,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 50,
              child: TextFormField(
                maxLines: 1,
                controller: controller2,
                decoration: InputDecoration(
                  labelText: s2,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter ' + s2;
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AddParty extends StatefulWidget {
  final String uid;
  AddParty(this.uid);

  @override
  _AddPartyState createState() => _AddPartyState();
}

/*  String PartyCode;
  String PartyName;
  String phone;
  int gstn;
  String cgst;
  String igst;
  String purchaserate;
  String sellingprice;
  DateTime date;
  int totalAmount;
*/
class _AddPartyState extends State<AddParty> {
  final partyNameController = TextEditingController();
  final phoneController = TextEditingController();
  final gstnController = TextEditingController();
  final addressController = TextEditingController();
  var countryValue = TextEditingController();
  var stateValue = TextEditingController();
  final cityValue = TextEditingController();
  var pincodeController = TextEditingController();
  final newParty =
      new AddNewParty(null, null, null, null, null, null, null, null);
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    Future<void> addParty() {
      newParty.partyName = partyNameController.text;
      newParty.phone = phoneController.text;
      newParty.gstn = gstnController.text;
      newParty.address = addressController.text;
      newParty.country = countryValue.text;
      newParty.state = stateValue.text;
      newParty.city = cityValue.text;

      newParty.pincode = pincodeController.text;

      // Call the user's CollectionReference to add a new user
      return db
          .collection("userData")
          .doc(widget.uid)
          .collection("Party")
          .doc(partyNameController.text)
          .set(newParty.toJson());
    }

    return Scaffold(
      key: _keyForm,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(47, 46, 65, 1),
        title: Text(
          'Add Party',
          style: TextStyle(
            fontFamily: 'Bell MT',
            fontSize: 24,
            color: const Color(0xfff2f2f2),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: Form(
        key: _keyForm,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Add Party',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 14,
                    color: const Color(0xff2f2e41),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Card(
                      elevation: 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 50,
                        child: TextFormField(
                          maxLines: 1,
                          controller: partyNameController,
                          decoration: InputDecoration(
                            labelText: "Name/Company Name",
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter ' + "Name/Company Name";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Card(
                      elevation: 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 50,
                        child: TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          decoration: InputDecoration(
                            labelText: 'phone Number',
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty || value.length != 10) {
                              return 'Please Enter correct ' + 'phone Number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Card(
                      elevation: 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 50,
                        child: TextFormField(
                          maxLines: 1,
                          controller: gstnController,

                          decoration: InputDecoration(
                            labelText: "GSTN",
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty ||
                                value.characters.last != 'Z' ||
                                value.length != 15) {
                              return 'Please Enter Correct ' + "GSTN";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Card(
                      elevation: 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 50,
                        child: TextFormField(
                          maxLines: 1,
                          controller: addressController,
                          decoration: InputDecoration(
                            labelText: 'Address',
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter ' + 'Address';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Card(
                      elevation: 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 50,
                        child: TextFormField(
                          maxLines: 1,
                          expands: false,
                          controller: cityValue,
                          decoration: InputDecoration(
                            labelText: "city",
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter ' + "city";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Card(
                      elevation: 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 50,
                        child: TextFormField(
                          maxLines: 1,
                          controller: stateValue,
                          decoration: InputDecoration(
                            labelText: 'state',
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter ' + 'state';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Card(
                      elevation: 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 50,
                        child: TextFormField(
                          maxLines: 1,
                          controller: countryValue,
                          decoration: InputDecoration(
                            labelText: "country",
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter ' + "country";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Card(
                      elevation: 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 50,
                        child: TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          controller: pincodeController,
                          decoration: InputDecoration(
                            labelText: 'Pincode',
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty || value.length != 6) {
                              return 'Please Enter ' + 'Pincode';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: FlatButton(
                    /*       if (_formKey.currentState.validate()) {
                                          // If the form is valid, display a Snackbar.
                                          addParty(),
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Signupotp(
                                                          _controller.text)));
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content:
                                                      Text('')));
                                        } else {
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text('Please fill all the fields'
                                               )));
                                        }
                                      },*/
                    onPressed: () {
                      if (_keyForm.currentState.validate()) {
                        // If the form is valid, display a Snackbar.
                        addParty();
                        Navigator.pop(context);
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text('')));
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Please fill all the fields')));
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xfff3F3D56),
                          borderRadius: BorderRadius.circular(2)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 60.0, right: 60, top: 10, bottom: 10),
                        child: Text(
                          'Add Party',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
