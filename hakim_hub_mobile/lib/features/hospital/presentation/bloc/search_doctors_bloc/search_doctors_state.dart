import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_doctor_domain.dart';

abstract class SearchBarState {
  final List<DoctorDomain> filteredDoctors;
  SearchBarState(this.filteredDoctors);
}

class SearchInitial extends SearchBarState {
  SearchInitial(super.filteredDoctors);
}

class SearchSuccess extends SearchBarState {
  SearchSuccess(super.filteredDoctors);
}

class SearchError extends SearchBarState {
  final String error;

  SearchError(this.error, super.filteredDoctors);
}
