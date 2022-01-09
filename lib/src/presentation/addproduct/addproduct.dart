import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thanhnhan_project/src/configs/constanst/app_colors.dart';
import 'package:thanhnhan_project/src/presentation/home/homescreen.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<AddProductScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppBar(),
        body:
            SafeArea(child: Stack(children: [buildbackground(), buildBody()])));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: BACKGROUND,
      elevation: 0,
      leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, size: 50),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()))),
    );
  }

  Widget buildbackground() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: size.height * 0.7,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          input("tên sản phẩm"),
          input("ghi chú"),
          input("giá"),
          input("loại hàng"),
          input("số lượng"),
          input("nơi xuất xứ"),
          input("Chi tiết"),
          Row(
            children: [
              Text("TẢI ẢNH",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(width: 50),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_a_photo_outlined,
                      color: Colors.white, size: 40))
            ],
          ),
          SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Container(
                    padding: EdgeInsets.all(size.height * 0.01),
                    width: size.width * 0.3,
                    height: size.height * 0.05,
                    child: Text("Hoàn tác",
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
                child: Container(
                    padding: EdgeInsets.all(size.height * 0.01),
                    width: size.width * 0.3,
                    height: size.height * 0.05,
                    child: Text("Thêm Mới",
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
          ),
          SizedBox(height: size.height * 0.02)
        ],
      ),
    );
  }

  Widget input(var name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${name.toString().toUpperCase()}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Container(
          width: size.width * 0.6,
          child: Column(
            children: [
              TextFormField(
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    hintText: 'Nhập $name',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none),
              ),
              Container(height: 1.5, color: Colors.white)
            ],
          ),
        ),
      ],
    );
  }
}
