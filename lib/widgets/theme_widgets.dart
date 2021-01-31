import 'package:flutter/material.dart';

Color themeColorBg(bool theme) {
  if(theme) {
    return Colors.blueGrey[900];
  } else {
    return Colors.white;
  }
}

Color themeColorCard(bool theme) {
  if(theme) {
    return Colors.blueGrey[700];
  } else {
    return null;
  }
}

Color themeColorText(bool theme) {
  if(!theme) {
    return Colors.blueGrey[900];
  } else {
    return Colors.white;
  }
}

Color themeColorSmallText(bool theme) {
  if(!theme) {
    return Colors.blueGrey[300];
  } else {
    return Colors.grey;
  }
}