import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/core/shared_widgets/bottom_nav.dart';
import 'package:hakim_hub_mobile/features/core/splash_screen.dart';
import 'package:hakim_hub_mobile/features/doctor/presentation/screen/doctor_detail_page.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/screen/overview_doctor_gallery_page.dart';
import 'package:hakim_hub_mobile/router/routes.dart';

import '../features/onboarding/screens/splash_screen1.dart';

class RouterMain extends StatelessWidget {
  late final GoRouter _router;

  String? redirector(state) {
    return null;
  }

  RouterMain({Key? key}) : super(key: key) {
    _router = GoRouter(
      // redirect: (context, state) => redirector(state),
      initialLocation: AppRoutes.SplashPage,
      routes: <GoRoute>[
        GoRoute(
            path: AppRoutes.Home,
            pageBuilder: (context, state) {
              return MaterialPage(child: BottomNav());
            }),
        GoRoute(
          path: AppRoutes.HospitalDetailPage,
          name: AppRoutes.HospitalDetailPage,
          pageBuilder: (context, state) => MaterialPage(
              child: OverviewDoctorGalleryPage(
                  institutionId: state.queryParameters["id"]!)),
        ),
        GoRoute(
          path: AppRoutes.DoctorDetailPage,
          name: AppRoutes.DoctorDetailPage,
          pageBuilder: (context, state) {
            return  MaterialPage(child: DoctorDetailPage(doctorDetailId: state.queryParameters["id"]!));
          },
        ),
        GoRoute(
          path: AppRoutes.SplashPage,
          pageBuilder: (context, state) =>
              const MaterialPage(child: OnBordingPage()),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // routerDelegate: _router.routerDelegate,
      // routeInformationParser: _router.routeInformationParser,
      title: 'Charge Station Finder',
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
