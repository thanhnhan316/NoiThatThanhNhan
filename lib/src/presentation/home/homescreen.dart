import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thanhnhan_project/src/configs/constanst/app_colors.dart';
import 'package:thanhnhan_project/src/models/product.dart';
import 'package:thanhnhan_project/src/presentation/detail/detailscreen.dart';
import 'package:thanhnhan_project/src/presentation/login/loginscreen.dart';
import 'package:thanhnhan_project/src/services/fetchdata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: buildWidget(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add, size: 35),
          backgroundColor: BACKGROUND),
    );
  }

  Widget buildWidget() {
    return Stack(
      children: [
        Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    BACKGROUND,
                    Colors.white,
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
            ),
            child: CustomPaint(
              painter: ShapePainter(),
            )),
        buildContent()
      ],
    );
  }

  Widget buildContent() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 20),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Image.asset('assets/images/home.png',
                      width: size.width * 0.3, fit: BoxFit.fitWidth)),
              Expanded(child: Container()),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz, size: 40, color: Colors.white))
            ],
          ),
          SizedBox(height: size.height * 0.015),
          Container(
            // margin: Ma,
            height: 40,
            width: size.width * 0.8,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "tìm kiếm",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
          ),
          SizedBox(height: size.height * 0.047),
          listCategorie(),
          listProduct()
        ],
      ),
    );
  }

  Widget listCategorie() {
    return Container(
      height: size.height * 0.11,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildCategorie("assets/images/tatca.png", "  Tất cả", 0),
          buildCategorie("assets/images/ban.png", "    Bàn", 0),
          buildCategorie("assets/images/giuong.png", "  Giường", 1),
          buildCategorie("assets/images/tu.png", "  Tủ", 0),
          buildCategorie("assets/images/sofa.png", "  Sofa", 0),
        ],
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget listProduct() {
    return Expanded(
      child: FutureBuilder(
          future: FetchData().fetchDataProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                padding: EdgeInsets.all(7),
                crossAxisCount: 2,
                children: List.generate(snapshot.data.length, (index) {
                  return buildProduct(snapshot.data[index]);
                }),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Widget buildCategorie(String image, String name, int i) {
    return Card(
      elevation: 5,
      child: Container(
        color: i == 1 ? Colors.orange.shade300 : Colors.white,
        height: size.height * 0.09,
        width: size.height * 0.09,
        padding: EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(image,
                height: size.height * 0.05,
                width: size.height * 0.06,
                fit: BoxFit.fill),
            Text(name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: i == 0 ? BACKGROUND : Colors.white))
          ],
        ),
      ),
    );
  }

  Widget buildProduct(Product p) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            Expanded(child: Image.network(p.image)),
            Text(p.title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Giá : ${p.price} \$"),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(p)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(2),
                    child: Text("Chi tiết",
                        style: TextStyle(fontSize: 14, color: Colors.white)),
                    decoration: BoxDecoration(
                        color: BACKGROUND,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
            SizedBox(height: 25)
          ],
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.21);
    path.quadraticBezierTo(size.width * 0.01, size.height * 0.185,
        size.width * 0.3, size.height * 0.185);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.185,
        size.width * 0.7, size.height * 0.185);
    path.quadraticBezierTo(
        size.width, size.height * 0.185, size.width, size.height * 0.14);
    path.lineTo(size.width, size.height);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
