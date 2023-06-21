
import 'package:get_it/get_it.dart';


import 'package:hakim_hub_mobile/injection/search_hospitals_injection.dart';
final sl = GetIt.instance;

Future<void> init() async {
  await searchHospitalsinit(sl);
}