import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';

class OverviewTab extends StatefulWidget {
  const OverviewTab({super.key});

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
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(1),
            ),
           
            const SizedBox(height: 16),
           const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Hospital Desciption',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
           const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              'assets/images/google_map.jfif',
              height: 200,
              fit: BoxFit.cover,
            ),
           const SizedBox(
              height: 60,
            ),
           const  Text(
              'Services We Provide',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
           const  SizedBox(height: 16),
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
                        color:
                            const Color.fromARGB(255, 201, 201, 201).withOpacity(0.5),
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
           const SizedBox(
              height: 15,
            ),
 Column(mainAxisAlignment: MainAxisAlignment.start, children: [
             const Row(
                children: [
                  clock,
                  Padding(
                    padding:  EdgeInsets.all(8.0),
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
              TextButton(onPressed:  () {}, child: const Text("SEE IT ON MAP"))
            ])
          ],
        ),
      ),
    );
  }
}
