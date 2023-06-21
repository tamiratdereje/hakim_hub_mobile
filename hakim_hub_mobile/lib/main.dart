import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakim_hub_mobile/features/core/splash_screen.dart';
import 'package:hakim_hub_mobile/router/main_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/shared_widgets/bottom_nav.dart';
import 'features/chatbot/presentation/screen/chat_landing.dart';
import 'features/doctor/presentation/screen/doctor_detail_page.dart';
import 'features/hospital/presentation/bloc/bloc/search_hospital_bloc.dart';

import 'injection/injection.dart' as injection;

void main() async {
  await injection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SearchHospitalBloc>(create: (context) => injection.sl<SearchHospitalBloc>(),)
          ],
          
          child: RouterMain()
          );
      },
    );
  }
}
