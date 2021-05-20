import 'package:flutter/material.dart';
import 'package:flutter_app_menu/ui/menu_main.dart';

class MenuSplash extends StatefulWidget {
  @override
  _MenuSplashState createState() => _MenuSplashState();
}

class _MenuSplashState extends State<MenuSplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => MenuMain()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/image/ptm_splash.png',
      fit: BoxFit.cover,
    );
  }
}
