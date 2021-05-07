import 'package:chanelyzer/home.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/marble.jpg'), fit: BoxFit.cover)
          ),
          child: Column(children: <Widget>[
            Container(
                width: double.infinity,
                height:400,
                decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage('assets/images/classicFlap.jpg'), fit: BoxFit.cover)),
                child: Center(child: Text("CHANELYZER",
                    style: TextStyle(color: Colors.white, fontSize: 55, fontFamily: 'Couture')))
            ),
            SizedBox(height: 20),
            Text("An easy way to analyze your Chanel serial number.",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold )),
            SizedBox(height: 20),
            GestureDetector(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                      height: 40.0,
                      width: 200,
                      color: Colors.blueGrey,
                      child:  Center(child: Text("Get Started", style: TextStyle(fontSize: 18.0, color: Colors.white)))
                  )
              ),
              onTap: () async {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => Home()
                    )
                );
              },
            ),
            SizedBox(height: 150),
            Text("* not affiliated with Chanel",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold )),
         ]
        )
      ),
    );
  }
}
