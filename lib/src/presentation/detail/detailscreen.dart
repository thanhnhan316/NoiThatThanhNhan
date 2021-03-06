import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thanhnhan_project/src/configs/constanst/app_colors.dart';
import 'package:thanhnhan_project/src/models/product.dart';
import 'package:thanhnhan_project/src/presentation/detail/update_detail/updatescreen.dart';
import 'package:thanhnhan_project/src/presentation/home/homescreen.dart';

class DetailScreen extends StatefulWidget {
  Product p;
  DetailScreen(this.p);
  @override
  _DetailScreenState createState() => _DetailScreenState(p);
}

class _DetailScreenState extends State<DetailScreen> {
  Product p;
  _DetailScreenState(this.p);
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
            child: Stack(
                children: [buildbackground(), buildImage(), buildBody()])));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: BACKGROUND,
      elevation: 0,
      leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, size: 50),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()))),
      actions: <Widget>[
        Icon(Icons.search, size: 30),
        SizedBox(width: 30),
        Icon(Icons.more_horiz, size: 30),
        SizedBox(width: 20)
      ],
    );
  }

  Widget buildImage() {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.1, left: size.width * 0.27),
      child: Image.network(p.image,
          height: size.height * 0.37, fit: BoxFit.fitHeight),
    );
  }

  Widget buildbackground() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: size.height * 0.3,
            decoration: BoxDecoration(
                color: BACKGROUND,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
          )
        ],
      ),
    );
  }

  Widget buildBody() {
    return Container(
      height: size.height,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Gh??? Sofa cao c???p",
              style: TextStyle(
                fontSize: 27,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          Text("???????c l??m t??? g??? v?? da", style: TextStyle(color: Colors.white)),
          SizedBox(height: size.height * 0.15),
          Text("Gi?? : ${p.price} \$",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: size.height * 0.1),
          Text("Lo???i h??ng : Sofa",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.02),
          Text("S??? l?????ng : 12",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.02),
          Text("Ng??y nh???p: 05/12/2021",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.02),
          Text("Xu???t s???: Nh???t B???n",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.02),
          Text(
              "Gh??? sofa 2.5s EGEDAL s??? d???ng ch???t li???u v???i 100% polyester v???i ??u ??i???m m???m, m???n v?? th???m h??t t???t. Ch??n gh??? l??m t??? g??? s???i ch???c ch???n, ph???n ?????m ng???i d??y mang l???i c???m ...",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  show();
                },
                child: Container(
                    padding: EdgeInsets.all(size.height * 0.01),
                    width: size.width * 0.3,
                    height: size.height * 0.05,
                    child: Text("X??a",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateScreen(p: p)));
                },
                child: Container(
                    padding: EdgeInsets.all(size.height * 0.01),
                    width: size.width * 0.3,
                    height: size.height * 0.05,
                    child: Text("Ch???nh s???a",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: BACKGROUND)),
              )
            ],
          )
        ],
      ),
    );
  }

  show() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text("X??c nh???n x??a"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('H???y'),
          ),
          TextButton(
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen())),
            child: const Text('?????ng ??'),
          ),
        ],
      ),
    );
  }
}
