import 'package:flutter/material.dart';

const primaryColor = Color(0xFF405FF2);

const secondaryColor = Color(0xFFFE9900);
const blackColor = Color(0xFF0D274E);
const greyColor = Color(0xFF535769);
Color hintTextColor = const Color(0xFF000000).withOpacity(0.2);
const greenColor = Color(0xFF22C55E);
const blueColor = Color(0xFF3266CC);
const redColor = Color(0xFFFF3838); //Color(0xFFDC3811);
const whiteColor = Color(0xFFFFFFFF);
const scaffoldBgColor = Color(0xFFFFFFFF);
const grayBackgroundColor = Color(0xFFF3F3F3);
const borderColor = Color(0xFFE8EFFF);
const sTextColor = Color(0xFF6B6C6C);
const textColor = Color(0xFF0C81F3);

const kDuration = Duration(microseconds: 300);

const Color transparent = Colors.transparent;
const double dialogHeight = 270.0;

///custom fonts
const String bold400 = 'Regular400';
const String bold500 = 'Regular500';
const String bold700 = 'Bold700';

///gradient colors
const buttonGradient = LinearGradient(
  begin: Alignment(0.00, -1.00),
  end: Alignment(0, 1),
  colors: [Color(0xFF885DF1), Color(0xFF6610F2)],
);

const activeTabButtonGradient = LinearGradient(
  begin: Alignment(0.00, -1.00),
  end: Alignment(0, 1),
  colors: [Color(0xFFFFC107), Color(0xFFFD7E14)],
);
const inactiveTabButtonGradient = LinearGradient(
  begin: Alignment(0.00, -1.00),
  end: Alignment(0, 1),
  colors: [Colors.white, whiteColor],
);

const dialogCircleGradient = LinearGradient(
  begin: Alignment(0.00, -1.00),
  end: Alignment(0, 1),
  colors: [Color(0xFFFFC107), Color(0xFFFD7E14)],
);
