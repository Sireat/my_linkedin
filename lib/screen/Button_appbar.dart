// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:responsive_builder/responsive_builder.dart';

Widget rowSingleButton(
    {required String name,
    required String iconImage,
    required Color color,
    required bool isHover}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
    decoration: BoxDecoration(
        color: isHover ? Colors.black.withOpacity(.1) : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(4))),
    child: Row(
      children: [
        SizedBox(
          width: 28,
          height: 28,
          child: Image.asset(
            iconImage,
            color: color,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget rowSinglePostButton(
    {required String iconImage, required Color color, required bool isHover}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
    decoration: BoxDecoration(
        color: isHover ? Colors.black.withOpacity(.1) : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(4))),
    child: SizedBox(
      width: 28,
      height: 28,
      child: Image.asset(
        iconImage,
        color: color,
      ),
    ),
  );
}

class CustomAppBar extends StatelessWidget {
  final SizingInformation sizingInformation;

  const CustomAppBar({required Key key, required this.sizingInformation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      height: sizingInformation.screenSize.height * 0.08,
      padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 33,
                  width: 33,
                  decoration: BoxDecoration(
                    color: Colors.purple[500],
                    // border: Border.all(color: Colors.white,width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Center(
                      child: Text(
                    "c",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
          Container(
            height: 35,
            width: sizingInformation.screenSize.width / 1.40,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.white70),
            child: const TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black87,
                  ),
                  suffixIcon: Icon(Icons.qr_code, color: Colors.black87)),
            ),
          ),
          const SizedBox(
              height: 30,
              width: 30,
              child: Icon(FontAwesomeIcons.facebookMessenger)),
        ],
      ),
    );
  }
}
