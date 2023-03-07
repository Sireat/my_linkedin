// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/rendering.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  bool _isScrollDown = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _initialScroll();
  }

  void _initialScroll() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollDown) {
          _isScrollDown = true;
          _hideAppNavBar();
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollDown) {
          _isScrollDown = false;
          _showAppNvBar();
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
      return Container();
      //color: Colors.black12,
      //child: Column(
      //  children: [
      //_showAppNavBar
      //?CustomAppBar(
      // sizingInformation: sizingInformation, key: null,
      // )
      // : const SizedBox(
      //    height: 0.0,
      //    width: 0.0,
      //  ),
      //_listPostWidget(sizingInformation),
      // ],
      // ),
      //);
    });
  }

  void _hideAppNavBar() {
    setState(() {});
  }

  void _showAppNvBar() {
    setState(() {});
  }
}
