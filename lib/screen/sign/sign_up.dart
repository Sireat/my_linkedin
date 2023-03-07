// ignore: depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_linkedin/screen/sign/sign_in.dart';
import '../../other/fixeds.dart';
import '../../other/size.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        // width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                "assets/Logo.png",
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add your name",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "First Name"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Last Name"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: getProportionateScreenHeight(50),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kPrimaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: const BorderSide(
                                          color: kPrimaryColor)))),
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const SignUp2(),
                      )),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class SignUp2 extends StatelessWidget {
  const SignUp2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                "assets/Logo.png",
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add your Email",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Email"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: getProportionateScreenHeight(50),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kPrimaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: const BorderSide(
                                          color: kPrimaryColor)))),
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SignUp3(),
                      )),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class SignUp3 extends StatelessWidget {
  SignUp3({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future signup() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((value) => SignIn());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        // width: double.infinity,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                "assets/Logo.png",
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Set your password",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: "Email"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: "Password"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text.rich(TextSpan(
                      text: "You are agree to LinkedIn  ",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'User Agreement ',
                          style: const TextStyle(
                              fontSize: 14, color: kPrimaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                              );
                              // single tapped
                            },
                        ),
                        TextSpan(
                          text: ' , Privacy Policy ',
                          style: const TextStyle(
                            fontSize: 14,
                            color: kPrimaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                              );
                              // single tapped
                            },
                        ),
                        TextSpan(
                          text: ' and ',
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                              );
                              // single tapped
                            },
                        ),
                        const TextSpan(
                          text: 'Cookie Policy ',
                          style: TextStyle(fontSize: 14, color: kPrimaryColor),

                          // recognizer: TapGestureRecognizer()..onTap = () {
                          // Navigator.push(context,MaterialPageRoute(builder: (context) =>const SignIn()),);
                          // // single tapped
                          // },
                        ),
                      ])),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: getProportionateScreenHeight(50),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kPrimaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: const BorderSide(
                                          color: kPrimaryColor)))),
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SignIn(),
                      )),
                      child: GestureDetector(
                        onTap: signup,
                        child: Text(
                          "Agree & Join",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
