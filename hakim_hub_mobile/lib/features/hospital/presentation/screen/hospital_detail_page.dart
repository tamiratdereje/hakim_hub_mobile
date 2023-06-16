import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/features/core/splash_screen.dart';
import '../../../../core/shared_widgets/bottom_nav.dart';
import '../widgets/hospital_card.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _selectedIndex = -1;
  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SplashPage()),
                );
              },
              child: Image.asset(
                'assets/images/black_lion.png',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 110, // Adjust the position of the text as needed
            left: 16,
            child: Text(
              'Tikur Anbessa',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //  Positioned(
          //   top: 110, // Adjust the position of the text as needed
          //   left: 16,
          //   child: IconButton(onPressed: (){}, icon: Icon.)
          // ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
          Positioned(top: 160, left: 30, right: 30, child: HospitalCard()),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(1),
                    ),
                    SizedBox(height: 1),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _onButtonPressed(0);
                            },
                            child: Text("overview"),
                            style: ElevatedButton.styleFrom(
                              primary: _selectedIndex == 0
                                  ? const Color.fromARGB(255, 185, 192, 196)
                                  : Theme.of(context).cardColor,
                              onPrimary: _selectedIndex == 0
                                  ? Colors.lightBlue
                                  : const Color.fromARGB(255, 12, 11, 11),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _onButtonPressed(1);
                            },
                            child: Text("search"),
                            style: ElevatedButton.styleFrom(
                              primary: _selectedIndex == 1
                                  ? const Color.fromARGB(255, 191, 196, 199)
                                  : Theme.of(context).cardColor,
                              onPrimary: _selectedIndex == 1
                                  ? Colors.lightBlue
                                  : const Color.fromARGB(255, 12, 11, 11),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _onButtonPressed(2);
                            },
                            child: Text("settings"),
                            style: ElevatedButton.styleFrom(
                              primary: _selectedIndex == 2
                                  ? const Color.fromARGB(255, 161, 169, 173)
                                  : Theme.of(context).cardColor,
                              onPrimary: _selectedIndex == 2
                                  ? Colors.lightBlue
                                  : const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Hospital Desciption',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Image.asset(
                      '/home/fenet/Desktop/hakim_hub_mobile/hakim_hub_mobile/hakim_hub_mobile/assets/images/map.png',
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      'Services We Provide',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Card(
                            child: ListTile(
                              leading: Image.asset(
                                'assets/images/right_icon.png',
                              ),
                              title: Text(
                                'General and specialty services.',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Card(
                            child: ListTile(
                              leading: Image.asset(
                                'assets/images/right_icon.png',
                              ),
                              title: Text(
                                'Medical consultations and checkups.',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Card(
                            child: ListTile(
                              leading: Image.asset(
                                'assets/images/right_icon.png',
                              ),
                              title: Text(
                                'Diagnostic and laboratory services.',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 201, 201, 201)
                                    .withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Card(
                            child: ListTile(
                              leading: Image.asset(
                                'assets/images/right_icon.png',
                              ),
                              title: Text(
                                'Pharmacy and medication services.',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              clock,
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Available 24 hrs  5 days a week"),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              location,
                              SizedBox(
                                width: 30,
                                child: Text(
                                  "Bole, In front of Rwanda Embassy, Addis Ababa, Ethiopia",
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                              onPressed: () {}, child: Text("SEE IT ON MAP"))
                        ])
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const ServiceCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 16),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(17),
      // ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 60,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
