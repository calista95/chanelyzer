import 'package:chanelyzer/shared/constants.dart';

/// read in serial code and determine what year range the bag was produced
String ReadSerialNumber(String serial){
  //get the first two digits of the code
  int serialNum = int.parse(serial.substring(0,2));
  int serialNumSingle = int.parse(serial[0]);
  String yearManufactured = '';
  /// 7 char - span 1986-2005
  if (serial.length == 7){
    switch(serialNumSingle){
      case(9):
        yearManufactured = "2004 to 2005";
        break;
      case(8):
        yearManufactured = "2003 to 2004";
        break;
      case(7):
        yearManufactured = "2002 to 2003";
        break;
      case(6):
        yearManufactured = "2000 to 2002";
        break;
      case(5):
        yearManufactured = "1997 to 1999";
        break;
      case(4):
        yearManufactured = "1996 to 1997";
        break;
      case(3):
        yearManufactured = "1994 to 1996";
        break;
      case(2):
        yearManufactured = "1991 to 1994";
        break;
      case(1):
        yearManufactured = "1989 to 1991";
        break;
      default:
        yearManufactured = notValid;
    }
  }
  /// 8 char - span 2005-present
  else if (serial.length == 8){
    switch(serialNum){
      case(25):
        yearManufactured = "2018-UP";
        break;
      case(24):
        yearManufactured = "2017-2018";
        break;
      case(23):
        yearManufactured = "2017";
        break;
      case(22):
        yearManufactured = "2016-2017";
        break;
      case(21):
        yearManufactured = "2015 to 2016";
        break;
      case(20):
        yearManufactured = "2014 to 2015";
        break;
      case(19):
        yearManufactured = "2014";
        break;
      case(18):
        yearManufactured = "2013 to 2014";
        break;
      case(17):
        yearManufactured = "2012 to 2013";
        break;
      case(16):
        yearManufactured = "2012";
        break;
      case(15):
        yearManufactured = "2011";
        break;
      case(14):
        yearManufactured = "2010 to 2011";
        break;
      case(13):
        yearManufactured = "2009 to 2010";
        break;
      case(12):
        yearManufactured = "2008 to 2009";
        break;
      case(11):
        yearManufactured = "2006 to 2008";
        break;
      case(10):
        yearManufactured = "2005 to 2006";
        break;
      default:
        yearManufactured = notValid;
    }
  }
  else{
    yearManufactured = notValid;
  }
  return yearManufactured;
}

/// determine if zeroes have strikethroughs or not based on the serial code
String GetZeroesFormat(String serial){
  // 25xxxxx - 6xxxxxx 0s have strikethroughs
  if (serial.length == 8)
  {
    return strikethrough_0;
  }
  else if (serial.length == 7)
  {
    int serialNumDouble = int.parse(serial.substring(0,2));
    int serialNumSingle = int.parse(serial[0]);
    /// anything 6xxxxxx and above will have a strikethrough
    /// 3xxxxxx will have a strikethrough
    /// 4xxxxxx will have a strikethrough
    if (serialNumSingle >= 6 ||
        serialNumSingle == 4 ||
        serialNumSingle == 3
    ){ //anything 6 or above has strikethroughs
      return strikethrough_0;
    }
    /// 5xxxxxx codes are tricky because it is not consistent across the timeline...
    else if (serialNumSingle == 5) {
      if (serialNumDouble == 51 || serialNumDouble == 50){
        return strikethrough_0;
      }
      else if (serialNumDouble >= 52 && serialNumDouble <= 56){
        return noStrikethough_0;
      }
      else if (serialNumDouble >= 57){
        return strikethrough_0;
      }
    }
    /// no strikethrough up to 27xxxxxx
    else if (serialNumSingle == 2){
      if (serialNumDouble <=27){
        return noStrikethough_0;
      }
      else{
        return strikethrough_0;
      }
    }
    /// no strikethrough for 1xxxxxx
    else if (serialNumSingle == 1){
      return noStrikethough_0;
    }
  }
}

/// determine if ones have serifs or not based on the serial code
String GetOnesFormat(String serial){
  /// 25xxxxx - 6xxxxxx 0s have small serifs
  if (serial.length == 8)
  {
    return serif_I;
  }
  else if (serial.length == 7){
    int serialNumDouble = int.parse(serial.substring(0,2));
    int serialNumSingle = int.parse(serial[0]);
    /// anything 6 or above has serifs
    if (serialNumSingle >= 6) {
      return serif_I;
    }
    else if (serialNumSingle == 5){
      if (serialNumDouble >= 57){
        return serif_I;
      }
      else{
        return sans_serif_I;
      }
    }
    else if (serialNumSingle == 3 || serialNumSingle ==4){
      return sans_serif_I;
    }
    else if (serialNumSingle == 2){
      if (serialNumDouble >= 27){
        return sans_serif_I;
      }
      else{
        return serif_I;
      }
    }
    else if (serialNumSingle == 1){
      return serif_I;
    }
  }
}