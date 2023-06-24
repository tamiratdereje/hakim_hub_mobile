import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_detail_domain.dart';
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
          title: BlocBuilder<HospitalDetailBloc, HospitalDetailState>(
              builder: (context, state) => state is DetailHospitalSuccess
                  ? Text(
                      state.institutionDetailDomain.institutionName,
                      style: TextStyle(
                        color: Colors.black, // Set the text color here
                      ),
                    )
                  : const SizedBox.shrink(
                      child: Text(
                        'No name',
                        style: TextStyle(color: Colors.black),
                      ),
                    )),
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              // Navigate back to the previous screen
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocBuilder<HospitalDetailBloc, HospitalDetailState>(
            builder: ((context, state) {
          if (state is DetailHospitalLoading) {
            return const Center(
              child:  CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          } else if (state is DetailHospitalSuccess) {
            return Column(
              children: [
                TabBar(
                  labelColor: primaryColor,
                  controller: _tabController,
                  onTap: _onButtonPressed,
                  tabs: const [
                    Tab(
                      text: 'Overview',
                    ),
                    Tab(text: 'Doctors'),
                    Tab(text: 'Gallery'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      OverviewTab(
                        institutionDetailDomain: state.institutionDetailDomain,
                      ),
                      DoctorGridView(
                        doctors: state.institutionDetailDomain.doctors,
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
                      GalleryTab(images: state.institutionDetailDomain.photos),
                    ],
                  ),
                ),

              ],
            );
          } else {
            return const Center(child: Text('Error while fetching'));
          }
        })),
      ),
    );
  }
}