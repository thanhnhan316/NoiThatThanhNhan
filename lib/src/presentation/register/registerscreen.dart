import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thanhnhan_project/src/configs/constanst/app_colors.dart';
import 'package:thanhnhan_project/src/presentation/login/loginscreen.dart';
import 'package:thanhnhan_project/src/presentation/widgets/widget_button.dart';
import 'package:thanhnhan_project/src/presentation/widgets/widget_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: buildWidget(),
    );
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
              Text("Đăng Ký",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: BACKGROUND)),
              Spacer(flex: 1),
              WidgetInput(50, size.width, 'Username',
                  Icon(Icons.person, color: BACKGROUND)),
              Spacer(flex: 1),
              WidgetInput(50, size.width, 'Email',
                  Icon(Icons.email, color: BACKGROUND)),
              Spacer(flex: 1),
              WidgetInput(50, size.width, 'NumberPhone',
                  Icon(Icons.phone, color: BACKGROUND)),
              Spacer(flex: 1),
              WidgetInput(50, size.width, 'Password',
                  Icon(Icons.lock, color: BACKGROUND)),
              Spacer(flex: 1),
              WidgetInput(50, size.width, 'Confim Password',
                  Icon(Icons.lock, color: BACKGROUND)),
              Spacer(flex: 2),
              WidgetButton(size.width, 50, 'Đăng Ký', BACKGROUND, LoginScreen()),
              Spacer(flex: 2),
              Expanded(child: register()),
              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget register() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bạn đã có tài khoản? '),
          Text(
            'Đăng nhập',
            style: TextStyle(color: BACKGROUND),
          )
        ],
      ),
    );
  }
}
