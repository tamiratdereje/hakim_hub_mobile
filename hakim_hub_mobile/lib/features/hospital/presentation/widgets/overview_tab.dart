import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/features/core/splash_screen.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_detail_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/hospital_card.dart';

import '../../../../core/utils/colors.dart';

class OverviewTab extends StatefulWidget {
  final InstitutionDetailDomain institutionDetailDomain;

  OverviewTab({Key? key, required this.institutionDetailDomain})
      : super(key: key);

  @override
  _OverviewTabState createState() => _OverviewTabState();
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
      child: Column(
        children: [
          Stack(children: [
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
              top: 160,
              left: 30,
              right: 30,
              child: HospitalCard(),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 280, right: 16, left: 16),
            child: Text(
              'Hospital Description',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 320, right: 16, left: 16),
            child: Text(
              widget.institutionDetailDomain.summary,
              style: const TextStyle(
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
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.institutionDetailDomain.services.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
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
                  child: ListTile(
                    leading: Image.asset('assets/images/right_icon.png'),
                    title: Text(
                      widget.institutionDetailDomain.services[index],
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 938.0, right: 16, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    clock,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text("Available 24 hrs  5 days a week"),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    location,
                    SizedBox(
                      width: 300,
                      child: Text(
                        widget.institutionDetailDomain.address.summary,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("SEE IT ON MAP"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
