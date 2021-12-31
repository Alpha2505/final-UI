import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_ui/common/theme_helper.dart';
import 'package:login_ui/model/user_model.dart';
import 'package:login_ui/model/vehicle_model.dart';
import 'package:login_ui/pages/widgets/home.dart';

class VehicleTwoInfo extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _VehicleTwoInfoState();
  }
}

class _VehicleTwoInfoState extends State<VehicleTwoInfo> {
  double _headerHeight = 25;
  final _formKey = GlobalKey<FormState>();
  bool agree = true;
  final TextEditingController make = TextEditingController();
  final TextEditingController model = TextEditingController();
  final TextEditingController connector = TextEditingController();
  final TextEditingController veh_regno = TextEditingController();
  final TextEditingController vin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Add Vehicle Information'),
        toolbarHeight: 75,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
                colors: [Colors.teal.shade400, Colors.grey],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
            ),
            SafeArea(
              child: Container(  //this is login form
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [

                    SizedBox(height: 30.0),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Make', 'Enter your vehicle name'),
                            autofocus: false,
                            controller: make,
                            keyboardType: TextInputType.name,
                            validator: (value){
                              RegExp regex = new RegExp(r'^.{3,}$');
                              if(value.isEmpty){
                                return("Name is required for sign up");
                              };
                              if(!regex.hasMatch(value)){
                                return("Please enter valid name(Min. 3 characters)");
                              }
                              return null;
                            },
                            onSaved: (value){
                              make.text = value;
                            },
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 30.0),
                          TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Model', 'Enter your vehicle model'),
                            autofocus: false,
                            controller: model,
                            keyboardType: TextInputType.name,
                            validator: (value){
                              RegExp regex = new RegExp(r'^.{3,}$');
                              if(value.isEmpty){
                                return("Name is required for sign up");
                              };
                              if(!regex.hasMatch(value)){
                                return("Please enter valid name(Min. 3 characters)");
                              }
                              return null;
                            },
                            onSaved: (value){
                              model.text = value;
                            },
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Connector', "Enter connector type"),
                            autofocus: false,
                            controller: connector,
                            keyboardType: TextInputType.name,
                            validator: (value){
                              RegExp regex = new RegExp(r'^.{3,}$');
                              if(value.isEmpty){
                                return("Name is required for sign up");
                              };
                              if(!regex.hasMatch(value)){
                                return("Please enter valid name(Min. 3 characters)");
                              }
                              return null;
                            },
                            onSaved: (value){
                              connector.text = value;
                            },
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Vehicle Registration Number', 'Enter your vehicle registration number'),
                            autofocus: false,
                            controller: veh_regno,
                            keyboardType: TextInputType.name,
                            validator: (value){
                              RegExp regex = new RegExp(r'^.{3,}$');
                              if(value.isEmpty){
                                return("Name is required for sign up");
                              };
                              if(!regex.hasMatch(value)){
                                return("Please enter valid name(Min. 3 characters)");
                              }
                              return null;
                            },
                            onSaved: (value){
                              veh_regno.text = value;
                            },
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            decoration: ThemeHelper().textInputDecoration('VIN', "Enter your vehicle's VIN number"),
                            autofocus: false,
                            controller: vin,
                            keyboardType: TextInputType.name,
                            validator: (value){
                              // RegExp regex = new RegExp(r'^.{3,}$');
                              if(value.isEmpty){
                                return("Name is required for sign up");
                              };
                              // if(!regex.hasMatch(value)){
                              //   return("Please enter valid name(Min. 3 characters)");
                              // }
                              return null;
                            },
                            onSaved: (value){
                              vin.text = value;
                            },
                            textInputAction: TextInputAction.done,
                          ),

                          SizedBox(height: 90),
                          Container(
                            decoration: ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              onPressed: () {
                                //vehicle(veh_regno.text, vin.text);
                                // Map <String, dynamic> data = {"make": make.text, "model": model.text,
                                //   "connector": connector.text, "veh_regno": veh_regno.text, "vin": vin.text};
                                // FirebaseFirestore.instance.collection("vehicle").add(data);
                                Navigator.pop(context);
                              }, //after login redirect to homepage
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text('add'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}


