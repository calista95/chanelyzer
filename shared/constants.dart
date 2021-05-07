import 'package:flutter/material.dart';
import 'dart:core';

const textInputDecoration = InputDecoration(
    counterText: "",
    enabledBorder: OutlineInputBorder( //field that is not in focus will have these border properties
        borderSide: BorderSide(color: Colors.grey, width: 2.0)
    ),
    focusedBorder: OutlineInputBorder( //field that is not in focus will have these border properties
        borderSide: BorderSide(color: Colors.black87, width: 2.0)
    )
);

/// number styles
String strikethrough_0 = "0\'s should have strikethroughs";
String noStrikethough_0 = "0\'s should have no strikethroughs";
String serif_I = "I\'s have small serifs (feet)";
String sans_serif_I = "I\'s are sans-serifs (no feet)";
String notValid = "serial number not valid";

/// number style constants
String numberStyle1 = "0's have strikethroughs. 1's have small serifs (feet).";
String numberStyle2 = "0's have strikethroughs up to 51XXXXX. 0's have no strikethroughs from 52XXXXX to 56XXXXX. 0's have strikethroughs from 57XXXXX on. 1's have small serifs (feet) from 57XXXXX on.";
String numberStyle3 = "0's have strikethroughs. 1's are sans-serifs (no feet).";
String numberStyle4 = "0's have no strikethroughs up to 27XXXXXX. 1's have serifs (feet).";
String numberStyle5 = "0's have no strikethroughs. 1's have serifs (feet).";

/// sticker style constants
String stickerStyle1 = "Eight digit serial number printed on white sticker covered with clear tape with two Chanel logos. \"X\" cut-lines prevent sticker from being removed without damage. \"CHANEL\" appears on rightright side of the sticker. Dark line appears on left side of sticker. Gold speckles appear throughout sticker.";
String stickerStyle2 = "Seven digit serial number printed on white sticker covered with clear tape with two Chanel logos.\"X\" cut-lines prevent sticker from being removed without damage. \"CHANEL\" appears on rightright side of the sticker. Dark line appears on left side of sticker. Gold speckles appear throughout sticker.";
String stickerStyle3 = "Seven digit serial number printed on white sticker covered with clear tape with two Chanel logos from 57XXXXX on.\"X\" cut-lines prevent sticker from being removed without damage. \"CHANEL\" appears on rightright side of the sticker. Dark line appears on left side of sticker. Gold speckles appear throughout sticker.";
String stickerStyle4 = "Seven digit serial number printed on white sticker with Chanel logos. Opaque film covers sticker.";
String stickerStyle5 = "Seven digit serial number printed on white sticker with Chanel logos and left-sided cutout. Opaque film covers sticker.";
String stickerStyle6 = "Seven digit serial number printed on white sticker with Chanel logos and left-sided cutout. Opaque film covers sticker. Note that early serial numbers (starting with a 1 or 2) did not have a leading \"0\". Therefore, these were six-digit serial numbers. Also, the sticker was larger than the stickers produced later in the series.";

var serialDescriptors = [
    {
        "serialNumber": "25XXXXXX",
        "yearManufactured": "2018-UP",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "24XXXXXX",
        "yearManufactured": "2017-2018",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "23XXXXXX",
        "yearManufactured": "2017",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "22XXXXXX",
        "yearManufactured": "2016-2017",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "21XXXXXX",
        "yearManufactured": "2015-2016",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "20XXXXXX",
        "yearManufactured": "2014-2015",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "19XXXXXX",
        "yearManufactured": "2014",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "18XXXXXX",
        "yearManufactured": "2013-2014",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "17XXXXXX",
        "yearManufactured": "2012-2013",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "16XXXXXX",
        "yearManufactured": "2012",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "15XXXXXX",
        "yearManufactured": "2011",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "14XXXXXX",
        "yearManufactured": "2010-2011",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "13XXXXXX",
        "yearManufactured": "2009-2010",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "12XXXXXX",
        "yearManufactured": "2008-2009",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "11XXXXXX",
        "yearManufactured": "2006-2007",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "10XXXXXX",
        "yearManufactured": "2005-2006",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle1
    },
    {
        "serialNumber": "9XXXXXX",
        "yearManufactured": "2004-2005",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle2
    },
    {
        "serialNumber": "8XXXXXX",
        "yearManufactured": "2003-2004",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle2
    },
    {
        "serialNumber": "7XXXXXX",
        "yearManufactured": "2002-2003",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle2
    },
    {
        "serialNumber": "6XXXXXX",
        "yearManufactured": "2000-2002",
        "numberStyle" : numberStyle1,
        "stickerStyle" : stickerStyle2
    },
    {
        "serialNumber": "5XXXXXX",
        "yearManufactured": "1997-1999",
        "numberStyle" : numberStyle2,
        "stickerStyle" : stickerStyle3
    },
    {
        "serialNumber": "4XXXXXX",
        "yearManufactured": "1996-1997",
        "numberStyle" : numberStyle3,
        "stickerStyle" : stickerStyle4
    },
    {
        "serialNumber": "3XXXXXX",
        "yearManufactured": "1994-1996",
        "numberStyle" : numberStyle3,
        "stickerStyle" : stickerStyle4
    },
    {
        "serialNumber": "2XXXXXX",
        "yearManufactured": "1991-1994",
        "numberStyle" : numberStyle4,
        "stickerStyle" : stickerStyle4
    },
    {
        "serialNumber": "1XXXXXX",
        "yearManufactured": "1989-1991",
        "numberStyle" : numberStyle5,
        "stickerStyle" : stickerStyle5
    },
    {
        "serialNumber": "0XXXXXX",
        "yearManufactured": "1986-1988",
        "numberStyle" : numberStyle5,
        "stickerStyle" : stickerStyle6
    },

];