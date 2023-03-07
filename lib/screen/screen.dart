// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import '../other/size.dart';
import '../state/body.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    required Key key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Image.asset(
          image,
          height: getProportionateScreenHeight(300),
          width: getProportionateScreenWidth(255),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
