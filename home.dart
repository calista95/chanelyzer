import 'package:chanelyzer/landing.dart';
import 'package:chanelyzer/screens/enterSerial.dart';
import 'package:chanelyzer/screens/guide.dart';
import 'package:chanelyzer/screens/results.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showInputScreen = true;
  bool showGuideScreen = false;
  bool showResultScreen = false;
  String yearManufactured;
  String serialCode;

  void EnableInputScreen(){
    setState(() {
      showInputScreen = true;
      showGuideScreen = false;
      showResultScreen = false;
    });
  }

  void EnableGuideScreen(){
    setState(() {
      showInputScreen = false;
      showGuideScreen = true;
      showResultScreen = false;
    });
  }

  void EnableResultScreen(){
    setState(() {
      showInputScreen = false;
      showGuideScreen = false;
      showResultScreen = true;
    });
  }

  void setYearManufactured(String s){
    setState(() {
      yearManufactured = s;
    });
  }

  void setSerialCode(String s){
    setState(() {
      serialCode = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/marble.jpg'), fit: BoxFit.cover)
        ),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(children: <Widget>[
              SizedBox(height: 15),
              Row(children: <Widget>[
                GestureDetector(
                  child: Text("   Chanelyzer", style: TextStyle(fontFamily: "Couture", fontSize: 22),),
                  onTap: () async {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => Landing()
                        )
                    );
                  },
                )
              ],),
              SizedBox(height: 100),
              Visibility(
                  child: EnterSerial(EnableResultScreen: EnableResultScreen, EnableGuideScreen: EnableGuideScreen, setYearManufactured: setYearManufactured, setSerialCode: setSerialCode,),
                  visible: showInputScreen ? true : false
              ),

              Visibility(
                child: Results(serialCode: serialCode, yearManufactured: yearManufactured, EnableInputScreen: EnableInputScreen),
                visible: showResultScreen ? true : false,
              ),

              Visibility(
                  child: Guide(EnableInputScreen: EnableInputScreen),
                  visible: showGuideScreen ? true : false
              ),

            ],),
          ),
        ),
      ),
    );
  }
}
