import 'package:flutter/material.dart';

// const Color primaryColor = Color(0xff4e5ae8);
const Color primaryColor = Color(0xFFcb00ff); //*************************(0)
const Color yellowClr = Color.fromARGB(255, 230, 117, 18); //************(1)
const Color pinkClr = Color(0xffff4667); //******************************(2)
const Color greenClr = Color.fromARGB(255, 8, 165, 63); //***************(3)
const Color blueClr = Color.fromARGB(255, 8, 89, 165); //****************(4)
const Color greenClr2 = Color.fromARGB(255, 0, 153, 153); //*************(5)
const Color pinkClr1 = Color.fromARGB(255, 255, 153, 153); //************(6)
const Color orangeClr = Color.fromARGB(255, 216, 95, 43); //*************(7)
const Color lavenderClr = Color.fromARGB(255, 230, 230, 250); //*********(8)
const Color peachPuffClr = Color.fromARGB(255, 255, 218, 185); //********(9)
const Color rosyBrownClr = Color.fromARGB(255, 188, 143, 143); //*******(10)
const Color lightPinkClr = Color.fromARGB(255, 255, 182, 193); //*******(11)
const Color orchidClr = Color.fromARGB(255, 218, 112, 214); //**********(12)
const Color mediumOrchidClr = Color.fromARGB(255, 186, 85, 211); //*****(13)
const Color mediumPurpleClr = Color.fromARGB(255, 147, 112, 219); //****(14)
const Color skyBlueClr = Color.fromARGB(255, 135, 206, 235); //*********(15)
const Color deepSkyBlueClr = Color.fromARGB(255, 0, 191, 255); //*******(16)
const Color cornFlowerBlueClr = Color.fromARGB(255, 100, 149, 237); //**(17)
const Color springGreenClr = Color.fromARGB(255, 0, 255, 127); //*******(18)
const Color oliveDrabClr = Color.fromARGB(255, 107, 142, 35); //********(19)
const Color darkOrangeClr = Color.fromARGB(255, 255, 140, 0); //********(20)
const Color salmonSlr = Color.fromARGB(255, 250, 128, 114); //**********(21)
const Color firebrickGreenClr = Color.fromARGB(255, 178, 34, 34); //****(22)
const Color gainsboroClr = Color.fromARGB(255, 220, 220, 220); //*******(23)
const Color honeydewClr = Color.fromARGB(255, 240, 255, 240); //**********(24)
const Color lighSteelBlueClr = Color.fromARGB(255, 176, 196, 222); //*****(25)
const Color mistyRoseClr = Color.fromARGB(255, 255, 228, 225); //*********(26)

const Color white = Colors.white;
const Color darkGreyClr = Color(0xFF212332);
const Color darkHeaderClr = Color(0xff424242);

Color getColor(int color) {
  switch (color) {
    case 0:
      return primaryColor;
    case 1:
      return yellowClr;
    case 2:
      return pinkClr;
    case 3:
      return greenClr;
    case 4:
      return blueClr;
    case 5:
      return greenClr2;
    case 6:
      return pinkClr1;
    case 7:
      return orangeClr;
    case 8:
      return lavenderClr;
    case 9:
      return peachPuffClr;
    case 10:
      return rosyBrownClr;
    case 11:
      return lightPinkClr;
    case 12:
      return orchidClr;
    case 13:
      return mediumOrchidClr;
    case 14:
      return mediumPurpleClr;
    case 15:
      return skyBlueClr;
    case 16:
      return deepSkyBlueClr;
    case 17:
      return cornFlowerBlueClr;
    case 18:
      return springGreenClr;
    case 19:
      return oliveDrabClr;
    case 20:
      return darkOrangeClr;
    case 21:
      return salmonSlr;
    case 22:
      return firebrickGreenClr;
    case 23:
      return gainsboroClr;
    case 24:
      return honeydewClr;
    case 25:
      return lighSteelBlueClr;
    case 26:
      return mistyRoseClr;
    default:
      return darkGreyClr;
  }
}
