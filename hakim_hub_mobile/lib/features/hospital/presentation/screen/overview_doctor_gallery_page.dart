import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/features/core/splash_screen.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/doctor_grid_view.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/hospital_card.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/overview_tab.dart';

import '../widgets/hospital_gallery_page.dart';

class My_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('fr', 'FR'), // French
      ],
      home: OverviewDoctorGalleryPage(),
    );
  }
}

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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white, // Set the background color here
          title: Text(
            "hospitalName",
            style: TextStyle(
              color: Colors.black, // Set the text color here
            ),
          ),
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_outlined),
            onPressed: () {
              // Navigate back to the previous screen
              Navigator.pop(context);
            },
          ),
        ),
        body: Localizations(
          delegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: Locale("en", 'US'),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: primaryColor,
                    controller: _tabController,
                    onTap: _onButtonPressed,
                    tabs: [
                      Tab(
                        text: 'Overview',
                      ),
                      Tab(text: 'Doctors'),
                      Tab(text: 'Gallery'),
                    ],
                  ),
                ),
                pinned: true,
              ),
              SliverFillRemaining(
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
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
