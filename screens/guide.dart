import 'package:chanelyzer/screens/infoCard.dart';
import 'package:flutter/material.dart';
import 'package:chanelyzer/shared/constants.dart';

class Guide extends StatefulWidget {
  final Function EnableInputScreen;
  Guide({this.EnableInputScreen});

  @override
  _GuideState createState() => _GuideState();
}

class _GuideState extends State<Guide> {

  @override
  Widget build(BuildContext context) {
    return
      Expanded(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          Text("A Guide to Chanel Serial Numbers", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text("Tap on a code to learn more.", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: serialDescriptors.length,
                itemBuilder: (context, index){
                  return ItemCard(item: serialDescriptors[index]);
                }
            ),
          ),
        ],)
      ),
    );
  }
}
