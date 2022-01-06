import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thanhnhan_project/src/configs/constanst/app_colors.dart';
import 'package:thanhnhan_project/src/presentation/home/homescreen.dart';
import 'package:thanhnhan_project/src/presentation/register/registerscreen.dart';
import 'package:thanhnhan_project/src/presentation/widgets/widget_button.dart';
import 'package:thanhnhan_project/src/presentation/widgets/widget_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(backgroundColor: Colors.white, body: buildWidget());
  }

  Widget buildWidget() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: size.height,
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/login.jpg'),
              Spacer(flex: 1),
              WidgetInput(50, size.width, 'Username',
                  Icon(Icons.person, color: BACKGROUND)),
              Spacer(flex: 1),
              WidgetInput(50, size.width, 'Password',
                  Icon(Icons.lock, color: BACKGROUND)),
              Spacer(flex: 2),
              WidgetButton(
                  size.width, 50, 'Đăng nhập', BACKGROUND, HomeScreen()),
              Spacer(flex: 1),
              line(size),
              Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.facebook, color: BACKGROUND, size: 50),
                  CircleAvatar(
                      radius: 22,
                      child: Text('G',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      backgroundColor: BACKGROUND),
                  CircleAvatar(
                      radius: 22,
                      backgroundColor: BACKGROUND,
                      child: Icon(Icons.email_outlined,
                          color: Colors.white, size: 37))
                ],
              ),
              Spacer(flex: 1),
              Expanded(child: register()),
              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget line(Size size) {
    return Row(
      children: [
        Expanded(
            child:
                Container(height: 1, width: size.width, color: Colors.black)),
        Text('  hoặc đăng nhập với  '),
        Expanded(
            child: Container(height: 1, width: size.width, color: Colors.black))
      ],
    );
  }

  Widget register() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => RegisterScreen()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bạn chưa có tài khoản? '),
          Text(
            'Đăng ký',
            style: TextStyle(color: BACKGROUND),
          )
        ],
      ),
    );
  }
}
