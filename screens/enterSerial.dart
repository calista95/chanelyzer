import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chanelyzer/shared/constants.dart';
import 'package:chanelyzer/methods/readSerialNumber.dart';
import 'dart:io';

class EnterSerial extends StatefulWidget {
  final Function EnableResultScreen;
  final Function EnableGuideScreen;
  final Function setYearManufactured;
  final Function setSerialCode;

  EnterSerial({this.EnableResultScreen, this.EnableGuideScreen, this.setYearManufactured, this.setSerialCode});

  @override
  _EnterSerialState createState() => _EnterSerialState();
}

class _EnterSerialState extends State<EnterSerial> {
  final _formKey = GlobalKey<FormState>();
  String _serialCode;
  String _yearManufactured='';
  File pickedImage;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(child:
      Text("Enter your serial code: ",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
      )),
      SizedBox(height: 70),
      /// form area
      Container(
          width: 300,
          child: Column(children: <Widget>[
            Form(
                key: _formKey,
                child: TextFormField(
                  validator: (val) => val.isEmpty ? "Enter a value" : null,
                  keyboardType: TextInputType.number, style: TextStyle(fontSize: 58, fontFamily: "Courier", fontWeight: FontWeight.bold),
                  maxLength: 8,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  decoration: textInputDecoration,
                  onChanged: (val) {
                    setState(() {
                      _serialCode = val;
                    });
                  },
                )
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: Row(children: <Widget>[
                Icon(Icons.collections_bookmark),
                Text(" A guide to Chanel serial numbers"),
              ],),
              onTap: (){
                widget.EnableGuideScreen();
              },
            ),
            SizedBox(height: 70),
            GestureDetector(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                      height: 40.0,
                      width: 200,
                      color: Colors.blueGrey,
                      child:  Center(child: Text("Enter", style: TextStyle(fontSize: 18.0, color: Colors.white)))
                  )
              ),
              onTap: () async {
                if (_formKey.currentState.validate()){
                  setState(() {
                    _yearManufactured = ReadSerialNumber(_serialCode);
                    widget.EnableResultScreen();
                    widget.setYearManufactured(_yearManufactured);
                    widget.setSerialCode(_serialCode);
                  });
                }
              },
            ),
          ],
          )
      )
    ],);
  }
}
