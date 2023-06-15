//bottom navigation bar
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';

import '../../features/hospital/presentation/screen/hospitals_home_screen.dart';

class BottomNav extends StatefulWidget {
  List<Widget> pages = [
    const HomePage(),
    const HomePage(),
    const HospitalsHomeScreen(),
  ];
  int index = 0;
  void onTap(int index) {
    this.index = index;
  }

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  //bottom navigation bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.pages[widget.index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.index,
        selectedItemColor: primaryColor,
        showSelectedLabels: true,
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedIconTheme: const IconThemeData(color: primaryColor),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (int i) {
          setState(() {
            widget.index = i;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: home, label: "Home"),
          BottomNavigationBarItem(icon: chatbot, label: "Chat"),
          BottomNavigationBarItem(icon: hospitals, label: "Hospital"),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(" dghndsjkgves dgjedg egoihe "),
    );
  }
}
