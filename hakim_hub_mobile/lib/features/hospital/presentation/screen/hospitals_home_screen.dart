import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/hospital_load_shimmer_effect.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/main_hospitals_card.dart';

import '../../../../core/shared_widgets/formfield.dart';
import '../../../../router/routes.dart';
import '../bloc/bloc/search_hospital_bloc.dart';
import '../widgets/build_chips_widget.dart';
import '../widgets/chips_container.dart';
import '../widgets/filter_page.dart';
import '../widgets/hospital_card.dart';
import '../widgets/search_hospitals_widget.dart';

class HospitalsHomeScreen extends StatefulWidget {
  const HospitalsHomeScreen({super.key});

  @override
  State<HospitalsHomeScreen> createState() => _HospitalsHomeScreenState();
}

class _HospitalsHomeScreenState extends State<HospitalsHomeScreen> {
  List<String> serviceList = [];
  bool isService = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: UIConverter.getComponentWidth(context, 29),
            right: UIConverter.getComponentWidth(context, 19),
            top: UIConverter.getComponentHeight(context, 52),
            bottom: UIConverter.getComponentHeight(context, 29),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hospitals",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 29,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: UIConverter.getComponentHeight(context, 30),
              ),
              SearchHospitalsWidget(
                serviceList: serviceList,
                onChanged: (searchName) {
                  BlocProvider.of<SearchHospitalBloc>(context)
                      .add(HospitalSearchByNameEvent(name: searchName));
                },
                onFilterChanged: (value) {
                  BlocProvider.of<SearchHospitalBloc>(context)
                      .add(HospitalSearchByFilterEvent(filter: value));
                },
              ),
              SizedBox(
                height: UIConverter.getComponentHeight(context, 30),
              ),
              const Text(
                'Nearby Hospitals',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: titleTextColor),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocConsumer<SearchHospitalBloc, SearchHospitalState>(
                      listener: (context, state) {
                        // if (state is SearchHospitalSuccess) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text("successfully loaded"),
                        //     ),
                        //   );
                        // }
                      },
                      builder: (context, state) {
                        if (state is SearchHospitalSuccess) {
                          return Expanded(
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: state.institutionSearchDomain.length,
                                itemBuilder: ((context, index) {
                                  if (isService) {
                                    state
                                        .institutionSearchDomain[index].services
                                        .forEach((element) {
                                      if (!serviceList.contains(element)) {
                                        serviceList.add(element);
                                      }
                                    });
                                  }

                                  if (index ==
                                      state.institutionSearchDomain.length -
                                          1) {
                                    isService = false;
                                  }

                                  return GestureDetector(
                                    child: MainHospitalsCard(
                                      institutionSearchDomain:
                                          state.institutionSearchDomain[index],
                                    ),
                                    onTap: () {
                                      print("object");
                                      print(state
                                          .institutionSearchDomain[index].id);
                                      context.pushNamed(
                                          AppRoutes.HospitalDetailPage,
                                          queryParameters: {
                                            "id": state
                                                .institutionSearchDomain[index]
                                                .id,
                                            "prevIndex": "2"
                                          });
                                    },
                                  );
                                })),
                          );
                        } else if (state is SearchHospitalLoading) {
                          return const HospitalLoadShimmerEffect();
                        } else {
                          return const Center(
                            child: Text("No data"),
                          );
                        }
                      },
                    ),
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
