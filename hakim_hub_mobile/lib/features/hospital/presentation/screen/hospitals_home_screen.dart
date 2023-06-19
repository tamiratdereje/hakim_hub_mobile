import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/main_hospitals_card.dart';

import '../../../../core/shared_widgets/formfield.dart';
import '../../../../router/routes.dart';
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
              const SearchHospitalsWidget(),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                  child: ListView.builder(
                      // shrinkWrap: true,
                      // physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: 15,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          child: MainHospitalsCard(),
                          onTap: () {
                            context.pushNamed(AppRoutes.HospitalDetailPage,
                                queryParameters: {"id": "id"});
                          },
                        );
                      })),
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
