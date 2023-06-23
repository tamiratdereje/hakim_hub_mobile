import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/bloc/bloc/hospital_detail_bloc.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/doctor_grid_view.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/hospital_gallery_page.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/overview_tab.dart';

class OverviewDoctorGalleryPage extends StatefulWidget {
  String institutionId;
  OverviewDoctorGalleryPage({required this.institutionId, Key? key})
      : super(key: key);

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
    BlocProvider.of<HospitalDetailBloc>(context)
        .add(HospitalDetailGetEvent(id: widget.institutionId));
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
          title: const Text(
            "hospitalName",
            style: TextStyle(
              color: Colors.black, // Set the text color here
            ),
          ),
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back_outlined),
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
          child: BlocBuilder<HospitalDetailBloc, HospitalDetailState>(
            builder: ((context, state) {
              if (state is DetailHospitalLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              } else if (state is DetailHospitalSuccess) {
                return CustomScrollView(
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
                          OverviewTab(
                            institutionDetailDomain:
                                state.institutionDetailDomain,
                          ),
                          DoctorGridView(
                            institutionId: state.institutionDetailDomain.id,
                            filterList:
                                state.institutionDetailDomain.allSpecialities,
                            onFilterChanged: (doctorFilterDomain) {
                              BlocProvider.of<HospitalDetailBloc>(context).add(
                                  DoctorFilterEvent(
                                      filter: doctorFilterDomain,
                                      institutionDetailDomain:
                                          state.institutionDetailDomain));
                            },
                          ),
                          GalleryTab(
                            images: state.institutionDetailDomain.photos,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Text('Error');
              }
            }),
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
