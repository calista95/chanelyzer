import 'package:flutter/material.dart';
import 'package:chanelyzer/methods/readSerialNumber.dart';
import 'package:chanelyzer/shared/constants.dart';

class Results extends StatefulWidget {
  final String serialCode;
  final String yearManufactured;
  final Function EnableInputScreen;
  Results({this.serialCode, this.yearManufactured, this.EnableInputScreen});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  String zeroesFormat;
  String onesFormat='';
  var dataItem;

  createLabelCheckListQuestionDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        content: Text("Check these clues to verify the authenticity of your Chanel handbag."),
        actions: <Widget>[
          GestureDetector(child: Icon(Icons.close),
            onTap: (){
              Navigator.pop(context);
            }
          )
        ],
      );
    });
  }

  createDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(

          title: Column(children: <Widget>[
            Text("A closer look...",
                style: TextStyle(fontSize: 20, fontFamily: "Courier")
            )
          ],),

          content: Container(
            height: 350,
            child: Column(children: <Widget>[
              Text("Sticker style: ", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("${dataItem["stickerStyle"]}"),
              SizedBox(height: 15),
              Text("You should see something like this...", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Expanded(child: Image(image: AssetImage('assets/images/serialNumberPictures/'+dataItem["serialNumber"]+'.JPG'))),
            ],),
          )

      );
    });
  }


  @override
  Widget build(BuildContext context) {
    setState(() {
      zeroesFormat = GetZeroesFormat(widget.serialCode);
    });
    setState(() {
      onesFormat = GetOnesFormat(widget.serialCode);
    });
    return Container(
    width: 300,
    child: Column(children: <Widget>[
      Text("Results for code: ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      SizedBox(height: 20),
      Text("${widget.serialCode}", style: TextStyle(fontFamily: "Courier", fontSize: 40)),
      SizedBox(height: 20),
      Visibility(
        child: Column(
          children: <Widget>[
            Text("Your bag was manufactured: ", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            Text("${widget.yearManufactured}", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          ],
        ),
        visible: widget.yearManufactured == notValid ? false : true,
      ),
      Visibility(
        child: Text("A manufacturer date could not be found for your serial number.", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        visible: widget.yearManufactured == notValid ? true : false,
      ),
      SizedBox(height: 30),
      Visibility(
        child: Row(
          children: <Widget>[
            Text("Label checklist: ", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            GestureDetector(
              child: Icon(Icons.help),
              onTap: (){
                createLabelCheckListQuestionDialog(context);
              },
            ),
          ],),
        visible: widget.yearManufactured == notValid ? false : true,
      ),
      SizedBox(height: 20),
      Visibility(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 20),
              width: 300,
              decoration: BoxDecoration(border: Border.all()),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Row(children: <Widget>[
                    Icon(Icons.check), SizedBox(width: 5), Text("${zeroesFormat}"),
                  ],),
                  SizedBox(height: 10),
                  Row(children: <Widget>[
                    Icon(Icons.check), SizedBox(width: 5), Text("${onesFormat}"),
                  ],),
                  SizedBox(height: 10),
                ],)
          ),
        ),
        visible: widget.yearManufactured == notValid ? false : true
      ),
      SizedBox(height: 10),
      Visibility(
        child: GestureDetector(
          child: Row(children: <Widget>[
            Icon(Icons.view_list), SizedBox(width: 5), Text("Tap for details", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          ],),
          onTap: (){

              /// get the proper object
              for(var i=0; i<serialDescriptors.length; i++)
              {
                print(serialDescriptors[i]["yearManufactured"][0]);
                print(serialDescriptors[i]["yearManufactured"][1]);

                if (serialDescriptors[i]["serialNumber"][0] == widget.serialCode[0] &&
                    serialDescriptors[i]["serialNumber"][1] == widget.serialCode[1]
                )
                  {
                    setState(() {
                      dataItem = serialDescriptors[i];
                    });
                    break;
                  }
              }

print("data item:");
print(dataItem);
            createDialog(context);
          },
        ),
        visible: widget.yearManufactured == notValid ? false : true,
      ),
      SizedBox(height: 30),
      GestureDetector(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
                height: 40.0,
                width: 200,
                color: Colors.blueGrey,
                child:  Center(child: Text("Enter another code", style: TextStyle(fontSize: 18.0, color: Colors.white)))
            )
        ),
        onTap: () async {
          widget.EnableInputScreen();
        },
      )
    ],));
  }
}

