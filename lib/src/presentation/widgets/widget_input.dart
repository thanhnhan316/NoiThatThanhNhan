import 'package:flutter/material.dart';
import 'package:thanhnhan_project/src/configs/constanst/app_colors.dart';

class WidgetInput extends StatelessWidget {
  final double height;
  final double width;
  final String name;
  final Icon icons;

  WidgetInput(
    this.height,
    this.width,
    this.name,
    this.icons,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          //chinh text name thanh in hoa
          name.toUpperCase(),
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              //độ mờ của color
              color: Colors.black.withOpacity(0.6)),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              prefixIcon: icons,
              labelText: '$name',
              hintText: '$name ',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: BACKGROUND))),
        ),
      ],
    );
  }
}
