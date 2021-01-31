import 'package:flutter/material.dart';
import 'package:flutter_assignment/widgets/theme_widgets.dart';

Widget horizontalRule() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 12),
    width: double.infinity - 16,
    height: 0.3,
    color: Colors.grey,
  ),
} 

Widget dayContainer(String day, bool flag) {
  return Container(
    height: 25,
    width: 25,
    decoration: BoxDecoration(
      color: flag ? Colors.green : Colors.transparent,
      borderRadius: BorderRadius.circular(30)
    ),

    child: Center(
      child: Text(
        '$day',
        style: TextStyle(
          color: flag ? Colors.white : Colors.redAccent,            
        ),
      )
    ),
  );
}


Widget smallColumnTextWidget(String title, String time, bool theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: TextStyle(
            color: themeColorSmallText(theme)
          ),
        ),
        Text(
          '$time',
          style: TextStyle(
            fontSize: 20,
            color: themeColorText(theme)
          ),
        ),
      ],
    );
  }