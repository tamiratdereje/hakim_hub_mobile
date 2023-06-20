

import 'package:hakim_hub_mobile/features/hospital/domain/entities/filter_hospital_domain.dart';

class FilterHospitalModel extends FilterHospitalDomain{
  

  FilterHospitalModel({required int activeFor, required bool openNow, required List<String> services}):super(activeFor: activeFor, openNow: openNow, services: services);
  
  toJson() {
    return {
      'openNow': openNow,
      'activeFor': activeFor,
      'services': services
    };
  }
}