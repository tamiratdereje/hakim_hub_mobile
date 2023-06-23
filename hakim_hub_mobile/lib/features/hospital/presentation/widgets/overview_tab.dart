import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/features/core/splash_screen.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_detail_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/hospital_card.dart';

import '../../../../core/utils/colors.dart';

class OverviewTab extends StatefulWidget {
  const OverviewTab({super.key, required InstitutionDetailDomain institutionDetailDomain});

  @override
  State<OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  int _selectedIndex = -1;
  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
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
          Positioned(top: 160, left: 30, right: 30, child: HospitalCard()),
          const Padding(
            padding: EdgeInsets.only(top: 280, right: 16, left: 16),
            child: Text(
              'Hospital Desciption',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 320, right: 16, left: 16),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(top: 430, right: 26, left: 16),
            child: Image.asset(
              'assets/images/google_map.jfif',
              height: 200,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 658.0, right: 16, left: 16),
            child: const Text(
              'Services We Provide',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(top: 698.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.07),
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
                      title: const Text(
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
                        color: Colors.grey.withOpacity(0.07),
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
                      title: const Text(
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
                        color: Colors.grey.withOpacity(0.07),
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
                      title: const Text(
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
                        color: Colors.grey.withOpacity(0.07),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/right_icon.png',
                      ),
                      title: const Text(
                        'Pharmacy and medication services.',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 938.0, right: 16, left: 16),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Row(
                children: [
                  clock,
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Available 24 hrs  5 days a week"),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  location,
                  SizedBox(
                    width: 300,
                    child: Text(
                      "Bole, In front of Rwanda Embassy, Addis Ababa, Ethiopia",
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              TextButton(onPressed: () {}, child: const Text("SEE IT ON MAP"))
            ]),
          )
        ],
      ),
    );
  }
}
