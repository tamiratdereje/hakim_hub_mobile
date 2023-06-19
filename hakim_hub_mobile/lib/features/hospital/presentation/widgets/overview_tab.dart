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
                        color:
                            Color.fromARGB(255, 201, 201, 201).withOpacity(0.5),
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
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
              TextButton(onPressed: () {}, child: Text("SEE IT ON MAP"))
            ])
          ],
        ),
      ),
    );
  }
}
