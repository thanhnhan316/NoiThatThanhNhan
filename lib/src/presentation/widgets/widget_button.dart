import 'package:flutter/material.dart';
import 'package:thanhnhan_project/src/configs/constanst/app_colors.dart';

class WidgetButton extends StatelessWidget {
  double height;
  double width;
  String name;
  Color color;
  dynamic funtion;

  WidgetButton(this.width, this.height, this.name, this.color, this.funtion);

  @override
  Widget build(BuildContext context) {
    // có thể vuốt, chạm, lắc
    return GestureDetector(
      child: Card(
        color: Colors.transparent,
        elevation: 20,
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: new LinearGradient(
                  colors: [
                    BACKGROUND,
                    Colors.orange.withOpacity(0.6),
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
            ),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )),
      ),
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => funtion));
      },
    );
  }
}
