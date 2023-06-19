import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/screen/hospital_gallery_page.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/doctor_card.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/doctor_grid_view.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/hospital_card.dart';

import 'package:flutter/material.dart';

import '../../../../core/utils/icons.dart';
import '../widgets/filter_page.dart';
import '../widgets/overview_tab.dart';

class HospitalDoctorDetailPage extends StatefulWidget {
  const HospitalDoctorDetailPage({Key? key}) : super(key: key);

  @override
  _HospitalDoctorDetailPageState createState() =>
      _HospitalDoctorDetailPageState();
}

class _HospitalDoctorDetailPageState extends State<HospitalDoctorDetailPage>
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: UIConverter.getComponentHeight(context, 342),
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                SizedBox(
                  width: UIConverter.getComponentWidth(context, 428),
                  child: Image.asset(
                    'assets/images/tikur_anbesa.png',
                    fit: BoxFit.fitWidth,
                    height: UIConverter.getComponentWidth(context, 250),
                  ),
                ),
                Positioned(
                  top: UIConverter.getComponentHeight(context, 52),
                  left: UIConverter.getComponentWidth(context, 20),
                  child: GestureDetector(
                    child: const CircleAvatar(
                      child: backButtonPro,
                      backgroundColor: backgroundColor,
                    ),
                    onTap: () {
                      context.pop();
                    },
                  ),
                ),
                Positioned(
                  top: UIConverter.getComponentHeight(context, 212),
                  left: UIConverter.getComponentWidth(context, 52),
                  child: const Text(
                    "Tikur Anbesa",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 25,
                    ),
                  ),
                ),
                Positioned(
                  top: UIConverter.getComponentHeight(context, 300),
                  left: UIConverter.getComponentWidth(context, 42),
                  child: HospitalCard(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: UIConverter.getComponentHeight(context, 95),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: UIConverter.getComponentWidth(context, 88),
                height: UIConverter.getComponentHeight(context, 31),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.zero,
                    backgroundColor: _selectedIndex == 0
                        ? Colors.grey[300]
                        : Colors.transparent,
                  ),
                  onPressed: () {
                    _onButtonPressed(0);
                  },
                  child: Text(
                    'Overview',
                    style: TextStyle(
                      color: _selectedIndex == 0 ? Colors.blue : Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: UIConverter.getComponentWidth(context, 88),
                height: UIConverter.getComponentHeight(context, 31),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.zero,
                    backgroundColor: _selectedIndex == 1
                        ? Colors.grey[300]
                        : Colors.transparent,
                  ),
                  onPressed: () {
                    _onButtonPressed(1);
                  },
                  child: Text(
                    'Doctors',
                    style: TextStyle(
                      color: _selectedIndex == 1 ? Colors.blue : Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: UIConverter.getComponentWidth(context, 88),
                height: UIConverter.getComponentHeight(context, 31),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.zero,
                    backgroundColor: _selectedIndex == 2
                        ? Colors.grey[300]
                        : Colors.transparent,
                  ),
                  onPressed: () {
                    _onButtonPressed(2);
                  },
                  child: Text(
                    'Gallery',
                    style: TextStyle(
                      color: _selectedIndex == 2 ? Colors.blue : Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_selectedIndex == 1)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: UIConverter.getComponentWidth(context, 25),
                      ),
                      child: Text('Doctors in this hospital'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: UIConverter.getComponentWidth(context, 12),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            'Filter',
                            style: TextStyle(
                              color: chiptextColor2,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: titleTextColor,
                                context: context,
                                builder: (BuildContext context) {
                                  return const FilterPage();
                                },
                              );
                            },
                            icon: filter,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
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
    );
  }
}
