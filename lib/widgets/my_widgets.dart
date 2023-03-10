import 'package:flutter/material.dart';

Widget square(Color color, Icon icon) => Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: icon,
    );

Widget lineSettings = Container(
  margin: const EdgeInsets.all(0),
  padding: const EdgeInsets.all(0),
  height: 2,
  width: 15,
  color: Colors.grey,
);

// App bar widget
Widget appBar = Row(
  children: [
    TextButton(
      onPressed: () {},
      onFocusChange: null,
      child: Column(
        children: [
          lineSettings,
          const SizedBox(height: 10),
          lineSettings,
          const SizedBox(height: 10),
          lineSettings,
        ],
      ),
    ),
  ],
);
