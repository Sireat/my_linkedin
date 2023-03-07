// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:my_linkedin/screen/sign/sign_up.dart';

import '../other/fixeds.dart';
import '../other/size.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
                    "Forget Password",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  const Text(
                    "To Reset go a head",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email or phone",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: getProportionateScreenHeight(55),
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
                        "Reset password",
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
