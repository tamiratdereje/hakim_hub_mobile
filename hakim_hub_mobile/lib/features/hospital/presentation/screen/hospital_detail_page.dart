import 'package:flutter/material.dart';

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
            child: Image.asset(
              'assets/images/black_lion.png',
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 200,
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
                      padding: EdgeInsets.all(16),
                    ),
                    SizedBox(height: 16),
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
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
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
                        Card(
                          child: ListTile(
                            leading: Image.asset(
                                "/home/fenet/Desktop/hakim_hub_mobile/hakim_hub_mobile/hakim_hub_mobile/assets/images/right_icon.png"),
                            title: Text(
                                'General and specialty surgical services.'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Image.asset(
                                "/home/fenet/Desktop/hakim_hub_mobile/hakim_hub_mobile/hakim_hub_mobile/assets/images/right_icon.png"),
                            title: Text('Emergency room services.'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Image.asset(
                                "/home/fenet/Desktop/hakim_hub_mobile/hakim_hub_mobile/hakim_hub_mobile/assets/images/right_icon.png"),
                            title: Text('X ray or radiology services'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Image.asset(
                                '/home/fenet/Desktop/hakim_hub_mobile/hakim_hub_mobile/hakim_hub_mobile/assets/images/right_icon.png'),
                            title: Text(
                                'General and specialty surgical services.'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Image.asset(
                                "/home/fenet/Desktop/hakim_hub_mobile/hakim_hub_mobile/hakim_hub_mobile/assets/images/right_icon.png"),
                            title: Text(
                                'General and specialty surgical services.'),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Available 24 hrs 5 days a week',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
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
