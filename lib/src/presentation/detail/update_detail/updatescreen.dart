import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thanhnhan_project/src/configs/constanst/app_colors.dart';
import 'package:thanhnhan_project/src/models/product.dart';
import 'package:thanhnhan_project/src/presentation/detail/detailscreen.dart';

class UpdateScreen extends StatefulWidget {
  final Product p;
  const UpdateScreen({Key? key, required this.p}) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState(p);
}

class _UpdateScreenState extends State<UpdateScreen> {
  late Size size;
  File _image = File('file.txt');
  final Product p;
  _UpdateScreenState(this.p);

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image as File;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar(),
        body: SafeArea(
          child: Center(
              child: _image != File('file.txt')
                  ? Stack(
                      children: [buildbackground(), buildedit(), buildBody()])
                  : Image.file(_image)),
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: BACKGROUND,
      elevation: 0,
      leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, size: 50),
          onPressed: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => DetailScreen(this.p)))),
      actions: <Widget>[
        Icon(Icons.search, size: 30),
        SizedBox(width: 30),
        Icon(Icons.more_horiz, size: 30),
        SizedBox(width: 20)
      ],
    );
  }

  Widget buildbackground() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: size.height * 0.33,
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
          Image.network(p.image,
              height: size.height * 0.2, fit: BoxFit.fitHeight),
          Text("Gi?? : ${p.price} \$",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: size.height * 0.02),
          Text("Lo???i h??ng : Sofa",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.02),
          Text("Ng??y nh???p: 05/12/2021",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.02),
          Text("S??? l?????ng : 12",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.02),
          Text("Xu???t s???: Nh???t B???n",
              style: TextStyle(fontSize: 18, color: BACKGROUND)),
          SizedBox(height: size.height * 0.02),
          Container(
            width: size.width * 0.7,
            child: Text(
                "Gh??? sofa 2.5s EGEDAL s??? d???ng ch???t li???u v???i 100% polyester v???i ??u ??i???m m???m, m???n v?? th???m h??t t???t. Ch??n gh??? l??m t??? g??? s???i ch???c ch???n, ...",
                style: TextStyle(fontSize: 18, color: BACKGROUND)),
          ),
          SizedBox(height: size.height * 0.05),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DetailScreen(p)));
              },
              child: Container(
                  padding: EdgeInsets.all(size.height * 0.01),
                  width: size.width * 0.3,
                  height: size.height * 0.05,
                  child: Text("C???p nh???t",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: BACKGROUND)),
            ),
          )
        ],
      ),
    );
  }

  Widget buildedit() {
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                show();
              },
              icon: Icon(Icons.edit, color: Colors.white)),
          IconButton(
              onPressed: () {
                getImage();
              },
              icon: Icon(Icons.camera_alt, color: Colors.white)),
          SizedBox(height: size.height * 0.11),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.edit, color: Colors.white)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.edit, color: BACKGROUND)),
          SizedBox(height: size.height * 0.03),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.edit, color: BACKGROUND)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.edit, color: BACKGROUND)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.edit, color: BACKGROUND))
        ],
      ),
    );
  }

  show() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: TextFormField(
          decoration: InputDecoration(hintText: "Gh??? Sofa cao c???p"),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('H???y'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Thay ?????i'),
          ),
        ],
      ),
    );
  }
}
