import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_doctor_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/doctor_card.dart';

import '../../../../core/utils/colors.dart';
import '../../../../router/routes.dart';
import '../../domain/entities/filter_doctor_domain.dart';
import 'doctor_filter_page.dart';

class DoctorGridView extends StatefulWidget {
  List<String> filterList;
  final String institutionId;
  Function onFilterChanged;
  List<DoctorDomain> doctors;
  DoctorGridView({
    Key? key,
    required this.doctors,
    required this.filterList,
    required this.onFilterChanged,
    required this.institutionId,
  }) : super(key: key);

  @override
  State<DoctorGridView> createState() => _DoctorGridViewState();
}

class _DoctorGridViewState extends State<DoctorGridView> {
  late List<DoctorDomain> _filteredDoctors;
  GlobalKey<FormFieldState> formkey = GlobalKey<FormFieldState>();
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _filteredDoctors = widget.doctors;
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  List<DoctorDomain> _runFilter(String searchWord, List<DoctorDomain> doctors) {
    if (searchWord.isEmpty) {
      return doctors;
    }
    return doctors
        .where((doctor) =>
            doctor.fullName.toLowerCase().contains(searchWord.toLowerCase()) ||
            doctor.specialities.any((speciality) =>
                speciality.toLowerCase().contains(searchWord.toLowerCase())))
        .toList();
  }

  void _onSearchSubmitted(String value) {
    _searchFocusNode.unfocus();
    setState(() {
      _filteredDoctors = _runFilter(value, widget.doctors);
    });
  }

  void _onSearch(String value) {
    setState(() {
      _filteredDoctors = _runFilter(value, widget.doctors);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: UIConverter.getComponentWidth(context, 10),
        vertical: UIConverter.getComponentHeight(context, 20),
      ),
      child: GestureDetector(
        onTap: () => _searchFocusNode.unfocus(),
        behavior: HitTestBehavior.translucent,
        child: FocusScope(
          child: Column(
            children: [
              FormField(
                key: formkey,
                builder: (FormFieldState state) {
                  return SizedBox(
                    width: UIConverter.getComponentWidth(context, 370),
                    height: UIConverter.getComponentHeight(context, 48),
                    child: TextFormField(
                      focusNode: _searchFocusNode,
                      onChanged: _onSearch,
                      onFieldSubmitted: _onSearchSubmitted,
                      decoration: InputDecoration(
                        hintText: "Search Doctor or Speciality",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: search,
                        suffixIcon: GestureDetector(
                          child: filter,
                          onTap: () async {
                            DoctorFilterDomain doctorFilterDomain =
                                (await showModalBottomSheet<DoctorFilterDomain>(
                              isScrollControlled: true,
                              backgroundColor: titleTextColor,
                              context: context,
                              builder: (BuildContext context) {
                                return DoctorFilterPage(
                                  filterList: widget.filterList,
                                  institutionId: widget.institutionId,
                                );
                              },
                            ))!;
                            print("anything");
                            widget.onFilterChanged(doctorFilterDomain);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: UIConverter.getComponentHeight(context, 20),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: _filteredDoctors.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Change this to 4 for a 4x4 grid
                    crossAxisSpacing:
                        UIConverter.getComponentWidth(context, 17.78),
                    mainAxisSpacing:
                        UIConverter.getComponentHeight(context, 28.31),
                    childAspectRatio:
                        UIConverter.getComponentWidth(context, 179.22) /
                            UIConverter.getComponentHeight(context, 139.69),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final doctor = _filteredDoctors[index];
                    return GestureDetector(
                      child: DoctorCard(
                        imageUrl: doctor.photoUrl,
                        title: doctor.fullName,
                        subtitle: doctor.specialities.join(", "),
                      ),
                      onTap: () {
                        context.pushNamed(
                          AppRoutes.DoctorDetailPage,
                          queryParameters: {"id": doctor.id},
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
