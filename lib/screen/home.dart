// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_linkedin/repository/data.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_page.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.green,

              onTap: onTabTapped, // new
              currentIndex: _currentIndex,
              // new
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    // ignore: deprecated_member_use
                    FontAwesomeIcons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    // ignore: deprecated_member_use
                    FontAwesomeIcons.userFriends,
                  ),
                  label: 'My network',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      // ignore: deprecated_member_use
                      FontAwesomeIcons.plusCircle,
                    ),
                    label: 'Post'),
                BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.solidBell,
                    ),
                    label: 'Notifications'),
                BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.briefcase,
                    ),
                    label: 'Jobs')
              ],
            ),
            body: _children[_currentIndex],
          ),
        );
      },
    );
  }
}
