import 'package:hakim_hub_mobile/features/hospital/domain/entities/filter_hospital_domain.dart';

/// Model for filtering hospitals.
class FilterHospitalModel extends FilterHospitalDomain {
  /// Number of years the hospital has been active.
  int activeFor;

  /// Whether the hospital is open now.
  bool openNow;

  /// List of services offered by the hospital.
  List<String> services;

  /// Create an instance with provided filter criteria.
  FilterHospitalModel(
      {required this.activeFor, required this.openNow, required this.services})
      : super(
            operationYears: activeFor, openStatus: openNow, services: services);

  /// Convert to JSON map.
  toJson() {
    return {
      'openNow': openStatus,
      'activeFor': operationYears,
      'services': services
    };
  }
}
