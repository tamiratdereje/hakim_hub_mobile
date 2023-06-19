import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/features/core/splash_screen.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/screen/hospital_gallery_page.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/doctor_grid_view.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/hospital_card.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/overview_tab.dart';

class OverviewDoctorGalleryPage extends StatefulWidget {
  const OverviewDoctorGalleryPage({Key? key}) : super(key: key);

  @override
  State<OverviewDoctorGalleryPage> createState() =>
      _OverviewDoctorGalleryPageState();
}

class _OverviewDoctorGalleryPageState extends State<OverviewDoctorGalleryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      _selectedIndex = _tabController.index;
    });
  }

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.animateTo(index);
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
          Positioned(top: 160, left: 30, right: 30, child: HospitalCard()),
          Positioned(
            top: 270,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    3,
                    (index) => SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 40,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.zero,
                          backgroundColor: _selectedIndex == index
                              ? Colors.grey[300]
                              : Colors.transparent,
                        ),
                        onPressed: () {
                          _onButtonPressed(index);
                        },
                        child: Text(
                          index == 0
                              ? 'Overview'
                              : index == 1
                                  ? 'Doctors'
                                  : 'Gallery',
                          style: TextStyle(
                            color: _selectedIndex == index
                                ? Colors.blue
                                : Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      OverviewTab(),
                      DoctorGridView(),
                      GalleryTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class OverviewTab extends StatelessWidget {
//   const OverviewTab({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         "Overview Tab",
//         style: TextStyle(
//           fontFamily: 'Poppins',
//           fontWeight: FontWeight.bold,
//           fontSize: 20.0,
//         ),
//       ),
//     );
//   }
// }
