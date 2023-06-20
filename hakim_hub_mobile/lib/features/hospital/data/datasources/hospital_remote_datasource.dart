

import 'package:hakim_hub_mobile/core/utils/base_url.dart';
import 'package:hakim_hub_mobile/features/hospital/data/models/filter_hospital_model.dart';

import '../models/hospital_search_model.dart';


abstract class HospitalRemoteDataSource {
  Future<List<InstitutionSearchModel>> searchByFilterHospitals(
      FilterHospitalModel filterHospitalModel);

  Future<List<InstitutionSearchModel>> searchByNameHospitals(
      String name);
}

class HospitalRemoteDataSourceImpl implements HospitalRemoteDataSource {
  String baseUrl = getBaseUrl();

  @override
  Future<List<InstitutionSearchModel>> searchByFilterHospitals(FilterHospitalModel filterHospitalModel) {
    

    throw UnimplementedError();
  }

  @override
  Future<List<InstitutionSearchModel>> searchByNameHospitals(String name) {
    throw UnimplementedError();
  }
  

  

}