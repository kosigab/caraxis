import 'package:flutter/material.dart';
class Status
{
  String cImg = "assets/images/tesla_y.png";

  Status()
  {

  }
  Image carImage()
  {
    Image x = Image.asset(cImg);
    return x;
  }
}