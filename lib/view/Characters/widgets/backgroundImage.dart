import 'package:flutter/material.dart';

BoxDecoration backgroundImage() {
  return BoxDecoration(
      image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), BlendMode.dstATop),
          image: AssetImage("assets/images/bg2.png"),
          fit: BoxFit.cover));
}
