import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ItemCard extends StatefulWidget {
  var item;
  ItemCard({this.item});
  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  createDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Column(children: <Widget>[
          Text("Information for:"),
          Text("Serial #${widget.item["serialNumber"]}",
              style: TextStyle(fontSize: 20, fontFamily: "Courier")
          )
        ],),

        content: Container(
          child: Column(children: <Widget>[
            Text("Year manufactured:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("${widget.item["yearManufactured"]}"),
            SizedBox(height: 15),
            Text("Number style:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("${widget.item["numberStyle"]}"),
            SizedBox(height: 15),
            Text("Sticker style: ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("${widget.item["stickerStyle"]}"),
            SizedBox(height: 15),
            Text("You should see something like this...", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(child: Image(image: AssetImage('assets/images/serialNumberPictures/'+widget.item["serialNumber"]+'.JPG'))),
          ],),
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: GestureDetector(
          child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white70),
              child: ListTile(
                  title: Center(child: Text("${widget.item["serialNumber"]}",
                      style: TextStyle(fontSize: 25, fontFamily: "Courier")
                  ))
                ),
              )
          ),
          onTap: (){
            createDialog(context);
          },
        ),
      );
  }
}
